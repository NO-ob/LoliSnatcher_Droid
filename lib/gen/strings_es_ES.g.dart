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
class TranslationsEsEs extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsEsEs({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.esEs,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <es-ES>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsEsEs _root = this; // ignore: unused_field

  @override
  TranslationsEsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEsEs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'es-ES';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Español';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Éxito';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Éxito!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Volver';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Luego';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Cerrar';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sí';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, espera...';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Activar';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desactivar';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Añadir';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Editar';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Eliminar';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Guardar';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Eliminar';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Reintentar';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Limpiar';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado al portapapeles';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Pegar';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Error al copiar';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir a ajustes';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Esto puede tardar un poco...';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Salir de la aplicación?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Cerrar la aplicación';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL invalida!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'El portapapeles está vacío!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Error al abrir el enlace';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Clave API';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID de usuario';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Usuario o correo';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Contraseña';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausar';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Reanudar';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita nuestro servidor de Discord';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Elemento';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleccionar';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleccionar todo';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Restablecer';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir en nueva pestaña';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Mover';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Barajar';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordenar';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ir';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Buscar';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtrar';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Página';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Página #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Etiquetas';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nombre';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Dirección';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nombre de usuario';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoritos';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Descargas';
  @override
  late final Translations$validationErrors$es_ES validationErrors = Translations$validationErrors$es_ES.internal(_root);
  @override
  late final Translations$init$es_ES init = Translations$init$es_ES.internal(_root);
}

// Path: validationErrors
class Translations$validationErrors$es_ES extends Translations$validationErrors$en {
  Translations$validationErrors$es_ES.internal(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, introduzca un valor';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, introduzca un valor válido';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor, introduzca un numero';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor, introduzca un numero valido';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, introduzca un valor mayor que ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, introduzca un valor menor que ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Por favor, introduzca un valor entre ${min} y ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor, introduzca un valor igual o mayor que 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor, introduzca un valor menor que 4';
  @override
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Por favor, introduzca un valor mayor que 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Usar mas de 4 columnas puede afectar al rendimiento';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Usar mas de 8 columnas puede afectar al rendimiento';
}

// Path: init
class Translations$init$es_ES extends Translations$init$en {
  Translations$init$es_ES.internal(TranslationsEsEs root) : this._root = root, super.internal(root);

  final TranslationsEsEs _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Error de inicialización!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando proxy...';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Cargando base de datos';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Cargando boorus...';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Cargando etiquetas...';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando pestañas...';
}

/// The flat map containing all translations for locale <es-ES>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEsEs {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'es-ES',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Español',
      'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Éxito',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Éxito!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar',
      'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Volver',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Luego',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Cerrar',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sí',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, espera...',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Activar',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desactivar',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Añadir',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Editar',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Eliminar',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Guardar',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Eliminar',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Reintentar',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Limpiar',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado al portapapeles',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Pegar',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Error al copiar',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir a ajustes',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Esto puede tardar un poco...',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Salir de la aplicación?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Cerrar la aplicación',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL invalida!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'El portapapeles está vacío!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Error al abrir el enlace',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Clave API',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID de usuario',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Usuario o correo',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Contraseña',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausar',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Reanudar',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita nuestro servidor de Discord',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Elemento',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleccionar',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleccionar todo',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Restablecer',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir en nueva pestaña',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Mover',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Barajar',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordenar',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ir',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Buscar',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtrar',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (~)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Página',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Página #',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Etiquetas',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nombre',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Dirección',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nombre de usuario',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoritos',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Descargas',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, introduzca un valor',
      'validationErrors.invalid' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, introduzca un valor válido',
      'validationErrors.invalidNumber' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor, introduzca un numero',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor, introduzca un numero valido',
      'validationErrors.tooSmall' => ({
        required double min,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, introduzca un valor mayor que ${min}',
      'validationErrors.tooBig' => ({
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, introduzca un valor menor que ${max}',
      'validationErrors.rangeError' =>
        ({required double min, required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
            'Por favor, introduzca un valor entre ${min} y ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
            'Por favor, introduzca un valor igual o mayor que 0',
      'validationErrors.lessThan4' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor, introduzca un valor menor que 4',
      'validationErrors.biggerThan100' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Por favor, introduzca un valor mayor que 100',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
            'Usar mas de 4 columnas puede afectar al rendimiento',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
            'Usar mas de 8 columnas puede afectar al rendimiento',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Error de inicialización!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando proxy...',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Cargando base de datos',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Cargando boorus...',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Cargando etiquetas...',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando pestañas...',
      _ => null,
    };
  }
}
