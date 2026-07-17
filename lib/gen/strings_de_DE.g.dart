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
class TranslationsDeDe extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsDeDe({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.deDe,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <de-DE>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsDeDe _root = this; // ignore: unused_field

  @override
  TranslationsDeDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDeDe(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'de-DE';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Deutsch';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Fehler';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Fehler!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Erfolgreich';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Erfolgreich!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Abbrechen';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Zurück';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Später';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Schließen';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Ja';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nein';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Bitte warten...';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Zeige';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Verbergen';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'An';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Aus';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Hinzufügen';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Ausschließen';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Bearbeiten';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Entfernen';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Speichern';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Löschen';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Bestätigen';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Wiederholen';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Leeren';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopieren';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopiert';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'In Zwischenablage kopiert';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Keine Ergebnisse';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Einfügen';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopierfehler';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Gehe zu den Einstellungen';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Dies kann etwas dauern...';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'App schließen?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Schließe die App';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL Fehler!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Zwischenablage leer!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Öffnen des Links fehlgeschlagen';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Schlüssel';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Nutzer ID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Passwort';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Weiter';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Besuche unseren Discord Server';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Datei';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Auswählen';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Alle auswählen';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Öffnen';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'In neuem Tab öffnen';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Verschieben';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Zufall';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortieren';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Start';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Suche';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Oder (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Seite';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Seite #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Typ';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adresse';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nutzername';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoriten';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';
  @override
  String get secondsShort => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's';
  @override
  String get minutesShort => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm';
  @override
  String get hoursShort => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h';
  @override
  String get daysShort => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'T';
  @override
  String get leaveThisPageQuestion => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Seite verlassen?';
  @override
  String get pageWillCloseAutomatically =>
      TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Diese Seite schließt sich automatisch';
  @override
  String get stay => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Bleiben';
  @override
  String get leaveNow => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Verlassen';
  @override
  late final _Translations$validationErrors$de_DE validationErrors = _Translations$validationErrors$de_DE._(_root);
  @override
  late final _Translations$init$de_DE init = _Translations$init$de_DE._(_root);
  @override
  late final _Translations$permissions$de_DE permissions = _Translations$permissions$de_DE._(_root);
  @override
  late final _Translations$authentication$de_DE authentication = _Translations$authentication$de_DE._(_root);
  @override
  late final _Translations$searchHandler$de_DE searchHandler = _Translations$searchHandler$de_DE._(_root);
  @override
  late final _Translations$snatcher$de_DE snatcher = _Translations$snatcher$de_DE._(_root);
  @override
  late final _Translations$multibooru$de_DE multibooru = _Translations$multibooru$de_DE._(_root);
  @override
  late final _Translations$hydrus$de_DE hydrus = _Translations$hydrus$de_DE._(_root);
  @override
  late final _Translations$tabs$de_DE tabs = _Translations$tabs$de_DE._(_root);
  @override
  late final _Translations$history$de_DE history = _Translations$history$de_DE._(_root);
  @override
  late final _Translations$webview$de_DE webview = _Translations$webview$de_DE._(_root);
  @override
  late final _Translations$settings$de_DE settings = _Translations$settings$de_DE._(_root);
  @override
  late final _Translations$comments$de_DE comments = _Translations$comments$de_DE._(_root);
  @override
  late final _Translations$pageChanger$de_DE pageChanger = _Translations$pageChanger$de_DE._(_root);
  @override
  late final _Translations$tagsFiltersDialogs$de_DE tagsFiltersDialogs = _Translations$tagsFiltersDialogs$de_DE._(_root);
  @override
  late final _Translations$tagsManager$de_DE tagsManager = _Translations$tagsManager$de_DE._(_root);
  @override
  late final _Translations$lockscreen$de_DE lockscreen = _Translations$lockscreen$de_DE._(_root);
  @override
  late final _Translations$loliSync$de_DE loliSync = _Translations$loliSync$de_DE._(_root);
  @override
  late final _Translations$imageSearch$de_DE imageSearch = _Translations$imageSearch$de_DE._(_root);
  @override
  late final _Translations$tagView$de_DE tagView = _Translations$tagView$de_DE._(_root);
  @override
  late final _Translations$pinnedTags$de_DE pinnedTags = _Translations$pinnedTags$de_DE._(_root);
  @override
  late final _Translations$searchBar$de_DE searchBar = _Translations$searchBar$de_DE._(_root);
  @override
  late final _Translations$mobileHome$de_DE mobileHome = _Translations$mobileHome$de_DE._(_root);
  @override
  late final _Translations$desktopHome$de_DE desktopHome = _Translations$desktopHome$de_DE._(_root);
  @override
  late final _Translations$galleryView$de_DE galleryView = _Translations$galleryView$de_DE._(_root);
  @override
  late final _Translations$mediaPreviews$de_DE mediaPreviews = _Translations$mediaPreviews$de_DE._(_root);
  @override
  late final _Translations$viewer$de_DE viewer = _Translations$viewer$de_DE._(_root);
  @override
  late final _Translations$common$de_DE common = _Translations$common$de_DE._(_root);
  @override
  late final _Translations$gallery$de_DE gallery = _Translations$gallery$de_DE._(_root);
  @override
  late final _Translations$galleryButtons$de_DE galleryButtons = _Translations$galleryButtons$de_DE._(_root);
  @override
  late final _Translations$media$de_DE media = _Translations$media$de_DE._(_root);
  @override
  late final _Translations$imageStats$de_DE imageStats = _Translations$imageStats$de_DE._(_root);
  @override
  late final _Translations$preview$de_DE preview = _Translations$preview$de_DE._(_root);
  @override
  late final _Translations$tagType$de_DE tagType = _Translations$tagType$de_DE._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$de_DE extends Translations$validationErrors$en {
  _Translations$validationErrors$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Bitte Wert eingeben';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Bitte gültigen Wert eingeben';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Bitte Zahl eingeben';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Bitte gültige Zahl eingeben';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Bitte Wert größer ${min} eingeben';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Bitte Wert kleiner ${max} eingeben';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Bitte Wert zwischen ${min} und ${max} eingeben';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Bitte Wert >=0 eingeben';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Bitte Wert kleiner als 4 eingeben';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Bitte Wert größer als 100 eingeben';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Mehr als 4 Spalten können die Leistung beeinträchtigen';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Mehr als 8 Spalten können die Leistung beeinträchtigen';
}

// Path: init
class _Translations$init$de_DE extends Translations$init$en {
  _Translations$init$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialisierungsfehler!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Richte Proxy ein...';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Lade Datenbank...';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Lade Boorus...';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Lade Tags...';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Wiederherstellung von Tabs...';
}

// Path: permissions
class _Translations$permissions$de_DE extends Translations$permissions$en {
  _Translations$permissions$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Kein Zugriff auf gewählten Speicherort';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Bitte Speicherort erneut wählen um der App Zugriff zu gewähren';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Speicherort: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Wähle Speicherort';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Nicht auf dieser Plattform verfügbar';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Setze Speicherort zurück';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Dateien werden nach dem Zurücksetzen in das Standardverzeichnis gespeichert';
}

// Path: authentication
class _Translations$authentication$de_DE extends Translations$authentication$en {
  _Translations$authentication$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Bitte authentifizieren um die App zu nutzen';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Keine biometrische Hardware verfügbar';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Temporäre Sperre';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Bei der Authentifizierung gab es einen Fehler: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$de_DE extends Translations$searchHandler$en {
  _Translations$searchHandler$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Letzten Tab entfernt';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Auf Standard Tags zurückgesetzt';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Einstufung geändert';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'In ${booruType} wurde [rating:safe] durch [rating:general] und [rating:sensitive] ersetzt';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Einstufung wurde automatisch korrigiert. Nutze die korrekte Einstufung in zukünftigen Suchen';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabs wiederhergestellt';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Tab aus vorheriger Sitzung wiederhergestellt',
        few: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
        many: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
        other: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Einige wiederhergestellte Tabs enthielten unbekannte Boorus oder Zeichen.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Sie wurden ignoriert oder auf Standardeinstellungen zurückgesetzt.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Liste fehlerhafter Tabs:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabs zusammengeführt';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} neue Tabs hinzugefügt',
        few: '${count} neue Tabs hinzugefügt',
        many: '${count} neue Tabs hinzugefügt',
        other: '${count} neue Tabs hinzugefügt',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabs ersetzt';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Tab erhalten',
        few: '${count} Tabs erhalten',
        many: '${count} Tabs erhalten',
        other: '${count} Tabs erhalten',
      );
}

// Path: snatcher
class _Translations$snatcher$de_DE extends Translations$snatcher$en {
  _Translations$snatcher$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Download-Historie';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Tags eingeben';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Anzahl';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Anzahl zu ladender Dateien';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Verzögerung (in ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Verzögerung zwischen den Downloads';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Lade die Dateien herunter';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Datei wurde bereits heruntergeladen';
  @override
  String get failedToSnatchItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Datei konnte nicht heruntergeladen werden';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Datei-Download abgebrochen';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starte mit nächster Datei...';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Heruntergeladene Dateien';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Heruntergeladen: ${count} Datei',
        few: 'Heruntergeladen: ${count} Dateien',
        many: 'Heruntergeladen: ${count} Dateien',
        other: 'Heruntergeladen: ${count} Dateien',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Datei wurde bereits heruntergeladen',
        few: '${count} Dateien wurden bereits heruntergeladen',
        many: '${count} Dateien wurden bereits heruntergeladen',
        other: '${count} Dateien wurden bereits heruntergeladen',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Fehler beim Herunterladen von ${count} Datei',
        few: 'Fehler beim Herunterladen von ${count} Dateien',
        many: 'Fehler beim Herunterladen von ${count} Dateien',
        other: 'Fehler beim Herunterladen von ${count} Dateien',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Datei abgebrochen',
        few: '${count} Dateien abgebrochen',
        many: '${count} Dateien abgebrochen',
        other: '${count} Dateien abgebrochen',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Bilder herunterladen';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Die App nicht schließen!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Datei zu Downloads hinzugefügt';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Datei zu Downloads hinzugefügt',
        few: '${count} Dateien zu Downloads hinzugefügt',
        many: '${count} Dateien zu Downloads hinzugefügt',
        other: '${count} Dateien zu Downloads hinzugefügt',
      );
}

// Path: multibooru
class _Translations$multibooru$de_DE extends Translations$multibooru$en {
  _Translations$multibooru$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru-Modus';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Benötigt mindestens 2 Boorus';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Wähle zusätzliche Boorus:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'bekannt als Multibooru-Modus';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Sekundäre Boorus wählen';
}

// Path: hydrus
class _Translations$hydrus$de_DE extends Translations$hydrus$en {
  _Translations$hydrus$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Fehler beim Import zu Hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Wahrscheinlich wurden nicht die benötigten API Rechte vergeben. Diese können in den Review Services bearbeitet werden.';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Tags zur Datei hinzufügen';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLs hinzufügen';
}

// Path: tabs
class _Translations$tabs$de_DE extends Translations$tabs$en {
  _Translations$tabs$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tab';
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Boorus in den Einstellungen hinzufügen';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Booru auswählen';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Sekundäre Boorus';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Neuen Tab hinzufügen';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Booru wählen oder frei lassen';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'An Position hinzufügen';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'vorheriger Tab';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'nächster Tab';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Ende der Liste';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Genutzte Suchbegriffe';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Standard';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'momentane';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Individuell';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Individuelle Suchanfrage';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[leer]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Sekundäre Boorus hinzufügen';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Sekundäre Boorus beibehalten';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Mit anderer Seitenzahl starten';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Zum neuen Tab wechseln';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Hinzufügen';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tab-Manager';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Auswahlmodus';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Tabs sortieren';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Hilfe';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Tabs löschen';
  @override
  String get deleteDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Tab-Duplikate löschen';
  @override
  String get deleteDuplicateTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
      'Tab-Duplikate gefunden. Tabs auswählen, welche behalten werden sollen:';
  @override
  String get keepFirstDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Ersten behalten';
  @override
  String get keepLastDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Letzten behalten';
  @override
  String get skipDuplicateTabDelete => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Überspringen';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Tabs zufällig anordnen';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Tabs zufällig angeordnet';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tabreihenfolge gespeichert';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Zum aktiven Tab scrollen';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Zum Anfang scrollen';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Zum Ende scrollen';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Nach Booru, Status, Duplikaten und mehr filtern';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scrolling:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortieren:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Standard-Sortierung';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortierung Alphabetisch';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortierung Alphabetisch (invertiert)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortierung nach Booru-Name';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortierung nach Booru-Name (invertiert)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
      'Lange auf den Sortier-Button drücken, um die aktuelle Reihenfolge zu speichern';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Auswahlmodus:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Auswahlmodus de-/aktivieren';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Am unteren Bildschirmrand:';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Alle Tabs aus-/abwählen';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Ausgewählte Tabs löschen';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Tab gedrückt halten, um ihn zu verschieben';
  @override
  String get numbersInBottomRight => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Zahlen unten rechts vom Tab:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Erste Zahl - Tabnummer in der Standard-Sortierung';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Zweite Zahl - Tabnummer in der momentanen Tab-Sortierung; erscheint wenn Filter/ Sortierung aktiv sind';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Spezialfilter:';
  @override
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Geladen» - Zeige Tabs mit geladenen Posts';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«Nicht Geladen» - Zeige nicht geladene Tabs oder welche ohne Posts';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Nicht geladene tabs sind kursiv';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Keine Tabs gefunden';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopieren';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Verschieben';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Entfernen';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Mischen';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortieren';
  @override
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Tabs zufällig mischen?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Speichere Tabs in dieser Sortierfolge?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Nach Booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alphabetisch';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertiert)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Bist du sicher, dass du ${count} Tab löschen willst?',
        few: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
        many: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
        other: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
      );
  @override
  late final _Translations$tabs$filters$de_DE filters = _Translations$tabs$filters$de_DE._(_root);
  @override
  late final _Translations$tabs$move$de_DE move = _Translations$tabs$move$de_DE._(_root);
}

// Path: history
class _Translations$history$de_DE extends Translations$history$en {
  _Translations$history$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Suchverlauf';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Suchverlauf ist leer';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Suchverlauf ist ausgeschaltet';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      'Datenbank in den Einstellungen für den Suchverlauf aktivieren';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Letzte Suche: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Letze Suche: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Unbekannter Booru-Typ!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Unbekannter booru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Öffnen';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'In neuen Tab öffnen';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Aus Favoriten entfernen';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Als Favorit setzen';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopieren';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Löschen';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Lösche Verlaufseinträge';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Eintrag wirklich löschen?',
        few: '${count} Einträge wirklich löschen?',
        many: '${count} Einträge wirklich löschen?',
        other: '${count} Einträge wirklich löschen?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Auswahl entfernen';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Lösche ${count} Eintrag',
        few: 'Lösche ${count} Einträge',
        many: 'Lösche ${count} Einträge',
        other: 'Lösche ${count} Einträge',
      );
}

// Path: webview
class _Translations$webview$de_DE extends Translations$webview$en {
  _Translations$webview$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webansicht';
  @override
  String get notSupportedOnDevice =>
      TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Auf diesem Gerät nicht unterstützt';
  @override
  String get captcha => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha';
  @override
  String get captchaCheckDescription =>
      TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
      'Mögliches Captcha detektiert, Bitte lösen und nach Abschluss zurückkehren';
  @override
  String get captchaCompleted => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha durchgeführt';
  @override
  late final _Translations$webview$navigation$de_DE navigation = _Translations$webview$navigation$de_DE._(_root);
}

// Path: settings
class _Translations$settings$de_DE extends Translations$settings$en {
  _Translations$settings$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Einstellungen';
  @override
  late final _Translations$settings$language$de_DE language = _Translations$settings$language$de_DE._(_root);
  @override
  late final _Translations$settings$booru$de_DE booru = _Translations$settings$booru$de_DE._(_root);
  @override
  late final _Translations$settings$booruEditor$de_DE booruEditor = _Translations$settings$booruEditor$de_DE._(_root);
  @override
  late final _Translations$settings$interface$de_DE interface = _Translations$settings$interface$de_DE._(_root);
  @override
  late final _Translations$settings$theme$de_DE theme = _Translations$settings$theme$de_DE._(_root);
  @override
  late final _Translations$settings$viewer$de_DE viewer = _Translations$settings$viewer$de_DE._(_root);
  @override
  late final _Translations$settings$video$de_DE video = _Translations$settings$video$de_DE._(_root);
  @override
  late final _Translations$settings$downloads$de_DE downloads = _Translations$settings$downloads$de_DE._(_root);
  @override
  late final _Translations$settings$database$de_DE database = _Translations$settings$database$de_DE._(_root);
  @override
  late final _Translations$settings$backupAndRestore$de_DE backupAndRestore = _Translations$settings$backupAndRestore$de_DE._(_root);
  @override
  late final _Translations$settings$network$de_DE network = _Translations$settings$network$de_DE._(_root);
  @override
  late final _Translations$settings$privacy$de_DE privacy = _Translations$settings$privacy$de_DE._(_root);
  @override
  late final _Translations$settings$performance$de_DE performance = _Translations$settings$performance$de_DE._(_root);
  @override
  late final _Translations$settings$cache$de_DE cache = _Translations$settings$cache$de_DE._(_root);
  @override
  late final _Translations$settings$itemFilters$de_DE itemFilters = _Translations$settings$itemFilters$de_DE._(_root);
  @override
  late final _Translations$settings$sync$de_DE sync = _Translations$settings$sync$de_DE._(_root);
  @override
  late final _Translations$settings$about$de_DE about = _Translations$settings$about$de_DE._(_root);
  @override
  late final _Translations$settings$checkForUpdates$de_DE checkForUpdates = _Translations$settings$checkForUpdates$de_DE._(_root);
  @override
  late final _Translations$settings$logs$de_DE logs = _Translations$settings$logs$de_DE._(_root);
  @override
  late final _Translations$settings$help$de_DE help = _Translations$settings$help$de_DE._(_root);
  @override
  late final _Translations$settings$debug$de_DE debug = _Translations$settings$debug$de_DE._(_root);
  @override
  late final _Translations$settings$logging$de_DE logging = _Translations$settings$logging$de_DE._(_root);
  @override
  late final _Translations$settings$webview$de_DE webview = _Translations$settings$webview$de_DE._(_root);
  @override
  late final _Translations$settings$dirPicker$de_DE dirPicker = _Translations$settings$dirPicker$de_DE._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version';
}

// Path: comments
class _Translations$comments$de_DE extends Translations$comments$en {
  _Translations$comments$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Kommentare';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Keine Kommentare';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
      'Dieses Booru hat keine Kommentare oder es existiert keine API dafür';
}

// Path: pageChanger
class _Translations$pageChanger$de_DE extends Translations$pageChanger$en {
  _Translations$pageChanger$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Seite ändern';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Seite #';
  @override
  String get delayBetweenLoadings => TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Ladeverzögerung (ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Verzögerung in ms';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Aktuelle Seite #${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Mögliche max. Seite #~${number}';
  @override
  String get searchCurrentlyRunning => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Suche läuft gerade!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Zu Seite springen';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Suche bis Seite';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Suche stoppen';
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$de_DE extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Keine Eingabe!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Neuen ${type} Filter hinzufügen]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Neuer ${type} Tag-Filter';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Neuer Filter';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Filter bearbeiten';
}

// Path: tagsManager
class _Translations$tagsManager$de_DE extends Translations$tagsManager$en {
  _Translations$tagsManager$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Tag hinzufügen';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Name';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Typ';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Hinzufügen';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Abgelaufen nach: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Tab hinzugefügt';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Tab hinzufügen';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopieren';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Auf abgelaufen setzen';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Auf nicht abgelaufen setzen';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Nicht ablaufbar machen';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} Tag löschen',
        few: '${count} Tags löschen',
        many: '${count} Tags löschen',
        other: '${count} Tags löschen',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Tags löschen';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Auswahl aufheben';
}

// Path: lockscreen
class _Translations$lockscreen$de_DE extends Translations$lockscreen$en {
  _Translations$lockscreen$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Zur Authentifizierung antippen';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV-Entsperrung';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[Testen]: Hier tippen, wenn die App nicht auf normalem Wege entsperrt werden kann. Informiere den Entwickler mit Details zu dem Gerät.';
}

// Path: loliSync
class _Translations$loliSync$de_DE extends Translations$loliSync$en {
  _Translations$loliSync$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sync';
  @override
  String get stopSyncingQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Soll die Synchronisierung gestoppt werden?';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Soll der Server gestoppt werden?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Keine Verbindung';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Warten auf Verbindung...';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starten des Servers...';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Bildschirm aktiv halten';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Sync-Server abgeschaltet';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Testfehler: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Testfehler: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Testanfrage wurde positiv beantwortet';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Es sollte eine "Test" Nachricht auf dem anderen Gerät geben.';
}

// Path: imageSearch
class _Translations$imageSearch$de_DE extends Translations$imageSearch$en {
  _Translations$imageSearch$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Bildsuche';
}

// Path: tagView
class _Translations$tagView$de_DE extends Translations$tagView$en {
  _Translations$tagView$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Kommentare';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Zeige (${count}) Anmerkungen';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Verberge (${count}) Anmerkungen';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Lade Anmerkungen';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Dieser Tag ist bereits in der aktuellen Suchanfrage:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Zur aktuellen Suchanfrage hinzugefügt:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Neuen Tab hinzugefügt:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Post-URL';
  @override
  String get uploader => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Veröffentlicht';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Details';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Dateiname';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Dateierweiterung';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Auflösung';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Größe';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Einstufung';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Bewertung';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Keine Tags gefunden';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopieren';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Von Suche entfernen';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Zur Suche hinzufügen';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Zur Suchleiste hinzugefügt:';
  @override
  String get excludeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Von Suche ausschließen';
  @override
  String get exclusionAddedToSearchBar =>
      TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Ausschluss zur Suchleiste hinzugefügt:';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Zu markiert hinzufügen';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Zu verbergen hinzufügen';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Von markiert entfernen';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Von verbergen entfernen';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Tag bearbeiten';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Quelle';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Vorschau';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Booru zum Laden auswählen';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Vorschau wird geladen...';
  @override
  String get failedToLoadPreview =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Laden der Vorschau fehlgeschlagen';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Zum erneuten Versuchen antippen';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Datei-URL in die Zwischenablage kopiert';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Vorschau taggen';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Aktueller Status';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Historie';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Laden der Vorschauseite fehlgeschlagen';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Erneut versuchen';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Gefundene Links:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Verwandte Tabs';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Tabs mit nur diesem Tag';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'Tabs mit nur diesem Tag, aber auf anderem Booru';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Tabs die diesen Tag enthalten';
}

// Path: pinnedTags
class _Translations$pinnedTags$de_DE extends Translations$pinnedTags$en {
  _Translations$pinnedTags$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Angepinnte Tags';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Tag anpinnen';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Tag nicht anpinnen';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Anpinnen';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Nicht anpinnen';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» für schnellen Zugriff anpinnen?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '«${tag}» von angepinnten Tags entfernen?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Nur für ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Label (optional)';
  @override
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ??
      'Eingeben und den Hinzufügen-Button antippen, um Label hinzuzufügen';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Existierendes Label auswählen';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag angepinnt';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Angepinnt für ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Global angepinnt ${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag nicht mehr angepinnt';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Alle';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Angepinnte Tags sortieren';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Speichern...';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Sortieren';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Tag manuell hinzufügen';
  @override
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Keine Tags passen zur Suche';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Bisher keine angepinnten Tags';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Label bearbeiten';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Label';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Angepinnten Tag hinzufügen';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Tag-Abfrage';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'Tag_Name';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
      'Es kann jede Suchanfrage eingegeben werden, auch Tags mit Leerzeichen';
}

// Path: searchBar
class _Translations$searchBar$de_DE extends Translations$searchBar$en {
  _Translations$searchBar$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Nach Tags suchen';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Vorschläge konnten nicht geladen werden. Für erneuten Versuch antippen${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Keine Vorschläge gefunden';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Tag-Vorschläge sind für dieses Booru nicht verfügbar';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '«${tag}» in Zwischenablage kopiert';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Präfix';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Ausschließen (-)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Meta-Tags';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Freie Meta-Tags';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Freie Meta-Tags zählen nicht in die Tag-Suchbegrenzung';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Frei';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Einzeln';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Bereich';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Beliebt';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Datum auswählen';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Datumsbereich auswählen';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Historie';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...';
}

// Path: mobileHome
class _Translations$mobileHome$de_DE extends Translations$mobileHome$en {
  _Translations$mobileHome$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Booru für Webansicht auswählen';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'App sperren';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Datei existiert bereits';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Download fehlgeschlagen';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Abbruch durch Nutzer';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Trotzdem speichern';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Überspringen';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Alle (${count}) erneut versuchen';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
      'Existierende, fehlgeschlagene oder abgebrochene Einträge';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Alle wiederholbaren Einträge löschen';
}

// Path: desktopHome
class _Translations$desktopHome$de_DE extends Translations$desktopHome$en {
  _Translations$desktopHome$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Downloader';
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Boorus in den Einstellungen hinzufügen';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Einstellungen';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Speichern';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Keine Posts ausgewählt';
}

// Path: galleryView
class _Translations$galleryView$de_DE extends Translations$galleryView$en {
  _Translations$galleryView$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Keine Posts';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Kein Post ausgewählt';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Schließen';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$de_DE extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Keine Booru-Konfiguration gefunden';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Neues Booru hinzufügen';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Hilfe';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Einstellungen';
  @override
  String get onboardingTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Richte dein erstes Booru ein';
  @override
  String get onboardingSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
      'Um mit dem Browsen zu beginnen, füge eine Booru Konfiguration hinzu oder lade eine Sicherung';
  @override
  String get addBooruAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Booru hinzufügen';
  @override
  String get addBooruActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
      'Füge mittels URL und Sucheinstellungen eine Seite hinzu';
  @override
  String get restoreBackupAction =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Sicherung laden und verwalten';
  @override
  String get restoreBackupActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
      'Wiederherstellung von Einstellungen, Boorus, Tabs und Daten';
  @override
  String get openSettingsAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Einstellungen öffnen';
  @override
  String get openSettingsActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
      'App-Verhalten vor Einrichtung der Boorus verändern';
  @override
  String get helpSectionTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Hilfe nötig?';
  @override
  String get booruSourcesArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
      'Wie eine Booru Konfiguration funktioniert und eingerichtet wird';
  @override
  String get booruSourcesArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
      'Anleitung zur erstmaligen Einrichtung einer Booru Konfiguration';
  @override
  String get backupRestoreArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Daten aus einer Sicherung wiederherstellen';
  @override
  String get backupRestoreArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
      'Anleitung zum Wechsel von einer früheren App-Version';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Vorherige Sitzung wiederherstellen...';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Datei-URL in Zwischenablage kopiert!';
}

// Path: viewer
class _Translations$viewer$de_DE extends Translations$viewer$en {
  _Translations$viewer$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$tutorial$de_DE tutorial = _Translations$viewer$tutorial$de_DE._(_root);
  @override
  late final _Translations$viewer$appBar$de_DE appBar = _Translations$viewer$appBar$de_DE._(_root);
  @override
  late final _Translations$viewer$notes$de_DE notes = _Translations$viewer$notes$de_DE._(_root);
}

// Path: common
class _Translations$common$de_DE extends Translations$common$en {
  _Translations$common$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Booru auswählen';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru-Eintrag in die Zwischenablage kopiert';
}

// Path: gallery
class _Translations$gallery$de_DE extends Translations$gallery$en {
  _Translations$gallery$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Herunterladen?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Keine Post-URL!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Lade Datei herunter...';
  @override
  String get loadingFileMessage => TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Dies kann dauern, bitte warten...';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Quelle',
        few: 'Quellen',
        many: 'Quellen',
        other: 'Quellen',
      );
}

// Path: galleryButtons
class _Translations$galleryButtons$de_DE extends Translations$galleryButtons$en {
  _Translations$galleryButtons$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Herunterladen';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favorisieren';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Teilen';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Auswählen';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'In Browser öffnen';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Diashow';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Skalierung wechseln';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Qualität wechseln';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Externer Player';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Bildsuche';
}

// Path: media
class _Translations$media$de_DE extends Translations$media$en {
  _Translations$media$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$loading$de_DE loading = _Translations$media$loading$de_DE._(_root);
  @override
  late final _Translations$media$video$de_DE video = _Translations$media$video$de_DE._(_root);
}

// Path: imageStats
class _Translations$imageStats$de_DE extends Translations$imageStats$en {
  _Translations$imageStats$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktiv: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Ausstehend: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Gesamt: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Größe: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}';
}

// Path: preview
class _Translations$preview$de_DE extends Translations$preview$en {
  _Translations$preview$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$de_DE error = _Translations$preview$error$de_DE._(_root);
}

// Path: tagType
class _Translations$tagType$de_DE extends Translations$tagType$en {
  _Translations$tagType$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Künstler';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Charakter';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Urheberrecht';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Spezies';
  @override
  String get lore => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Hintergrundwissen';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Kein/Allgemein';
}

// Path: tabs.filters
class _Translations$tabs$filters$de_DE extends Translations$tabs$filters$en {
  _Translations$tabs$filters$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Geladen';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tag Typ';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikate';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Auf dem gleichen Booru nach Duplikaten suchen';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Leeres Suchfeld';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tab Filter';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Alle';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nicht geladen';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Aktiviert';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Deaktiviert';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Aktiviert auch Sortieren';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      'Tabs filtern, welche mindestens einen Tag dieses Typs besitzen';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Beliebig';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Anwenden';
}

// Path: tabs.move
class _Translations$tabs$move$de_DE extends Translations$tabs$move$en {
  _Translations$tabs$move$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Nach oben bewegen';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Nach unten bewegen';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tab-Nummer';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Ungültige Tab-Nummer';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Ungültige Eingabe';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Außer Reichweite';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Bitte gültige Tab-Nummer eingeben';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Verschieben nach #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Vorschau:';
}

// Path: webview.navigation
class _Translations$webview$navigation$de_DE extends Translations$webview$navigation$en {
  _Translations$webview$navigation$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'URL eingeben';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Eigene URL eingeben';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navigiere zu ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Cookies auflisten';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cookies löschen';
  @override
  String get cookiesGone =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Es gab Kekse (Cookies). Jetzt, sind sie weg';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Lade Favicon';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Kein Favicon gefunden';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(obriger Text ist auswählbar)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URL kopieren';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL in Zwischenablagen kopiert';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Verlauf';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Keine vorige Seite verfügbar';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Keine nächste Seite verfügbar';
}

// Path: settings.language
class _Translations$settings$language$de_DE extends Translations$settings$language$en {
  _Translations$settings$language$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Sprache';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Hilf uns zu übersetzen';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Für mehr Infos besuche <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> oder tippe auf das Bild unten um zum POEditor zu gelangen';
}

// Path: settings.booru
class _Translations$settings$booru$de_DE extends Translations$settings$booru$en {
  _Translations$settings$booru$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus und Suche';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Standard-Tags';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Geladene Posts pro Seite';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Einige Boorus können das ignorieren';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru Konfiguration hinzufügen';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booru Konfiguration teilen';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Teile ${booruName} Konfiguration als Link.\n\nMit login/API Schlüssel?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Kopiere ${booruName} Konfiguration in die Zwischenablage.\n\nMit login/API Schlüssel?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru teilen';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'So werden Booru-Konfigurationslinks unter Android 12 und höher automatisch in der App geöffnet:\n1) Tippe den Button unten, um die Standardeinstellungen deines Gerätes für diese App zu öffnen.\n2) Aktiviere das automatische Öffnen von unterstützten Links mit dieser App.';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Hinzugefügte Boorus';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Bearbeite Booru Konfiguration';
  @override
  String get importBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importiere Booru Konfiguration aus der Zwischenablage';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Nur loli.snatcher URLs werden unterstützt';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Lösche Booru Konfiguration';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
      'Etwas ist während des Löschens einer Booru Konfiguration schiefgelaufen!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru Konfiguration gelöscht';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Das hier ausgewählte Booru wird nach dem Speichern das Standard-Booru.\n\nDas Standard-Booru ist der erste Eintrag in den Auswahlfeldern.';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Standard-Booru ändern?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Ändere zu: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tippe [Nein] um aktuelles zu behalten: ';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tippe [Ja], um auszuwählen: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
      'Booru-Konfigurationslink in die Zwischenablage kopiert';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Kein Booru ausgewählt!';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Kann dieses Booru nicht löschen!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Entferne zuerst alle verwandten Tabs';
  @override
  String get sourceLimitNotice =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ??
      'Das Verhalten beim Einrichten der Boorus kann von den unten aufgeführten Kompatibiltätseinstellungen abhängen. Der Inhalt wird von externen Websites zur Verfügung gestellt und nicht von dieser App.';
  @override
  String get advanced => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Erweitert';
  @override
  String get expandedSourceCompatibility =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Kompatibilität bei der Booru-Einrichtung';
  @override
  String get expandedSourceCompatibilitySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
      'Ändere wie die Kompatibilitätseinstellungen angewendet werden';
  @override
  String get expandedSourceCompatibilityConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ??
      'Dies zu ändern kann die Funktion der Boorus beeinflussen. Der Inhalt wird von externen Websites zur Verfügung gestellt und nicht von dieser App. Fortfahren?';
  @override
  String get sourceUnavailableCurrentSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Diese Seite ist nicht verfügbar.';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$de_DE extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Einstellungen';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru-Test fehlgeschlagen';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Die Konfigurationsparameter könnten inkorrekt sein, das Booru erlaubt keinen API Zugriff, die Anfrage hat keine Daten zurück erhalten oder es gab einen Netzwerkfehler.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booru speichern';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Wird getestet…';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Diese Boorukonfiguration existiert bereits';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
      'Boorukonfiguration mit gleichen Namen existiert bereits';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
      'Boorukonfiguration mit gleicher URL existiert bereits';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
      'Diese Boorukonfiguration wird nicht hinzugefügt';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Boorukonfiguration gespeichert';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Vorhandene Tabs mit diesem Booru müssen neu geladen werden, um die Änderungen anzuwenden!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
      'Verifizierung von API-Zugriff für Hydrus fehlgeschlagen';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Zugangsschlüssel angefordert';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Drücke OK in Hydrus und dann anwenden. Du kannst dannach \'Booru testen\' drücken.';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Zugangsschlüssel nicht erhalten';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Hast du in Hydrus das Anfragefenster geöffnet?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Um den Hydrus-Schlüssel zu bekommen, musst du den Anfragedialog im Hydrus-Client öffnen. Services > Review Services > Client API > Hinzufügen > Von API-Anfrage';
  @override
  String get getHydrusApiKey =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus-API-Schlüssel abrufen';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name ist erforderlich!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL';
  @override
  String get booruUrlRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL ist erforderlich!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Typ';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Wird automatisch ausgefüllt wenn leer)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Standard Tags';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Standardsuche für Booru';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'Untere Felder können erforderlich sein für manche Boorus';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Bestätige das Speichern der Boorukonfiguration';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Ausgewählter/Erkannter Booru-Typ: ${booruType}';
}

// Path: settings.interface
class _Translations$settings$interface$de_DE extends Translations$settings$interface$en {
  _Translations$settings$interface$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Oberfläche';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'App UI Modus';
  @override
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'App UI Modus';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Desktop Modus nutzen? Kann Fehler auf Mobilgeräten verursachen. VERALTET.';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobilgerät - Normale UI für Mobilgeräte';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Ahoviewer UI Stil [VERALTET, BEARBEITUNG NÖTIG]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Warnung]: Ändere den UI Modus nicht zu Desktop auf einem Mobilgerät. Dies kann die App unbrauchbar machen und erfordert möglicherweise die Einstellungen inklusive Boorukonfigurationen zurückzusetzen.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Appnutzung linke/rechte Hand';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Passt Positionen der UI Elemente an ausgewählte Seite an';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Zeige Suchleiste in der Vorschau-Ansicht';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
      'Eingabefeld in der Suchansicht nach oben verschieben';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Schnellbefehle in der Suchansicht anzeigen';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Suchfeld automatisch für Eingabe fokussieren';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Vibration ausschalten';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? 'Kann bei manchen Aktionen trotzdem auftreten';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Zurückgeste vorhersagen';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Vorschauspalten (Hochformat)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Vorschauspalten (Querformat)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Vorschauqualität';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Ändert Bildauflösung in der Vorschau-Ansicht';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Muster - Mittlere Auflösung; Als Platzhalter wird ein Thumbnail verwendet, bis die höhere Auflösung geladen wurde.';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Thumbnail - Geringe Auflösung';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Anmerkung]: Musterqualität kann die App-Leistung spürbar verschlechtern. Dies gilt vor allem, wenn zu viele Spalten in der Vorschau-Ansicht verwendet werden.';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Anzeigeart Vorschau-Ansicht';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Ersatz Anzeigeart Vorschau-Ansicht';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Diese Anzeigeart wird als Ersatz genutzt, wenn die gestufte Option nicht möglich ist';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Bilder nicht skalieren';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Kann App-Leistung verschlechtern';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Warnung';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Bist du sicher, dass du die Bildskalierung deaktivieren möchtest?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Dies kann v.a. auf älteren Geräten die App-Leistung verschlechtern.';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF Thumbnails';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Benötigt Aktivieren von «Bilder nicht skalieren»';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Position der Scroll-Buttons';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Mausrad Scroll Modifikation';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Scroll Modifikation';
  @override
  late final _Translations$settings$interface$previewQualityValues$de_DE previewQualityValues =
      _Translations$settings$interface$previewQualityValues$de_DE._(_root);
  @override
  late final _Translations$settings$interface$previewDisplayModeValues$de_DE previewDisplayModeValues =
      _Translations$settings$interface$previewDisplayModeValues$de_DE._(_root);
  @override
  late final _Translations$settings$interface$appModeValues$de_DE appModeValues = _Translations$settings$interface$appModeValues$de_DE._(_root);
  @override
  late final _Translations$settings$interface$handSideValues$de_DE handSideValues = _Translations$settings$interface$handSideValues$de_DE._(_root);
}

// Path: settings.theme
class _Translations$settings$theme$de_DE extends Translations$settings$theme$en {
  _Translations$settings$theme$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Design';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Design-Modus';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Schwarzer Hintergrund';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Dynamische Farben verwenden';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Nur Android 12 und höher';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Design';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primäre Farbe';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Sekundäre Farbe';
  @override
  String get enableDrawerMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Maskottchen in der App anzeigen';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Eigenes Maskottchen einrichten';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Eigenes Maskottchen löschen';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Datei-Pfad zum Maskottchen';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Systemeinstellung';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Hell';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Dunkel';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pink';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Lila';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blau';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Türkis';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Rot';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Grün';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Eigenes';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Farbe auswählen';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Ausgewählte Farbe';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Ausgewählte Farbe und Schattierungen';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Schriftart';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Systemeinstellung';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'mehr Schriftarten anzeigen';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Der schnelle braune Fuchs springt über den faulen Frosch';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Eigene Schriftart';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Beliebigen Google-Schriftartnamen eingeben';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Schriftartname';
  @override
  String get customFontHint =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Schriftarten bei fonts.google.com durchsuchen';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Schriftart nicht gefunden';
}

// Path: settings.viewer
class _Translations$settings$viewer$de_DE extends Translations$settings$viewer$en {
  _Translations$settings$viewer$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Im Voraus laden Anzahl';
  @override
  String get preloadSizeLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Im Voraus laden Dateigrößenlimit';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 für kein Limit';
  @override
  String get preloadHeightLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Vorausladen Höhenlimit';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in Pixel, 0 für kein Limit';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Bildqualität';
  @override
  String get viewerScrollDirection => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Scrollrichtung';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Position Werkzeugleiste';
  @override
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Position Zoom Button';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Position Seiten Button';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
      'Werkzeugleiste ausblenden, wenn Viewer geöffnet wird';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Details standardmäßig ausklappen';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ??
      'Übersetzungsanmerkungen standardmäßig ausblenden';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Rotation erlauben';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Zum Zurücksetzen doppelt antippen';
  @override
  String get toolbarButtonsOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Button-Reihenfolge in der Werkzeugleiste';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Button-Reihenfolge';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Gedrückt halten, um die Reihenfolge zu ändern.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Es werden immer 4 Buttons von dieser Liste in der Werkzeugleiste sichtbar sein.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Die anderen Buttons sind über das Menü (3 Punkte) erreichbar.';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Zum Bewegen gedrückt halten';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Nur für Videos';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Dieser Button kann nicht deaktiviert werden';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Standardaktion für das Teilen';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Teilen-Aktionen';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Fragen - immer fragen was geteilt werden soll';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Post URL';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- Datei URL - teilt den Direktlink zur originalen Datei (funktioniert auf manchen Seiten nicht)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Post URL/ Datei URL/ Datei mit Tags - teilt URL, Datei und ausgewählte Tags';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Datei - teilt die Datei, kann Zeit zum Laden benötigen, Fortschritt wird auf dem Button dargestellt';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - sendet Post URL an Hydrus für den Import';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Anmerkung]: Wenn die Datei im Cache vorhanden ist, wird sie von dort geladen. Ansonsten wird sie erneut aus dem Netzwerk geladen.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Tipp]: Die Optionen für das Teilen können durch langes Drücken auf den Teilen-Button aufgerufen werden.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Lautstärketasten zum Scrollen benutzen';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Scrollen mit Lautstärketasten';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Nutze die Lautstärketasten, um durch die Vorschau-Ansicht und den Viewer zu scrollen.';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Lautstärke runter - nächster Post';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Lautstärke hoch - vorheriger Post';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Im Viewer:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
      ' - Werkzeugleiste sichtbar - Lautstärke wird gesteuert';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Werkzeugleiste nicht sichtbar - Scrolling wird gesteuert';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Scroll-Geschwindigkeit der Lautstärketasten';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Diashow-Dauer (in ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Diashow';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Videos/GIFs: nur manuelles Scrollen';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Sperren des Gerätes verhindern';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Viewer Öffnen/Schließen Animation';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Viewer Seitenänderung Animation';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Standardanimation verwenden';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Eigene Animation verwenden';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna Lade-GIF';
  @override
  late final _Translations$settings$viewer$imageQualityValues$de_DE imageQualityValues = _Translations$settings$viewer$imageQualityValues$de_DE._(
    _root,
  );
  @override
  late final _Translations$settings$viewer$scrollDirectionValues$de_DE scrollDirectionValues =
      _Translations$settings$viewer$scrollDirectionValues$de_DE._(_root);
  @override
  late final _Translations$settings$viewer$toolbarPositionValues$de_DE toolbarPositionValues =
      _Translations$settings$viewer$toolbarPositionValues$de_DE._(_root);
  @override
  late final _Translations$settings$viewer$buttonPositionValues$de_DE buttonPositionValues =
      _Translations$settings$viewer$buttonPositionValues$de_DE._(_root);
  @override
  late final _Translations$settings$viewer$shareActionValues$de_DE shareActionValues = _Translations$settings$viewer$shareActionValues$de_DE._(_root);
}

// Path: settings.video
class _Translations$settings$video$de_DE extends Translations$settings$video$en {
  _Translations$settings$video$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Videos deaktivieren';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Nützlich auf leistungsschwachen Geräten, welche beim Laden von Videos abstürzen. Blendet Optionen ein, das Video im externen Player oder Browser abzuspielen.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Videos Autoplay';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Videos stummgeschaltet starten';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimentell]';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video Player Backend';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Standard';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Basiert auf dem exoplayer. Hat die beste Gerätekompatibilität, kann aber Probleme mit 4k Videos, manchen Codecs und alten Geräten haben.';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Basiert auf libmpv. Besitzt erweiterte Einstellungen, welche bei manchen Codecs und alten Geräten helfen können. [VERURSACHT VIELLEICHT ABSTÜRZE]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Basiert auf libmdk. Kann bessere Leistung bei manchen Codecs und alten Geräten besitzen. [VERURSACHT VIELLEICHT ABSTÜRZE]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Wenn die Videos nicht korrekt abgespielt werden oder Codec-Fehler auftreten, andere Werte in den "MPV" Einstellungen ausprobieren:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: Hardwarebeschleunigung verwenden';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video Cache-Modus';
  @override
  late final _Translations$settings$video$cacheModes$de_DE cacheModes = _Translations$settings$video$cacheModes$de_DE._(_root);
  @override
  late final _Translations$settings$video$cacheModeValues$de_DE cacheModeValues = _Translations$settings$video$cacheModeValues$de_DE._(_root);
  @override
  late final _Translations$settings$video$videoBackendModeValues$de_DE videoBackendModeValues =
      _Translations$settings$video$videoBackendModeValues$de_DE._(_root);
}

// Path: settings.downloads
class _Translations$settings$downloads$de_DE extends Translations$settings$downloads$en {
  _Translations$settings$downloads$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Von nächster Datei in der Warteschlange';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Bitte Zugriff auf den Gerätespeicher erlauben, um Dateien herunterladen zu können';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Keine Dateien ausgewählt';
  @override
  String get noItemsQueued =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Keine Dateien in der Warteschlange';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Stapel';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Lade Ausgewählte herunter';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
      'Entferne Status "heruntergeladen" von Datei';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Ausgewählte favorisieren';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Ausgewählte nicht mehr favorisieren';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Auswahl aufheben';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Daten werden aktualisiert...';
}

// Path: settings.database
class _Translations$settings$database$de_DE extends Translations$settings$database$en {
  _Translations$settings$database$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Datenbank';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Datenbank-Indizierung';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Indizes aufheben';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Datenbank aktivieren';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Indizierung aktivieren';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Suchhistorie aktivieren';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Abruf des Tag-Typs aktivieren';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'zu aktualisierender Sankaku-Typ';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Suchanfrage';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optional, kann den Prozess verlangsamen)';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Kann die Seite gerade nicht verlassen!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Sankaku-Daten werden aktualisiert. Warte bis dies abgeschlossen ist oder breche den Vorgang unten auf der Seite ab.';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Bitte warten!';
  @override
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indizes werden geändert';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
      'Speichert Favoriten und protokolliert heruntergeladene Dateien';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ??
      'Bereits heruntergeladene Dateien werden nicht erneut heruntergeladen';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Beschleunigt Datenbanksuchen, aber nutzt mehr Speicherplatz (bis zum 2x)';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Erzeuge Indizes [Debug]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Hebe Indizes auf [Debug]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ??
      'Erfordert eine Datenbank, um aktiviert werden zu können';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Speichert die letzten ${limit} Suchen';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
      'Tippe auf einen Eintrag für Aktionen (Löschen, Favorisieren...)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Favorisierte Suchen werden am Anfang der Liste angepinnt und zählen nicht ins Limit für Einträge';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Ruft Tag-Typen von unterstützten Boorus ab';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Kann zur Begrenzung von Datenraten führen';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Datenbank löschen';
  @override
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Datenbank löschen?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Datenbank gelöscht!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Ein Neustart der App ist erforderlich!';
  @override
  String get clearSnatchedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Lösche Datenbankeinträge heruntergeladener Posts';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ??
      'Datenbankeinträge aller heruntergeladener Posts löschen?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Datenbankeinträge heruntergeladener Posts gelöscht';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
      'Ein Neustart der App ist vielleicht erforderlich!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Favoriten-Markierungen löschen';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Alle Favoriten-Markierungen löschen?';
  @override
  String get favouritesCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoriten-Markierungen gelöscht';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Suchhistorie löschen';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Suchhistorie löschen?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Suchhistorie gelöscht';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku-Favoriten aktualisieren';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
      'Aktualisierung Sankaku-Favoriten gestartet';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Neue Post-URLs werden für deine Sankaku-Favoriten abgerufen';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Verlasse diese Seite nicht, bis der Prozess abgeschlossen oder gestoppt ist';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Keine Sankaku-Konfiguration gefunden!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Aktualisierung Sankaku-Favoriten abgeschlossen';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Entfernen fehlgeschlagener Posts gestartet';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Posts, bei denen die Aktualisierung fehlschlägt, werden von der Datenbank entfernt';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku-URLs aktualisieren';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Aktualisiere ${count} Posts:';
  @override
  String left({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Verbleibend: ${count}';
  @override
  String done({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Abgeschlossen: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Fehlgeschlagen/Übersprungen: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Stoppe und versuche es später erneut, wenn die Zahl fehlgeschlagener Posts konstant ansteigt. Du hast vielleicht eine Datenbegrenzung erreicht oder Sankaku blockiert Anfragen von deiner IP.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Hier drücken, um den aktuellen Post zu überspringen';
  @override
  String get useIfStuck =>
      TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Benutzen wenn Post wahrscheinlich festhängt';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Zum Stoppen hier drücken';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Entferne fehlgeschlagene Posts (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
      'Erneuter Versuch bei (${count}) fehlgeschlagenen Posts';
}

// Path: settings.backupAndRestore
class _Translations$settings$backupAndRestore$de_DE extends Translations$settings$backupAndRestore$en {
  _Translations$settings$backupAndRestore$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Sichern und Wiederherstellen';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Datei bereits vorhanden!';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'Die Datei ${fileName} exisitiert bereits. Soll sie überschrieben werden? Wenn nein, wird die Sicherung abgebrochen.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Diese Funktion ist nur auf Android verfügbar. In Desktop Umgebungen können die Dateien einfach vom/zum Installationsordner des Programms kopiert/eingefügt werden.';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Sicherungsverzeichnis auswählen';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
      'Sicherungsverzeichnis konnte nicht erfasst werden';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Sicherungsverzeichnis: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Kein Sicherungsverzeichnis ausgewählt';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Datei muss im Stammverzeichnis abgelegt sein';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Einstellungen sichern';
  @override
  String get restoreSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Einstellungen wiederherstellen';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Einstellungen in settings.json gesichert';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Einstellungen von Sicherung wiederhergestellt';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Sichern der Einstellungen fehlgeschlagen';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ??
      'Wiederherstellen der Einstellungen fehlgeschlagen';
  @override
  String get resetBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Sicherungsverzeichnis zurücksetzen';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Boorus sichern';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Boorus wiederherstellen';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus in boorus.json gesichert';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus von Sicherung wiederhergestellt';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Sichern der Boorus fehlgeschlagen';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Wiederherstellen der Boorus fehlgeschlagen';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Datenbank sichern';
  @override
  String get restoreDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Datenbank wiederherstellen';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Kann je nach Größe der Datenbank einige Zeit dauern. Nach erfolgreichem Abschluss wird die App neugestartet.';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Datenbank in store.db gesichert';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Datenbank von Sicherung wiederhergestellt! App wird in einigen Sekunden neugestartet!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Sichern der Datenbank fehlgeschlagen';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ??
      'Wiederherstellen der Datenbank fehlgeschlagen';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'Datenbank-Datei nicht gefunden oder unlesbar!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Tags sichern';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Tags wiederherstellen';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Kann bei einer großen Anzahl von Tags einige Zeit dauern. Wenn die Datenbank wiederhergestellt wurde, muss dies nicht getan werden. Sie sind bereits in der Datenbank enthalten.';
  @override
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags in tags.json gesichert';
  @override
  String get tagsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags von Sicherung wiederhergestellt';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Sichern der Tags fehlgeschlagen';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Wiederherstellen der Tags fehlgeschlagen';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tag-Datei nicht gefunden oder unlesbar!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Drücke unten auf verbergen, wenn es zu lange dauert. Der Vorgang wird im Hintergrund fortgeführt.';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
      'Sicherungs-Datei nicht gefunden oder unlesbar!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ??
      'Kein Zugriff auf Sicherungsverzeichnis möglich!';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Sicherung abgebrochen';
}

// Path: settings.network
class _Translations$settings$network$de_DE extends Translations$settings$network$en {
  _Translations$settings$network$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Netzwerk';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Aktiviere selbstsignierte SSL-Zertifikate';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Wird nicht auf den Video-Streaming-Modus angewendet. Stattdessen Video-Cache-Modus verwenden.';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Eigener User-Agent';
  @override
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Eigener User-Agent';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ??
      'Eingabefeld leer lassen, um den Standardwert zu verwenden';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Standard: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
      'Wird für die meisten Booru-Anfragen und Webansicht benutzt';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Wird beim verlassen der Seite gespeichert';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Hier drücken, um den User-Agent des Chrome-Browsers einzutragen (nur empfohlen, wenn Seiten die Nicht-Browser-Agents blockieren).';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookies löschen';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Ein Booru auswählen, von dem die Cookies gelöscht werden sollen. Eingabefeld leer lassen, um von allen die Cookies zu löschen.';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies von ${booruName}:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '«${cookieName}» Cookie gelöscht';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cookies löschen';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Lösche Cookies von ${booruName}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Cookies von ${booruName} gelöscht';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Alle Cookies gelöscht';
}

// Path: settings.privacy
class _Translations$settings$privacy$de_DE extends Translations$settings$privacy$en {
  _Translations$settings$privacy$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privatspähre';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App-Sperre';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Die App wird manuell oder nach eingestellter Zeit ohne Nutzung gesperrt. Eine Pin oder Biometriedaten werden benötigt.';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Automatische Sperre nach';
  @override
  String get autoLockAfterTip =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in Sekunden, 0 zum Deaktivieren eintragen';
  @override
  String get bluronLeave =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'App-Inhalt in der App-Übersicht verschwommen darstellen';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Funktioniert auf manchen Geräten wegen Systembegrenzungen nicht';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Inkognito-Tastatur';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Verhindert, dass die Tastatur eine Eingaben-Historie speichert. Wird auf die meisten Texteingaben angewendet.';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Angezeigter App-Name';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Auswählen, wie der App-Name im System-Launcher angezeigt wird';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'App-Name geändert';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'Die Änderung des Namens wird nach dem Neustart der App wirksam. Manche Launcher brauchen etwas Zeit oder einen Systemneustart für die Änderung.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
      'Die Änderung des App-Namens ist fehlgeschlagen. Bitte erneut versuchen.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Neustarten';
}

// Path: settings.performance
class _Translations$settings$performance$de_DE extends Translations$settings$performance$en {
  _Translations$settings$performance$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Leistung';
  @override
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Leistungssparmodus';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Empfohlen bei alten Geräten oder welchen mit wenig verfügbarem Arbeitsspeicher';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Leistungssparmodus';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- deaktiviert detaillierte Informationen über den Ladeprozess von Posts';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- deaktiviert leistungsintensive Elemente (verschwommenes oder durchsichtiges UI, einige Animationen, ...)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Es werden leistungsoptimierte Optionen eingestellt (können später separat geändert werden):';
  @override
  String get autoplayVideos =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Videos automatisch wiedergeben';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Videos deaktivieren';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Nützlich auf leistungsschwachen Geräten, welche beim Laden von Videos abstürzen. Blendet Optionen ein, das Video im externen Player oder Browser abzuspielen.';
}

// Path: settings.cache
class _Translations$settings$cache$de_DE extends Translations$settings$cache$en {
  _Translations$settings$cache$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download und Cache';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Download-Qualität';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Download-Verzögerung (in ms)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
      'Bitte einen gültigen Wert für das Time-Out eingeben';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Bitte einen Wert >10ms eingeben';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Benachrichtigung bei langsamen Downloads';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Herunterladen wenn Datei als Favorit markiert wird';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ??
      'Als Favorit markieren wenn Datei heruntergeladen wird';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Beim Download auch Bilddaten als JSON speichern';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Benötigt eigenen Speicherort';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Speicherort festlegen';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Speicherort: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Speicherort zurücksetzen';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Vorschau cachen';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Medien Caching';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video Cache-Modus';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video Cache-Modi';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Stream - kein caching, startet die Wiedergabe so schnell wie möglich';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Cache - speichert die Datei im Gerätespeicher, startet die Wiedergabe erst nach Abschluss des Downloads';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Stream + Cache - Mix aus beidem, führt momentan zu doppelten Downloads';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Anmerkung]: Videos werden nur gecached, wenn "Medien Caching" aktiviert ist';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Warnung]: Auf dem Desktop kann der Stream-Modus auf manchen Boorus nicht richtig funktionieren';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Lösche Cache nach:';
  @override
  String get neverDeleteDuration => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Niemals';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Cache-Größenlimit (in GB)';
  @override
  String get maximumTotalCacheSize => TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maximale Cache-Größe';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Cache-Statistik:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Laden...';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Leer';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} Dateien';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 Datei';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Gesamt';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Thumbnails';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Muster';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Medien';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webansicht';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache gelöscht';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} Cache gelöscht';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Gesamten Cache löschen';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Gesamter Cache gelöscht';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Ein Neustart der App ist vielleicht erforderlich!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Fehler!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Momentan auf dieser Plattform nicht verfügbar';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$de_DE extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filter';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Versteckt';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Markiert';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filter dublizieren';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' ist bereits in der Liste ${type}';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Keine Filter gefunden';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Keine Filter hinzugefügt';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Elemente aus dem Versteckt-Filter komplett ausblenden';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'Elemente aus dem Markiert-Filter komplett ausblenden';
  @override
  String get removeFavourited =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Favorisierte Posts ausblenden';
  @override
  String get removeSnatched =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Heruntergeladene Posts ausblenden';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'KI-Posts ausblenden';
}

// Path: settings.sync
class _Translations$settings$sync$de_DE extends Translations$settings$sync$en {
  _Translations$settings$sync$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sync';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Um Sync zu nutzen, muss die Datenbank aktiviert sein.';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Fehler!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Bitte IP-Adresse und Port eingeben.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Auswählen, was gemacht werden soll';
  @override
  String get sendDataToDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'Daten zu einem anderen Gerät SENDEN';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'Daten von einem anderen Gerät EMPFANGEN';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Starte den Server auf dem anderen Gerät, gebe dessen IP/Port an und drücke dann auf Sync starten.';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP-Adresse';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Host IP-Adresse (z.B. 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Host Port (z.B. 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Favoriten senden';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoriten: ${count}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Favoriten senden (veraltet)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Synchronisiere Favoriten ab #...';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Erlaubt es auszuwählen, von wo die Synchronisation gestartet werden soll. Sinnvoll, wenn zuvor bereits Favoriten übertragen wurden und nur die neuen benötigt werden.';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'Wenn vom Anfang synchronisiert werden soll, das Eingabefeld leer lassen.';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Beispiel: Es gibt Anzahl X an Favoriten und das Eingabefeld ist auf 100 gestellt. Die Synchronisation startet von Favorit 100 und läuft bis Favorit X erreicht wird.';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Sortierung der Favoriten: Von alt (0) zu neu (X)';
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Download-Historie senden';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Heruntergeladen: ${count}';
  @override
  String get syncSnatchedFrom =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Synchronisiere Download-Historie ab #...';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Erlaubt es auszuwählen, von wo die Synchronisation gestartet werden soll. Sinnvoll, wenn zuvor bereits eine Download-Historie übertragen wurde und nur die neuen Einträge benötigt werden.';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'Wenn vom Anfang synchronisiert werden soll, das Eingabefeld leer lassen.';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Beispiel: Es gibt Anzahl X an Download-Einträgen und das Eingabefeld ist auf 100 gestellt. Die Synchronisation startet von Eintrag 100 und läuft bis Eintrag X erreicht wird.';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
      'Sortierung der Download-Historie: Von alt (0) zu neu (X)\n';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Einstellungen senden';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru-Konfigurationen senden';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Konfigurationen: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Übertrage Tabs';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Tabs: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Tab Sync-Modus';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Zusammenlegen: Kombiniere Tabs von diesem Gerät mit denen auf dem anderen Gerät. Tabs mit unbekannten Boorus und bereits existierende Tabs werden ignoriert.';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Ersetzen: Ersetze die Tabs auf dem anderen Gerät mit denen von diesem Gerät.';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Zusammenlegen';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Ersetzen';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Tags senden';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Tag Sync-Modus';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Typ beibehalten: Wenn der Tag auf dem anderen Gerät einen Tag-Typen hat und auf diesem Gerät nicht, wird er übersprungen.';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Überschreiben: Alle Tags werden übertragen. Wenn ein Tag oder Tag-Typ auf dem anderen Gerät existiert, wird er überschrieben.';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Typ beibehalten';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Überschreiben';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Verbindung testen';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Testanfrage an anderes Gerät senden';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Zeigt eine Erfolg-/Fehlerbenachrichtigung';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Synchronisation starten';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Das Port- und IP-Adressfeld dürfen nicht leer sein!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Es wurde nichts für die Synchronisation ausgewählt!';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistik dieses Gerätes:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Starte Server zum Datenempfang. Öffentliche Netzwerke aus Sicherheitsgründen vermeiden.';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Verfügbare Netzwerk-Schnittstellen';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Ausgewählte IP: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Server-Port';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(wenn leer, wird standardmäßig "8080" verwendet)';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Starte Empfangsserver';
}

// Path: settings.about
class _Translations$settings$about$de_DE extends Translations$settings$about$en {
  _Translations$settings$about$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Über';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher ist ein Open-Source-Projekt und unter GPLv3 lizensiert. Der Source-Code ist auf GitHub verfügbar. Bitte alle Probleme und Funktionsanfragen in der Issues-Sektion des Repositories melden.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher auf GitHub';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Kontakt';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-Mail Adresse in Zwischenablage kopiert';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Ein großes Dankeschön an Showers-U dafür, dass wir das Artwork als App-Logo benutzen dürfen. Bitte besucht die Person auf Pixiv.';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Entwickler';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Übersetzer';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'Die neueste Version und die Liste der Änderungen können in den GitHub-Releases gefunden werden:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Lizenzen';
}

// Path: settings.checkForUpdates
class _Translations$settings$checkForUpdates$de_DE extends Translations$settings$checkForUpdates$en {
  _Translations$settings$checkForUpdates$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Nach Updates suchen';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update verfügbar!';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Was ist neu';
  @override
  String get updateChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Änderungsliste aktualisieren';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Prüfen auf Updates fehlgeschlagen!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Du hast die neueste Version';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Neueste Änderungsliste anzeigen';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Momentane Version';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Änderungsliste';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Store öffnen';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Releases öffnen';
}

// Path: settings.logs
class _Translations$settings$logs$de_DE extends Translations$settings$logs$en {
  _Translations$settings$logs$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Protokolle';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Protokolle teilen';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Protokolle mit externer App teilen?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[Warnung]: Die Protokolle können sensible Informationen enthalten. Nur mit Vorsicht teilen!';
}

// Path: settings.help
class _Translations$settings$help$de_DE extends Translations$settings$help$en {
  _Translations$settings$help$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Hilfe';
}

// Path: settings.debug
class _Translations$settings$debug$de_DE extends Translations$settings$debug$en {
  _Translations$settings$debug$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug-Modus ist aktiviert!';
  @override
  String get disabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug-Modus ist deaktiviert!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug Modus ist bereits aktiviert!';
  @override
  String get showPerformanceGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Leistungsdaten anzeigen';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPS-Daten anzeigen';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Bildstatistik anzeigen';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Videostatistik anzeigen';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Bilder verwischen + Videos stummschalten (nur DEV)';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'In Listen Ziehen und Scrollen aktivieren [nur Desktop]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animationsgeschwindigkeit (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Tag-Manager';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Auflösung: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Seitenverhältnis: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Protokollierung';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webansicht';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Alle Cookies löschen';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Sicheren Speicher löschen';
  @override
  String get getSessionString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Zeichenfolge der Sitzung kopieren';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Zeichenfolge der Sitzung setzen';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Zeichenfolge der Sitzung';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sitzung aus Zeichenfolge wiederhergestellt';
}

// Path: settings.logging
class _Translations$settings$logging$de_DE extends Translations$settings$logging$en {
  _Translations$settings$logging$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Protokollierung';
  @override
  String get captureLogcat => TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Android Logcat aufzeichnen';
  @override
  String get captureLogcatDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
      'Warnungen und Fehler vom Android-Prozess der App loggen';
}

// Path: settings.webview
class _Translations$settings$webview$de_DE extends Translations$settings$webview$en {
  _Translations$settings$webview$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Webansicht öffnen';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'zum Einloggen oder Erhalt von Cookies';
}

// Path: settings.dirPicker
class _Translations$settings$dirPicker$de_DE extends Translations$settings$dirPicker$en {
  _Translations$settings$dirPicker$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Verzeichnisname';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Verzeichnis auswählen';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Auswahlfenster schließen ohne ein Verzeichnis zu wählen?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Nein';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Ja';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Fehler!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Erstellung des Verzeichnisses fehlgeschlagen';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Verzeichnis ist nicht beschreibbar!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Neues Verzeichnis';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Erstellen';
}

// Path: viewer.tutorial
class _Translations$viewer$tutorial$de_DE extends Translations$viewer$tutorial$en {
  _Translations$viewer$tutorial$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Bilder';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
      'Antippen/Langes Antippen: Immersiven Modus wechseln';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Doppelt antippen: Auf Bildschirm skalieren / Originalgröße / Zoom zurücksetzen';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$de_DE extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Diashow kann nicht gestartet werden';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Letzten geladenen Post erreicht';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pause';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Start';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Nicht mehr favorisieren';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Auswahl aufheben';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Mit Skalierung neu laden';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Mit Musterqualität laden';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Mit hoher Qualität laden';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Download-Status verwerfen';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Download-Status setzen';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Download';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(erzwungen)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus teilen';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Welche URL möchtest du mit Hydrus teilen?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Post-URL';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Datei-URL';
  @override
  String get hydrusNotConfigured =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus ist nicht konfiguriert!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Datei teilen';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Datei wird bereits zum Teilen heruntergeladen. Abbrechen?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Datei wird bereits zum Teilen heruntergeladen. Abbrechen und eine neue Datei teilen?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Aktuell:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Neu:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Neu teilen';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abbrechen';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Fehler!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
      'Vor dem Teilen ist etwas beim Speichern der Datei schief gelaufen';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Was soll geteilt werden?';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Post-URL mit Tags';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Datei-URL mit Tags';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Datei';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Datei mit Tags';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Tags auswählen';
}

// Path: viewer.notes
class _Translations$viewer$notes$de_DE extends Translations$viewer$notes$en {
  _Translations$viewer$notes$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Anmerkung';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Anmerkungen';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _Translations$media$loading$de_DE extends Translations$media$loading$en {
  _Translations$media$loading$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendern...';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Laden und rendern aus dem Cache...';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Laden aus dem Cache...';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Puffern...';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Laden...';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Trotzdem laden';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Laden neustarten';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Laden stoppen';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Vor ${seconds}s gestartet';
  @override
  late final _Translations$media$loading$stopReasons$de_DE stopReasons = _Translations$media$loading$stopReasons$de_DE._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Datei hat 0 Bytes';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dateigröße: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Häufige Wiedergabefehler? [Einstellungen > Video > Video Player Backend] ausprobieren';
}

// Path: media.video
class _Translations$media$video$de_DE extends Translations$media$video$en {
  _Translations$media$video$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videos deaktiviert oder nicht unterstützt';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Video in externem Player öffnen';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Video im Browser öffnen';
  @override
  String get failedToLoadItemData =>
      TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Laden der Daten fehlgeschlagen';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Lade Daten...';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Wiederholen';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Datei im Browser öffnen';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Post im Browser öffnen';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Überprüfe aktuell:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Unbekanntes Dateiformat (.${fileExt}): Hier tippen, um sie im Browser zu öffnen';
}

// Path: preview.error
class _Translations$preview$error$de_DE extends Translations$preview$error$en {
  _Translations$preview$error$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Keine Ergebnisse';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Suchanfrage ändern oder zum Wiederholen antippen';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Ende erreicht';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Geladene Seiten: ${pageNum}\nHier tippen, um letzte Seite neu zu laden';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Lade Seite #${pageNum}...';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        seconds,
        one: 'Vor ${seconds} Sekunde gestartet',
        few: 'Vor ${seconds} Sekunden gestartet',
        many: 'Vor ${seconds} Sekunden gestartet',
        other: 'Vor ${seconds} Sekunden gestartet',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'Zum Wiederholen antippen, wenn Anfrage festhängt oder zu lange braucht';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Fehler beim Laden der Seite #${pageNum}';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Zum Wiederholen hier antippen';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Fehler, keine Ergebnisse geladen';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Zum Wiederholen hier antippen';
}

// Path: settings.interface.previewQualityValues
class _Translations$settings$interface$previewQualityValues$de_DE extends Translations$settings$interface$previewQualityValues$en {
  _Translations$settings$interface$previewQualityValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Thumbnail';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Muster';
}

// Path: settings.interface.previewDisplayModeValues
class _Translations$settings$interface$previewDisplayModeValues$de_DE extends Translations$settings$interface$previewDisplayModeValues$en {
  _Translations$settings$interface$previewDisplayModeValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrat';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rechteck';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Gestuft';
}

// Path: settings.interface.appModeValues
class _Translations$settings$interface$appModeValues$de_DE extends Translations$settings$interface$appModeValues$en {
  _Translations$settings$interface$appModeValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobilgerät';
}

// Path: settings.interface.handSideValues
class _Translations$settings$interface$handSideValues$de_DE extends Translations$settings$interface$handSideValues$en {
  _Translations$settings$interface$handSideValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Links';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Rechts';
}

// Path: settings.viewer.imageQualityValues
class _Translations$settings$viewer$imageQualityValues$de_DE extends Translations$settings$viewer$imageQualityValues$en {
  _Translations$settings$viewer$imageQualityValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Muster';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original';
}

// Path: settings.viewer.scrollDirectionValues
class _Translations$settings$viewer$scrollDirectionValues$de_DE extends Translations$settings$viewer$scrollDirectionValues$en {
  _Translations$settings$viewer$scrollDirectionValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertikal';
}

// Path: settings.viewer.toolbarPositionValues
class _Translations$settings$viewer$toolbarPositionValues$de_DE extends Translations$settings$viewer$toolbarPositionValues$en {
  _Translations$settings$viewer$toolbarPositionValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Oben';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Unten';
}

// Path: settings.viewer.buttonPositionValues
class _Translations$settings$viewer$buttonPositionValues$de_DE extends Translations$settings$viewer$buttonPositionValues$en {
  _Translations$settings$viewer$buttonPositionValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Deaktiviert';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Links';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Rechts';
}

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$de_DE extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Fragen';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Post URL';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Post URL mit Tags';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'Datei URL';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'Datei URL mit Tags';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Datei';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Datei mit Tags';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _Translations$settings$video$cacheModes$de_DE extends Translations$settings$video$cacheModes$en {
  _Translations$settings$video$cacheModes$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video Cache-Modi';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Stream - kein caching, startet die Wiedergabe so schnell wie möglich';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Cache - speichert die Datei im Gerätespeicher, startet die Wiedergabe erst nach Abschluss des Downloads';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Stream + Cache - Mix aus beidem, führt momentan zu doppelten Downloads';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Anmerkung]: Videos werden nur gecached, wenn "Medien Caching" aktiviert ist';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Warnung]: Auf dem Desktop kann der Stream-Modus auf manchen Boorus nicht richtig funktionieren';
}

// Path: settings.video.cacheModeValues
class _Translations$settings$video$cacheModeValues$de_DE extends Translations$settings$video$cacheModeValues$en {
  _Translations$settings$video$cacheModeValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream + Cache';
}

// Path: settings.video.videoBackendModeValues
class _Translations$settings$video$videoBackendModeValues$de_DE extends Translations$settings$video$videoBackendModeValues$en {
  _Translations$settings$video$videoBackendModeValues$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Standard';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _Translations$media$loading$stopReasons$de_DE extends Translations$media$loading$stopReasons$en {
  _Translations$media$loading$stopReasons$de_DE._(TranslationsDeDe root) : this._root = root, super.internal(root);

  final TranslationsDeDe _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Vom Nutzer gestoppt';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Ladefehler';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Datei ist zu groß';
  @override
  String get hiddenByFilters =>
      TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Durch Filter versteckt:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Videofehler';
}

/// The flat map containing all translations for locale <de-DE>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDeDe {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'de-DE',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Deutsch',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Fehler',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Fehler!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Erfolgreich',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Erfolgreich!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Abbrechen',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Zurück',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Später',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Schließen',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Ja',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nein',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Bitte warten...',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Zeige',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Verbergen',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'An',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Aus',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Hinzufügen',
          'exclude' => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Ausschließen',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Bearbeiten',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Entfernen',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Speichern',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Löschen',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Bestätigen',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Wiederholen',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Leeren',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopieren',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopiert',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'In Zwischenablage kopiert',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Keine Ergebnisse',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Einfügen',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopierfehler',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Gehe zu den Einstellungen',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Dies kann etwas dauern...',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'App schließen?',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Schließe die App',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL Fehler!',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Zwischenablage leer!',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Öffnen des Links fehlgeschlagen',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Schlüssel',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Nutzer ID',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Passwort',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Weiter',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Besuche unseren Discord Server',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Datei',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Auswählen',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Alle auswählen',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Öffnen',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'In neuem Tab öffnen',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Verschieben',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Zufall',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortieren',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Start',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Suche',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Oder (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Seite',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Seite #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Typ',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adresse',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nutzername',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoriten',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads',
          'secondsShort' => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's',
          'minutesShort' => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm',
          'hoursShort' => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h',
          'daysShort' => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'T',
          'leaveThisPageQuestion' => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Seite verlassen?',
          'pageWillCloseAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Diese Seite schließt sich automatisch',
          'stay' => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Bleiben',
          'leaveNow' => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Verlassen',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Bitte Wert eingeben',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Bitte gültigen Wert eingeben',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Bitte Zahl eingeben',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Bitte gültige Zahl eingeben',
          'validationErrors.tooSmall' =>
            ({required double min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Bitte Wert größer ${min} eingeben',
          'validationErrors.tooBig' =>
            ({required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Bitte Wert kleiner ${max} eingeben',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Bitte Wert zwischen ${min} und ${max} eingeben',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Bitte Wert >=0 eingeben',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Bitte Wert kleiner als 4 eingeben',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Bitte Wert größer als 100 eingeben',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Mehr als 4 Spalten können die Leistung beeinträchtigen',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Mehr als 8 Spalten können die Leistung beeinträchtigen',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialisierungsfehler!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Richte Proxy ein...',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Lade Datenbank...',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Lade Boorus...',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Lade Tags...',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Wiederherstellung von Tabs...',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Kein Zugriff auf gewählten Speicherort',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Bitte Speicherort erneut wählen um der App Zugriff zu gewähren',
          'permissions.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Speicherort: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Wähle Speicherort',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ??
                'Nicht auf dieser Plattform verfügbar',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Setze Speicherort zurück',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'Dateien werden nach dem Zurücksetzen in das Standardverzeichnis gespeichert',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
                'Bitte authentifizieren um die App zu nutzen',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Keine biometrische Hardware verfügbar',
          'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Temporäre Sperre',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Bei der Authentifizierung gab es einen Fehler: ${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Letzten Tab entfernt',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Auf Standard Tags zurückgesetzt',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Einstufung geändert',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                'In ${booruType} wurde [rating:safe] durch [rating:general] und [rating:sensitive] ersetzt',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'Einstufung wurde automatisch korrigiert. Nutze die korrekte Einstufung in zukünftigen Suchen',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabs wiederhergestellt',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Tab aus vorheriger Sitzung wiederhergestellt',
                  few: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
                  many: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
                  other: '${count} Tabs aus vorheriger Sitzung wiederhergestellt',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Einige wiederhergestellte Tabs enthielten unbekannte Boorus oder Zeichen.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
                'Sie wurden ignoriert oder auf Standardeinstellungen zurückgesetzt.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Liste fehlerhafter Tabs:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabs zusammengeführt',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} neue Tabs hinzugefügt',
                  few: '${count} neue Tabs hinzugefügt',
                  many: '${count} neue Tabs hinzugefügt',
                  other: '${count} neue Tabs hinzugefügt',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabs ersetzt',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Tab erhalten',
                  few: '${count} Tabs erhalten',
                  many: '${count} Tabs erhalten',
                  other: '${count} Tabs erhalten',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Download-Historie',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Tags eingeben',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Anzahl',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Anzahl zu ladender Dateien',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Verzögerung (in ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Verzögerung zwischen den Downloads',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Lade die Dateien herunter',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Datei wurde bereits heruntergeladen',
          'snatcher.failedToSnatchItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Datei konnte nicht heruntergeladen werden',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Datei-Download abgebrochen',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starte mit nächster Datei...',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Heruntergeladene Dateien',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: 'Heruntergeladen: ${count} Datei',
                  few: 'Heruntergeladen: ${count} Dateien',
                  many: 'Heruntergeladen: ${count} Dateien',
                  other: 'Heruntergeladen: ${count} Dateien',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Datei wurde bereits heruntergeladen',
                  few: '${count} Dateien wurden bereits heruntergeladen',
                  many: '${count} Dateien wurden bereits heruntergeladen',
                  other: '${count} Dateien wurden bereits heruntergeladen',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: 'Fehler beim Herunterladen von ${count} Datei',
                  few: 'Fehler beim Herunterladen von ${count} Dateien',
                  many: 'Fehler beim Herunterladen von ${count} Dateien',
                  other: 'Fehler beim Herunterladen von ${count} Dateien',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Datei abgebrochen',
                  few: '${count} Dateien abgebrochen',
                  many: '${count} Dateien abgebrochen',
                  other: '${count} Dateien abgebrochen',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Bilder herunterladen',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Die App nicht schließen!',
          'snatcher.addedItemToQueue' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Datei zu Downloads hinzugefügt',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Datei zu Downloads hinzugefügt',
                  few: '${count} Dateien zu Downloads hinzugefügt',
                  many: '${count} Dateien zu Downloads hinzugefügt',
                  other: '${count} Dateien zu Downloads hinzugefügt',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru-Modus',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Benötigt mindestens 2 Boorus',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Wähle zusätzliche Boorus:',
          'multibooru.akaMultibooruMode' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'bekannt als Multibooru-Modus',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Sekundäre Boorus wählen',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Fehler beim Import zu Hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Wahrscheinlich wurden nicht die benötigten API Rechte vergeben. Diese können in den Review Services bearbeitet werden.',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Tags zur Datei hinzufügen',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLs hinzufügen',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tab',
          'tabs.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Boorus in den Einstellungen hinzufügen',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Booru auswählen',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Sekundäre Boorus',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Neuen Tab hinzufügen',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Booru wählen oder frei lassen',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'An Position hinzufügen',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'vorheriger Tab',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'nächster Tab',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Ende der Liste',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Genutzte Suchbegriffe',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Standard',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'momentane',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Individuell',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Individuelle Suchanfrage',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[leer]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Sekundäre Boorus hinzufügen',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Sekundäre Boorus beibehalten',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Mit anderer Seitenzahl starten',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Zum neuen Tab wechseln',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Hinzufügen',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tab-Manager',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Auswahlmodus',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Tabs sortieren',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Hilfe',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Tabs löschen',
          'tabs.deleteDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Tab-Duplikate löschen',
          'tabs.deleteDuplicateTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
                'Tab-Duplikate gefunden. Tabs auswählen, welche behalten werden sollen:',
          'tabs.keepFirstDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Ersten behalten',
          'tabs.keepLastDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Letzten behalten',
          'tabs.skipDuplicateTabDelete' => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Überspringen',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Tabs zufällig anordnen',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Tabs zufällig angeordnet',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tabreihenfolge gespeichert',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Zum aktiven Tab scrollen',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Zum Anfang scrollen',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Zum Ende scrollen',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Nach Booru, Status, Duplikaten und mehr filtern',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scrolling:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortieren:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Standard-Sortierung',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortierung Alphabetisch',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortierung Alphabetisch (invertiert)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortierung nach Booru-Name',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortierung nach Booru-Name (invertiert)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
                'Lange auf den Sortier-Button drücken, um die aktuelle Reihenfolge zu speichern',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Auswahlmodus:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Auswahlmodus de-/aktivieren',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Am unteren Bildschirmrand:',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Alle Tabs aus-/abwählen',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Ausgewählte Tabs löschen',
          'tabs.longPressToMove' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Tab gedrückt halten, um ihn zu verschieben',
          'tabs.numbersInBottomRight' => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Zahlen unten rechts vom Tab:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Erste Zahl - Tabnummer in der Standard-Sortierung',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Zweite Zahl - Tabnummer in der momentanen Tab-Sortierung; erscheint wenn Filter/ Sortierung aktiv sind',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Spezialfilter:',
          'tabs.loadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Geladen» - Zeige Tabs mit geladenen Posts',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '«Nicht Geladen» - Zeige nicht geladene Tabs oder welche ohne Posts',
          'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Nicht geladene tabs sind kursiv',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Keine Tabs gefunden',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopieren',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Verschieben',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Entfernen',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Mischen',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortieren',
          'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Tabs zufällig mischen?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Speichere Tabs in dieser Sortierfolge?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Nach Booru',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alphabetisch',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertiert)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: 'Bist du sicher, dass du ${count} Tab löschen willst?',
                  few: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
                  many: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
                  other: 'Bist du sicher, dass du ${count} Tabs löschen willst?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Geladen',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tag Typ',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikate',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ??
                'Auf dem gleichen Booru nach Duplikaten suchen',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Leeres Suchfeld',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tab Filter',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Alle',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nicht geladen',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Aktiviert',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Deaktiviert',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Aktiviert auch Sortieren',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Tabs filtern, welche mindestens einen Tag dieses Typs besitzen',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Beliebig',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Anwenden',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Nach oben bewegen',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Nach unten bewegen',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tab-Nummer',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Ungültige Tab-Nummer',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Ungültige Eingabe',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Außer Reichweite',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Bitte gültige Tab-Nummer eingeben',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ??
                'Verschieben nach #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Vorschau:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Suchverlauf',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Suchverlauf ist leer',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Suchverlauf ist ausgeschaltet',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                'Datenbank in den Einstellungen für den Suchverlauf aktivieren',
          'history.lastSearch' =>
            ({required String search}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Letzte Suche: ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Letze Suche: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Unbekannter Booru-Typ!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ??
                'Unbekannter booru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Öffnen',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'In neuen Tab öffnen',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Aus Favoriten entfernen',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Als Favorit setzen',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopieren',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Löschen',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Lösche Verlaufseinträge',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Eintrag wirklich löschen?',
                  few: '${count} Einträge wirklich löschen?',
                  many: '${count} Einträge wirklich löschen?',
                  other: '${count} Einträge wirklich löschen?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Auswahl entfernen',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: 'Lösche ${count} Eintrag',
                  few: 'Lösche ${count} Einträge',
                  many: 'Lösche ${count} Einträge',
                  other: 'Lösche ${count} Einträge',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webansicht',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Auf diesem Gerät nicht unterstützt',
          'webview.captcha' => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha',
          'webview.captchaCheckDescription' =>
            TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
                'Mögliches Captcha detektiert, Bitte lösen und nach Abschluss zurückkehren',
          'webview.captchaCompleted' => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha durchgeführt',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'URL eingeben',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Eigene URL eingeben',
          'webview.navigation.navigateTo' =>
            ({required String url}) =>
                TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navigiere zu ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Cookies auflisten',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cookies löschen',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Es gab Kekse (Cookies). Jetzt, sind sie weg',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Lade Favicon',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Kein Favicon gefunden',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(obriger Text ist auswählbar)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URL kopieren',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL in Zwischenablagen kopiert',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Verlauf',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Keine vorige Seite verfügbar',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Keine nächste Seite verfügbar',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Einstellungen',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Sprache',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Hilf uns zu übersetzen',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                'Für mehr Infos besuche <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> oder tippe auf das Bild unten um zum POEditor zu gelangen',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus und Suche',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Standard-Tags',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Geladene Posts pro Seite',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Einige Boorus können das ignorieren',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru Konfiguration hinzufügen',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booru Konfiguration teilen',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Teile ${booruName} Konfiguration als Link.\n\nMit login/API Schlüssel?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Kopiere ${booruName} Konfiguration in die Zwischenablage.\n\nMit login/API Schlüssel?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru teilen',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                'So werden Booru-Konfigurationslinks unter Android 12 und höher automatisch in der App geöffnet:\n1) Tippe den Button unten, um die Standardeinstellungen deines Gerätes für diese App zu öffnen.\n2) Aktiviere das automatische Öffnen von unterstützten Links mit dieser App.',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Hinzugefügte Boorus',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Bearbeite Booru Konfiguration',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importiere Booru Konfiguration aus der Zwischenablage',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Nur loli.snatcher URLs werden unterstützt',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Lösche Booru Konfiguration',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
                'Etwas ist während des Löschens einer Booru Konfiguration schiefgelaufen!',
          'settings.booru.booruDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru Konfiguration gelöscht',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Das hier ausgewählte Booru wird nach dem Speichern das Standard-Booru.\n\nDas Standard-Booru ist der erste Eintrag in den Auswahlfeldern.',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Standard-Booru ändern?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Ändere zu: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tippe [Nein] um aktuelles zu behalten: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tippe [Ja], um auszuwählen: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
                'Booru-Konfigurationslink in die Zwischenablage kopiert',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Kein Booru ausgewählt!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Kann dieses Booru nicht löschen!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Entferne zuerst alle verwandten Tabs',
          'settings.booru.sourceLimitNotice' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ??
                'Das Verhalten beim Einrichten der Boorus kann von den unten aufgeführten Kompatibiltätseinstellungen abhängen. Der Inhalt wird von externen Websites zur Verfügung gestellt und nicht von dieser App.',
          'settings.booru.advanced' => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Erweitert',
          'settings.booru.expandedSourceCompatibility' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Kompatibilität bei der Booru-Einrichtung',
          'settings.booru.expandedSourceCompatibilitySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
                'Ändere wie die Kompatibilitätseinstellungen angewendet werden',
          'settings.booru.expandedSourceCompatibilityConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ??
                'Dies zu ändern kann die Funktion der Boorus beeinflussen. Der Inhalt wird von externen Websites zur Verfügung gestellt und nicht von dieser App. Fortfahren?',
          'settings.booru.sourceUnavailableCurrentSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Diese Seite ist nicht verfügbar.',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Einstellungen',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru-Test fehlgeschlagen',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                'Die Konfigurationsparameter könnten inkorrekt sein, das Booru erlaubt keinen API Zugriff, die Anfrage hat keine Daten zurück erhalten oder es gab einen Netzwerkfehler.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booru speichern',
          'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Wird getestet…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ??
                'Diese Boorukonfiguration existiert bereits',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Boorukonfiguration mit gleichen Namen existiert bereits',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Boorukonfiguration mit gleicher URL existiert bereits',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
                'Diese Boorukonfiguration wird nicht hinzugefügt',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Boorukonfiguration gespeichert',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'Vorhandene Tabs mit diesem Booru müssen neu geladen werden, um die Änderungen anzuwenden!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
                'Verifizierung von API-Zugriff für Hydrus fehlgeschlagen',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Zugangsschlüssel angefordert',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Drücke OK in Hydrus und dann anwenden. Du kannst dannach \'Booru testen\' drücken.',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Zugangsschlüssel nicht erhalten',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
                'Hast du in Hydrus das Anfragefenster geöffnet?',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                'Um den Hydrus-Schlüssel zu bekommen, musst du den Anfragedialog im Hydrus-Client öffnen. Services > Review Services > Client API > Hinzufügen > Von API-Anfrage',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus-API-Schlüssel abrufen',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name ist erforderlich!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL ist erforderlich!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Typ',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Wird automatisch ausgefüllt wenn leer)',
          'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Standard Tags',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Standardsuche für Booru',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Untere Felder können erforderlich sein für manche Boorus',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
                'Bestätige das Speichern der Boorukonfiguration',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Ausgewählter/Erkannter Booru-Typ: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Oberfläche',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'App UI Modus',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'App UI Modus',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Desktop Modus nutzen? Kann Fehler auf Mobilgeräten verursachen. VERALTET.',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobilgerät - Normale UI für Mobilgeräte',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Desktop - Ahoviewer UI Stil [VERALTET, BEARBEITUNG NÖTIG]',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[Warnung]: Ändere den UI Modus nicht zu Desktop auf einem Mobilgerät. Dies kann die App unbrauchbar machen und erfordert möglicherweise die Einstellungen inklusive Boorukonfigurationen zurückzusetzen.',
          'settings.interface.handSide' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Appnutzung linke/rechte Hand',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                'Passt Positionen der UI Elemente an ausgewählte Seite an',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Zeige Suchleiste in der Vorschau-Ansicht',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Eingabefeld in der Suchansicht nach oben verschieben',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
                'Schnellbefehle in der Suchansicht anzeigen',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ??
                'Suchfeld automatisch für Eingabe fokussieren',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Vibration ausschalten',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Kann bei manchen Aktionen trotzdem auftreten',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Zurückgeste vorhersagen',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Vorschauspalten (Hochformat)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Vorschauspalten (Querformat)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Vorschauqualität',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Ändert Bildauflösung in der Vorschau-Ansicht',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Muster - Mittlere Auflösung; Als Platzhalter wird ein Thumbnail verwendet, bis die höhere Auflösung geladen wurde.',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Thumbnail - Geringe Auflösung',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[Anmerkung]: Musterqualität kann die App-Leistung spürbar verschlechtern. Dies gilt vor allem, wenn zu viele Spalten in der Vorschau-Ansicht verwendet werden.',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Anzeigeart Vorschau-Ansicht',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Ersatz Anzeigeart Vorschau-Ansicht',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Diese Anzeigeart wird als Ersatz genutzt, wenn die gestufte Option nicht möglich ist',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Bilder nicht skalieren',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Kann App-Leistung verschlechtern',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Warnung',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Bist du sicher, dass du die Bildskalierung deaktivieren möchtest?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Dies kann v.a. auf älteren Geräten die App-Leistung verschlechtern.',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF Thumbnails',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ??
                'Benötigt Aktivieren von «Bilder nicht skalieren»',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Position der Scroll-Buttons',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Mausrad Scroll Modifikation',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Scroll Modifikation',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Thumbnail',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Muster',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrat',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rechteck',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Gestuft',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobilgerät',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Links',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Rechts',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Design',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Design-Modus',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Schwarzer Hintergrund',
          'settings.theme.useDynamicColor' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Dynamische Farben verwenden',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Nur Android 12 und höher',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Design',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primäre Farbe',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Sekundäre Farbe',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Maskottchen in der App anzeigen',
          'settings.theme.setCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Eigenes Maskottchen einrichten',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Eigenes Maskottchen löschen',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Datei-Pfad zum Maskottchen',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Systemeinstellung',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Hell',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Dunkel',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pink',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Lila',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blau',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Türkis',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Rot',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Grün',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Eigenes',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Farbe auswählen',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Ausgewählte Farbe',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Ausgewählte Farbe und Schattierungen',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Schriftart',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Systemeinstellung',
          'settings.theme.viewMoreFonts' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'mehr Schriftarten anzeigen',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
                'Der schnelle braune Fuchs springt über den faulen Frosch',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Eigene Schriftart',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Beliebigen Google-Schriftartnamen eingeben',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Schriftartname',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Schriftarten bei fonts.google.com durchsuchen',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Schriftart nicht gefunden',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer',
          'settings.viewer.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Im Voraus laden Anzahl',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Im Voraus laden Dateigrößenlimit',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 für kein Limit',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Vorausladen Höhenlimit',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in Pixel, 0 für kein Limit',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Bildqualität',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Scrollrichtung',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Position Werkzeugleiste',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Position Zoom Button',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Position Seiten Button',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Werkzeugleiste ausblenden, wenn Viewer geöffnet wird',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Details standardmäßig ausklappen',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ??
                'Übersetzungsanmerkungen standardmäßig ausblenden',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Rotation erlauben',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Zum Zurücksetzen doppelt antippen',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Button-Reihenfolge in der Werkzeugleiste',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Button-Reihenfolge',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
                'Gedrückt halten, um die Reihenfolge zu ändern.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Es werden immer 4 Buttons von dieser Liste in der Werkzeugleiste sichtbar sein.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Die anderen Buttons sind über das Menü (3 Punkte) erreichbar.',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Zum Bewegen gedrückt halten',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Nur für Videos',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ??
                'Dieser Button kann nicht deaktiviert werden',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Standardaktion für das Teilen',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Teilen-Aktionen',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Fragen - immer fragen was geteilt werden soll',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Post URL',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- Datei URL - teilt den Direktlink zur originalen Datei (funktioniert auf manchen Seiten nicht)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- Post URL/ Datei URL/ Datei mit Tags - teilt URL, Datei und ausgewählte Tags',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- Datei - teilt die Datei, kann Zeit zum Laden benötigen, Fortschritt wird auf dem Button dargestellt',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus - sendet Post URL an Hydrus für den Import',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Anmerkung]: Wenn die Datei im Cache vorhanden ist, wird sie von dort geladen. Ansonsten wird sie erneut aus dem Netzwerk geladen.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[Tipp]: Die Optionen für das Teilen können durch langes Drücken auf den Teilen-Button aufgerufen werden.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Lautstärketasten zum Scrollen benutzen',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Scrollen mit Lautstärketasten',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Nutze die Lautstärketasten, um durch die Vorschau-Ansicht und den Viewer zu scrollen.',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Lautstärke runter - nächster Post',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Lautstärke hoch - vorheriger Post',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Im Viewer:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Werkzeugleiste sichtbar - Lautstärke wird gesteuert',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Werkzeugleiste nicht sichtbar - Scrolling wird gesteuert',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Scroll-Geschwindigkeit der Lautstärketasten',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Diashow-Dauer (in ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Diashow',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Videos/GIFs: nur manuelles Scrollen',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Sperren des Gerätes verhindern',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Viewer Öffnen/Schließen Animation',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Viewer Seitenänderung Animation',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Standardanimation verwenden',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Eigene Animation verwenden',
          'settings.viewer.kannaLoadingGif' => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna Lade-GIF',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Muster',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertikal',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Oben',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Unten',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Deaktiviert',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Links',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Rechts',
          'settings.viewer.shareActionValues.ask' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Fragen',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Post URL',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Post URL mit Tags',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'Datei URL',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'Datei URL mit Tags',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Datei',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Datei mit Tags',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Videos deaktivieren',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                'Nützlich auf leistungsschwachen Geräten, welche beim Laden von Videos abstürzen. Blendet Optionen ein, das Video im externen Player oder Browser abzuspielen.',
          'settings.video.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Videos Autoplay',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Videos stummgeschaltet starten',
          _ => null,
        } ??
        switch (path) {
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimentell]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video Player Backend',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Standard',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                'Basiert auf dem exoplayer. Hat die beste Gerätekompatibilität, kann aber Probleme mit 4k Videos, manchen Codecs und alten Geräten haben.',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                'Basiert auf libmpv. Besitzt erweiterte Einstellungen, welche bei manchen Codecs und alten Geräten helfen können. [VERURSACHT VIELLEICHT ABSTÜRZE]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Basiert auf libmdk. Kann bessere Leistung bei manchen Codecs und alten Geräten besitzen. [VERURSACHT VIELLEICHT ABSTÜRZE]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Wenn die Videos nicht korrekt abgespielt werden oder Codec-Fehler auftreten, andere Werte in den "MPV" Einstellungen ausprobieren:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: Hardwarebeschleunigung verwenden',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video Cache-Modus',
          'settings.video.cacheModes.title' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video Cache-Modi',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Stream - kein caching, startet die Wiedergabe so schnell wie möglich',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Cache - speichert die Datei im Gerätespeicher, startet die Wiedergabe erst nach Abschluss des Downloads',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Stream + Cache - Mix aus beidem, führt momentan zu doppelten Downloads',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Anmerkung]: Videos werden nur gecached, wenn "Medien Caching" aktiviert ist',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Warnung]: Auf dem Desktop kann der Stream-Modus auf manchen Boorus nicht richtig funktionieren',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream + Cache',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Standard',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Von nächster Datei in der Warteschlange',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Bitte Zugriff auf den Gerätespeicher erlauben, um Dateien herunterladen zu können',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Keine Dateien ausgewählt',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Keine Dateien in der Warteschlange',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Stapel',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Lade Ausgewählte herunter',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Entferne Status "heruntergeladen" von Datei',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Ausgewählte favorisieren',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Ausgewählte nicht mehr favorisieren',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Auswahl aufheben',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Daten werden aktualisiert...',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Datenbank',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Datenbank-Indizierung',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Indizes aufheben',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Datenbank aktivieren',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Indizierung aktivieren',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Suchhistorie aktivieren',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Abruf des Tag-Typs aktivieren',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'zu aktualisierender Sankaku-Typ',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Suchanfrage',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optional, kann den Prozess verlangsamen)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Kann die Seite gerade nicht verlassen!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Sankaku-Daten werden aktualisiert. Warte bis dies abgeschlossen ist oder breche den Vorgang unten auf der Seite ab.',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Bitte warten!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indizes werden geändert',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
                'Speichert Favoriten und protokolliert heruntergeladene Dateien',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ??
                'Bereits heruntergeladene Dateien werden nicht erneut heruntergeladen',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                'Beschleunigt Datenbanksuchen, aber nutzt mehr Speicherplatz (bis zum 2x)',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Erzeuge Indizes [Debug]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Hebe Indizes auf [Debug]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ??
                'Erfordert eine Datenbank, um aktiviert werden zu können',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Speichert die letzten ${limit} Suchen',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                'Tippe auf einen Eintrag für Aktionen (Löschen, Favorisieren...)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Favorisierte Suchen werden am Anfang der Liste angepinnt und zählen nicht ins Limit für Einträge',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Ruft Tag-Typen von unterstützten Boorus ab',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Kann zur Begrenzung von Datenraten führen',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Datenbank löschen',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Datenbank löschen?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Datenbank gelöscht!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Ein Neustart der App ist erforderlich!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ??
                'Lösche Datenbankeinträge heruntergeladener Posts',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ??
                'Datenbankeinträge aller heruntergeladener Posts löschen?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ??
                'Datenbankeinträge heruntergeladener Posts gelöscht',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
                'Ein Neustart der App ist vielleicht erforderlich!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Favoriten-Markierungen löschen',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Alle Favoriten-Markierungen löschen?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoriten-Markierungen gelöscht',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Suchhistorie löschen',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Suchhistorie löschen?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Suchhistorie gelöscht',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku-Favoriten aktualisieren',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Aktualisierung Sankaku-Favoriten gestartet',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Neue Post-URLs werden für deine Sankaku-Favoriten abgerufen',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Verlasse diese Seite nicht, bis der Prozess abgeschlossen oder gestoppt ist',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Keine Sankaku-Konfiguration gefunden!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Aktualisierung Sankaku-Favoriten abgeschlossen',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ??
                'Entfernen fehlgeschlagener Posts gestartet',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Posts, bei denen die Aktualisierung fehlschlägt, werden von der Datenbank entfernt',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku-URLs aktualisieren',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Aktualisiere ${count} Posts:',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Verbleibend: ${count}',
          'settings.database.done' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Abgeschlossen: ${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ??
                'Fehlgeschlagen/Übersprungen: ${count}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                'Stoppe und versuche es später erneut, wenn die Zahl fehlgeschlagener Posts konstant ansteigt. Du hast vielleicht eine Datenbegrenzung erreicht oder Sankaku blockiert Anfragen von deiner IP.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ??
                'Hier drücken, um den aktuellen Post zu überspringen',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Benutzen wenn Post wahrscheinlich festhängt',
          'settings.database.pressToStop' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Zum Stoppen hier drücken',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Entferne fehlgeschlagene Posts (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Erneuter Versuch bei (${count}) fehlgeschlagenen Posts',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Sichern und Wiederherstellen',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Datei bereits vorhanden!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'Die Datei ${fileName} exisitiert bereits. Soll sie überschrieben werden? Wenn nein, wird die Sicherung abgebrochen.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                'Diese Funktion ist nur auf Android verfügbar. In Desktop Umgebungen können die Dateien einfach vom/zum Installationsordner des Programms kopiert/eingefügt werden.',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Sicherungsverzeichnis auswählen',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
                'Sicherungsverzeichnis konnte nicht erfasst werden',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Sicherungsverzeichnis: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Kein Sicherungsverzeichnis ausgewählt',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
                'Datei muss im Stammverzeichnis abgelegt sein',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Einstellungen sichern',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Einstellungen wiederherstellen',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Einstellungen in settings.json gesichert',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ??
                'Einstellungen von Sicherung wiederhergestellt',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
                'Sichern der Einstellungen fehlgeschlagen',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ??
                'Wiederherstellen der Einstellungen fehlgeschlagen',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Sicherungsverzeichnis zurücksetzen',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Boorus sichern',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Boorus wiederherstellen',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus in boorus.json gesichert',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus von Sicherung wiederhergestellt',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Sichern der Boorus fehlgeschlagen',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ??
                'Wiederherstellen der Boorus fehlgeschlagen',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Datenbank sichern',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Datenbank wiederherstellen',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'Kann je nach Größe der Datenbank einige Zeit dauern. Nach erfolgreichem Abschluss wird die App neugestartet.',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Datenbank in store.db gesichert',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Datenbank von Sicherung wiederhergestellt! App wird in einigen Sekunden neugestartet!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Sichern der Datenbank fehlgeschlagen',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ??
                'Wiederherstellen der Datenbank fehlgeschlagen',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'Datenbank-Datei nicht gefunden oder unlesbar!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Tags sichern',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Tags wiederherstellen',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                'Kann bei einer großen Anzahl von Tags einige Zeit dauern. Wenn die Datenbank wiederhergestellt wurde, muss dies nicht getan werden. Sie sind bereits in der Datenbank enthalten.',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags in tags.json gesichert',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags von Sicherung wiederhergestellt',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Sichern der Tags fehlgeschlagen',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Wiederherstellen der Tags fehlgeschlagen',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tag-Datei nicht gefunden oder unlesbar!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Drücke unten auf verbergen, wenn es zu lange dauert. Der Vorgang wird im Hintergrund fortgeführt.',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'Sicherungs-Datei nicht gefunden oder unlesbar!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ??
                'Kein Zugriff auf Sicherungsverzeichnis möglich!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Sicherung abgebrochen',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Netzwerk',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                'Aktiviere selbstsignierte SSL-Zertifikate',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Wird nicht auf den Video-Streaming-Modus angewendet. Stattdessen Video-Cache-Modus verwenden.',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Eigener User-Agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Eigener User-Agent',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ??
                'Eingabefeld leer lassen, um den Standardwert zu verwenden',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Standard: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Wird für die meisten Booru-Anfragen und Webansicht benutzt',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Wird beim verlassen der Seite gespeichert',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Hier drücken, um den User-Agent des Chrome-Browsers einzutragen (nur empfohlen, wenn Seiten die Nicht-Browser-Agents blockieren).',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookies löschen',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Ein Booru auswählen, von dem die Cookies gelöscht werden sollen. Eingabefeld leer lassen, um von allen die Cookies zu löschen.',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies von ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                '«${cookieName}» Cookie gelöscht',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cookies löschen',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Lösche Cookies von ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Cookies von ${booruName} gelöscht',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Alle Cookies gelöscht',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privatspähre',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App-Sperre',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Die App wird manuell oder nach eingestellter Zeit ohne Nutzung gesperrt. Eine Pin oder Biometriedaten werden benötigt.',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Automatische Sperre nach',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in Sekunden, 0 zum Deaktivieren eintragen',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'App-Inhalt in der App-Übersicht verschwommen darstellen',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Funktioniert auf manchen Geräten wegen Systembegrenzungen nicht',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Inkognito-Tastatur',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Verhindert, dass die Tastatur eine Eingaben-Historie speichert. Wird auf die meisten Texteingaben angewendet.',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Angezeigter App-Name',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Auswählen, wie der App-Name im System-Launcher angezeigt wird',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'App-Name geändert',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
                'Die Änderung des Namens wird nach dem Neustart der App wirksam. Manche Launcher brauchen etwas Zeit oder einen Systemneustart für die Änderung.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Die Änderung des App-Namens ist fehlgeschlagen. Bitte erneut versuchen.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Neustarten',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Leistung',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Leistungssparmodus',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Empfohlen bei alten Geräten oder welchen mit wenig verfügbarem Arbeitsspeicher',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Leistungssparmodus',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- deaktiviert detaillierte Informationen über den Ladeprozess von Posts',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- deaktiviert leistungsintensive Elemente (verschwommenes oder durchsichtiges UI, einige Animationen, ...)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Es werden leistungsoptimierte Optionen eingestellt (können später separat geändert werden):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Videos automatisch wiedergeben',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Videos deaktivieren',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                'Nützlich auf leistungsschwachen Geräten, welche beim Laden von Videos abstürzen. Blendet Optionen ein, das Video im externen Player oder Browser abzuspielen.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download und Cache',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Download-Qualität',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Download-Verzögerung (in ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
                'Bitte einen gültigen Wert für das Time-Out eingeben',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Bitte einen Wert >10ms eingeben',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Benachrichtigung bei langsamen Downloads',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ??
                'Herunterladen wenn Datei als Favorit markiert wird',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ??
                'Als Favorit markieren wenn Datei heruntergeladen wird',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Beim Download auch Bilddaten als JSON speichern',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Benötigt eigenen Speicherort',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Speicherort festlegen',
          'settings.cache.currentPath' =>
            ({required String path}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Speicherort: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Speicherort zurücksetzen',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Vorschau cachen',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Medien Caching',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video Cache-Modus',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video Cache-Modi',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '- Stream - kein caching, startet die Wiedergabe so schnell wie möglich',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Cache - speichert die Datei im Gerätespeicher, startet die Wiedergabe erst nach Abschluss des Downloads',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '- Stream + Cache - Mix aus beidem, führt momentan zu doppelten Downloads',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Anmerkung]: Videos werden nur gecached, wenn "Medien Caching" aktiviert ist',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Warnung]: Auf dem Desktop kann der Stream-Modus auf manchen Boorus nicht richtig funktionieren',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Lösche Cache nach:',
          'settings.cache.neverDeleteDuration' => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Niemals',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Cache-Größenlimit (in GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maximale Cache-Größe',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Cache-Statistik:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Laden...',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Leer',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ??
                '${size}, ${count} Dateien',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 Datei',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Gesamt',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Thumbnails',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Muster',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Medien',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webansicht',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache gelöscht',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} Cache gelöscht',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Gesamten Cache löschen',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Gesamter Cache gelöscht',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Ein Neustart der App ist vielleicht erforderlich!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Fehler!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Momentan auf dieser Plattform nicht verfügbar',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filter',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Versteckt',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Markiert',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filter dublizieren',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' ist bereits in der Liste ${type}',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Keine Filter gefunden',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Keine Filter hinzugefügt',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
                'Elemente aus dem Versteckt-Filter komplett ausblenden',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
                'Elemente aus dem Markiert-Filter komplett ausblenden',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Favorisierte Posts ausblenden',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Heruntergeladene Posts ausblenden',
          'settings.itemFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'KI-Posts ausblenden',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sync',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Um Sync zu nutzen, muss die Datenbank aktiviert sein.',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Fehler!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Bitte IP-Adresse und Port eingeben.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Auswählen, was gemacht werden soll',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'Daten zu einem anderen Gerät SENDEN',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'Daten von einem anderen Gerät EMPFANGEN',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Starte den Server auf dem anderen Gerät, gebe dessen IP/Port an und drücke dann auf Sync starten.',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP-Adresse',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Host IP-Adresse (z.B. 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port',
          'settings.sync.portPlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Host Port (z.B. 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Favoriten senden',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoriten: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Favoriten senden (veraltet)',
          'settings.sync.syncFavsFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Synchronisiere Favoriten ab #...',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                'Erlaubt es auszuwählen, von wo die Synchronisation gestartet werden soll. Sinnvoll, wenn zuvor bereits Favoriten übertragen wurden und nur die neuen benötigt werden.',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'Wenn vom Anfang synchronisiert werden soll, das Eingabefeld leer lassen.',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Beispiel: Es gibt Anzahl X an Favoriten und das Eingabefeld ist auf 100 gestellt. Die Synchronisation startet von Favorit 100 und läuft bis Favorit X erreicht wird.',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Sortierung der Favoriten: Von alt (0) zu neu (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Download-Historie senden',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Heruntergeladen: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Synchronisiere Download-Historie ab #...',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                'Erlaubt es auszuwählen, von wo die Synchronisation gestartet werden soll. Sinnvoll, wenn zuvor bereits eine Download-Historie übertragen wurde und nur die neuen Einträge benötigt werden.',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Wenn vom Anfang synchronisiert werden soll, das Eingabefeld leer lassen.',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                'Beispiel: Es gibt Anzahl X an Download-Einträgen und das Eingabefeld ist auf 100 gestellt. Die Synchronisation startet von Eintrag 100 und läuft bis Eintrag X erreicht wird.',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                'Sortierung der Download-Historie: Von alt (0) zu neu (X)\n',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Einstellungen senden',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru-Konfigurationen senden',
          'settings.sync.configsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Konfigurationen: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Übertrage Tabs',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Tabs: ${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Tab Sync-Modus',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                'Zusammenlegen: Kombiniere Tabs von diesem Gerät mit denen auf dem anderen Gerät. Tabs mit unbekannten Boorus und bereits existierende Tabs werden ignoriert.',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Ersetzen: Ersetze die Tabs auf dem anderen Gerät mit denen von diesem Gerät.',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Zusammenlegen',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Ersetzen',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Tags senden',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Tag Sync-Modus',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Typ beibehalten: Wenn der Tag auf dem anderen Gerät einen Tag-Typen hat und auf diesem Gerät nicht, wird er übersprungen.',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Überschreiben: Alle Tags werden übertragen. Wenn ein Tag oder Tag-Typ auf dem anderen Gerät existiert, wird er überschrieben.',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Typ beibehalten',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Überschreiben',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Verbindung testen',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Testanfrage an anderes Gerät senden',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Zeigt eine Erfolg-/Fehlerbenachrichtigung',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Synchronisation starten',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ??
                'Das Port- und IP-Adressfeld dürfen nicht leer sein!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ??
                'Es wurde nichts für die Synchronisation ausgewählt!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistik dieses Gerätes:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Starte Server zum Datenempfang. Öffentliche Netzwerke aus Sicherheitsgründen vermeiden.',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Verfügbare Netzwerk-Schnittstellen',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Ausgewählte IP: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Server-Port',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(wenn leer, wird standardmäßig "8080" verwendet)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Starte Empfangsserver',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Über',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                'LoliSnatcher ist ein Open-Source-Projekt und unter GPLv3 lizensiert. Der Source-Code ist auf GitHub verfügbar. Bitte alle Probleme und Funktionsanfragen in der Issues-Sektion des Repositories melden.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher auf GitHub',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Kontakt',
          'settings.about.emailCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-Mail Adresse in Zwischenablage kopiert',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                'Ein großes Dankeschön an Showers-U dafür, dass wir das Artwork als App-Logo benutzen dürfen. Bitte besucht die Person auf Pixiv.',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Entwickler',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Übersetzer',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'Die neueste Version und die Liste der Änderungen können in den GitHub-Releases gefunden werden:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Lizenzen',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Nach Updates suchen',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update verfügbar!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Was ist neu',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Änderungsliste aktualisieren',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Prüfen auf Updates fehlgeschlagen!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Du hast die neueste Version',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Neueste Änderungsliste anzeigen',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Momentane Version',
          'settings.checkForUpdates.changelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Änderungsliste',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Store öffnen',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Releases öffnen',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Protokolle',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Protokolle teilen',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Protokolle mit externer App teilen?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[Warnung]: Die Protokolle können sensible Informationen enthalten. Nur mit Vorsicht teilen!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Hilfe',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug-Modus ist aktiviert!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug-Modus ist deaktiviert!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug Modus ist bereits aktiviert!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Leistungsdaten anzeigen',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPS-Daten anzeigen',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Bildstatistik anzeigen',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Videostatistik anzeigen',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Bilder verwischen + Videos stummschalten (nur DEV)',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'In Listen Ziehen und Scrollen aktivieren [nur Desktop]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animationsgeschwindigkeit (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Tag-Manager',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Auflösung: ${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Seitenverhältnis: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Protokollierung',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webansicht',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Alle Cookies löschen',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Sicheren Speicher löschen',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Zeichenfolge der Sitzung kopieren',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Zeichenfolge der Sitzung setzen',
          'settings.debug.sessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Zeichenfolge der Sitzung',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sitzung aus Zeichenfolge wiederhergestellt',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Protokollierung',
          'settings.logging.captureLogcat' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Android Logcat aufzeichnen',
          'settings.logging.captureLogcatDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
                'Warnungen und Fehler vom Android-Prozess der App loggen',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Webansicht öffnen',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'zum Einloggen oder Erhalt von Cookies',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Verzeichnisname',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Verzeichnis auswählen',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Auswahlfenster schließen ohne ein Verzeichnis zu wählen?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Nein',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Ja',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Fehler!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ??
                'Erstellung des Verzeichnisses fehlgeschlagen',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Verzeichnis ist nicht beschreibbar!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Neues Verzeichnis',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Erstellen',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Kommentare',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Keine Kommentare',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                'Dieses Booru hat keine Kommentare oder es existiert keine API dafür',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Seite ändern',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Seite #',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Ladeverzögerung (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Verzögerung in ms',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Aktuelle Seite #${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Mögliche max. Seite #~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Suche läuft gerade!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Zu Seite springen',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Suche bis Seite',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Suche stoppen',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Keine Eingabe!',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Neuen ${type} Filter hinzufügen]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Neuer ${type} Tag-Filter',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Neuer Filter',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Filter bearbeiten',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Tag hinzufügen',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Name',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Typ',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Hinzufügen',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Abgelaufen nach: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Tab hinzugefügt',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Tab hinzufügen',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopieren',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Auf abgelaufen setzen',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Auf nicht abgelaufen setzen',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Nicht ablaufbar machen',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: '${count} Tag löschen',
                  few: '${count} Tags löschen',
                  many: '${count} Tags löschen',
                  other: '${count} Tags löschen',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Tags löschen',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Auswahl aufheben',
          'lockscreen.tapToAuthenticate' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Zur Authentifizierung antippen',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV-Entsperrung',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '[Testen]: Hier tippen, wenn die App nicht auf normalem Wege entsperrt werden kann. Informiere den Entwickler mit Details zu dem Gerät.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Soll die Synchronisierung gestoppt werden?',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Soll der Server gestoppt werden?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Keine Verbindung',
          'loliSync.waitingForConnection' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Warten auf Verbindung...',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starten des Servers...',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Bildschirm aktiv halten',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Sync-Server abgeschaltet',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Testfehler: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Testfehler: ${error}',
          'loliSync.testSuccess' => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Testanfrage wurde positiv beantwortet',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ??
                'Es sollte eine "Test" Nachricht auf dem anderen Gerät geben.',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Bildsuche',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Kommentare',
          'tagView.showNotes' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Zeige (${count}) Anmerkungen',
          'tagView.hideNotes' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Verberge (${count}) Anmerkungen',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Lade Anmerkungen',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Dieser Tag ist bereits in der aktuellen Suchanfrage:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Zur aktuellen Suchanfrage hinzugefügt:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Neuen Tab hinzugefügt:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Post-URL',
          'tagView.uploader' => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Veröffentlicht',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Details',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Dateiname',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Dateierweiterung',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Auflösung',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Größe',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Einstufung',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Bewertung',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Keine Tags gefunden',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopieren',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Von Suche entfernen',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Zur Suche hinzufügen',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Zur Suchleiste hinzugefügt:',
          'tagView.excludeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Von Suche ausschließen',
          'tagView.exclusionAddedToSearchBar' =>
            TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Ausschluss zur Suchleiste hinzugefügt:',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Zu markiert hinzufügen',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Zu verbergen hinzufügen',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Von markiert entfernen',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Von verbergen entfernen',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Tag bearbeiten',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Quelle',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Vorschau',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Booru zum Laden auswählen',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Vorschau wird geladen...',
          'tagView.failedToLoadPreview' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Laden der Vorschau fehlgeschlagen',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Zum erneuten Versuchen antippen',
          'tagView.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Datei-URL in die Zwischenablage kopiert',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Vorschau taggen',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Aktueller Status',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Historie',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Laden der Vorschauseite fehlgeschlagen',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Erneut versuchen',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Gefundene Links:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Verwandte Tabs',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Tabs mit nur diesem Tag',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
                'Tabs mit nur diesem Tag, aber auf anderem Booru',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Tabs die diesen Tag enthalten',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Angepinnte Tags',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Tag anpinnen',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Tag nicht anpinnen',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Anpinnen',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Nicht anpinnen',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» für schnellen Zugriff anpinnen?',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '«${tag}» von angepinnten Tags entfernen?',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Nur für ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Label (optional)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ??
                'Eingeben und den Hinzufügen-Button antippen, um Label hinzuzufügen',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Existierendes Label auswählen',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag angepinnt',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Angepinnt für ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Global angepinnt ${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag nicht mehr angepinnt',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Alle',
          'pinnedTags.reorderPinnedTags' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Angepinnte Tags sortieren',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Speichern...',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Sortieren',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Tag manuell hinzufügen',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Keine Tags passen zur Suche',
          'pinnedTags.noPinnedTagsYet' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Bisher keine angepinnten Tags',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Label bearbeiten',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Label',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Angepinnten Tag hinzufügen',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Tag-Abfrage',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'Tag_Name',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
                'Es kann jede Suchanfrage eingegeben werden, auch Tags mit Leerzeichen',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Nach Tags suchen',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Vorschläge konnten nicht geladen werden. Für erneuten Versuch antippen${msg}',
          'searchBar.noSuggestionsFound' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Keine Vorschläge gefunden',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ??
                'Tag-Vorschläge sind für dieses Booru nicht verfügbar',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '«${tag}» in Zwischenablage kopiert',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Präfix',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Ausschließen (-)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Meta-Tags',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Freie Meta-Tags',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Freie Meta-Tags zählen nicht in die Tag-Suchbegrenzung',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Frei',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Einzeln',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Bereich',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Beliebt',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Datum auswählen',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Datumsbereich auswählen',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Historie',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Booru für Webansicht auswählen',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'App sperren',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Datei existiert bereits',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Download fehlgeschlagen',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Abbruch durch Nutzer',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Trotzdem speichern',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Überspringen',
          'mobileHome.retryAll' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Alle (${count}) erneut versuchen',
          _ => null,
        } ??
        switch (path) {
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
                'Existierende, fehlgeschlagene oder abgebrochene Einträge',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Alle wiederholbaren Einträge löschen',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Downloader',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Boorus in den Einstellungen hinzufügen',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Einstellungen',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Speichern',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Keine Posts ausgewählt',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Keine Posts',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Kein Post ausgewählt',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Schließen',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Keine Booru-Konfiguration gefunden',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Neues Booru hinzufügen',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Hilfe',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Einstellungen',
          'mediaPreviews.onboardingTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Richte dein erstes Booru ein',
          'mediaPreviews.onboardingSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
                'Um mit dem Browsen zu beginnen, füge eine Booru Konfiguration hinzu oder lade eine Sicherung',
          'mediaPreviews.addBooruAction' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Booru hinzufügen',
          'mediaPreviews.addBooruActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
                'Füge mittels URL und Sucheinstellungen eine Seite hinzu',
          'mediaPreviews.restoreBackupAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Sicherung laden und verwalten',
          'mediaPreviews.restoreBackupActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
                'Wiederherstellung von Einstellungen, Boorus, Tabs und Daten',
          'mediaPreviews.openSettingsAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Einstellungen öffnen',
          'mediaPreviews.openSettingsActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
                'App-Verhalten vor Einrichtung der Boorus verändern',
          'mediaPreviews.helpSectionTitle' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Hilfe nötig?',
          'mediaPreviews.booruSourcesArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
                'Wie eine Booru Konfiguration funktioniert und eingerichtet wird',
          'mediaPreviews.booruSourcesArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
                'Anleitung zur erstmaligen Einrichtung einer Booru Konfiguration',
          'mediaPreviews.backupRestoreArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Daten aus einer Sicherung wiederherstellen',
          'mediaPreviews.backupRestoreArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
                'Anleitung zum Wechsel von einer früheren App-Version',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Vorherige Sitzung wiederherstellen...',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Datei-URL in Zwischenablage kopiert!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Bilder',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
                'Antippen/Langes Antippen: Immersiven Modus wechseln',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Doppelt antippen: Auf Bildschirm skalieren / Originalgröße / Zoom zurücksetzen',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Diashow kann nicht gestartet werden',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Letzten geladenen Post erreicht',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pause',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Start',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Nicht mehr favorisieren',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Auswahl aufheben',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Mit Skalierung neu laden',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Mit Musterqualität laden',
          'viewer.appBar.loadHighQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Mit hoher Qualität laden',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Download-Status verwerfen',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Download-Status setzen',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Download',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(erzwungen)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus teilen',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Welche URL möchtest du mit Hydrus teilen?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Post-URL',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Datei-URL',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus ist nicht konfiguriert!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Datei teilen',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Datei wird bereits zum Teilen heruntergeladen. Abbrechen?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Datei wird bereits zum Teilen heruntergeladen. Abbrechen und eine neue Datei teilen?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Aktuell:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Neu:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Neu teilen',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abbrechen',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Fehler!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Vor dem Teilen ist etwas beim Speichern der Datei schief gelaufen',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Was soll geteilt werden?',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Post-URL mit Tags',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Datei-URL mit Tags',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Datei',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Datei mit Tags',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Tags auswählen',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Anmerkung',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Anmerkungen',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Booru auswählen',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru-Eintrag in die Zwischenablage kopiert',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Herunterladen?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Keine Post-URL!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Lade Datei herunter...',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Dies kann dauern, bitte warten...',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  count,
                  one: 'Quelle',
                  few: 'Quellen',
                  many: 'Quellen',
                  other: 'Quellen',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Herunterladen',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favorisieren',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Teilen',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Auswählen',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'In Browser öffnen',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Diashow',
          'galleryButtons.reloadNoScale' => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Skalierung wechseln',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Qualität wechseln',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Externer Player',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Bildsuche',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendern...',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Laden und rendern aus dem Cache...',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Laden aus dem Cache...',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Puffern...',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Laden...',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Trotzdem laden',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Laden neustarten',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Laden stoppen',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Vor ${seconds}s gestartet',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Vom Nutzer gestoppt',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Ladefehler',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Datei ist zu groß',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Durch Filter versteckt:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Videofehler',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Datei hat 0 Bytes',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dateigröße: ${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Häufige Wiedergabefehler? [Einstellungen > Video > Video Player Backend] ausprobieren',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videos deaktiviert oder nicht unterstützt',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Video in externem Player öffnen',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Video im Browser öffnen',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Laden der Daten fehlgeschlagen',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Lade Daten...',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Wiederholen',
          'media.video.openFileInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Datei im Browser öffnen',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Post im Browser öffnen',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Überprüfe aktuell:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Unbekanntes Dateiformat (.${fileExt}): Hier tippen, um sie im Browser zu öffnen',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktiv: ${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Ausstehend: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Gesamt: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Größe: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Keine Ergebnisse',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Suchanfrage ändern oder zum Wiederholen antippen',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Ende erreicht',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Geladene Seiten: ${pageNum}\nHier tippen, um letzte Seite neu zu laden',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Lade Seite #${pageNum}...',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
                  seconds,
                  one: 'Vor ${seconds} Sekunde gestartet',
                  few: 'Vor ${seconds} Sekunden gestartet',
                  many: 'Vor ${seconds} Sekunden gestartet',
                  other: 'Vor ${seconds} Sekunden gestartet',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Zum Wiederholen antippen, wenn Anfrage festhängt oder zu lange braucht',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Fehler beim Laden der Seite #${pageNum}',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Zum Wiederholen hier antippen',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Fehler, keine Ergebnisse geladen',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Zum Wiederholen hier antippen',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Künstler',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Charakter',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Urheberrecht',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Spezies',
          'tagType.lore' => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Hintergrundwissen',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Kein/Allgemein',
          _ => null,
        };
  }
}
