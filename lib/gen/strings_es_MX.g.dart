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
class TranslationsEsMx extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsEsMx({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.esMx,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <es-MX>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsEsMx _root = this; // ignore: unused_field

  @override
  TranslationsEsMx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEsMx(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'es-MX';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Español';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '¡Error!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Hecho';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '¡Hecho!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Regresar';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Después';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Cerrar';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Si';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor espere...';
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
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Quitar';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Guardar';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Borrar';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Reintentar';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Despejar';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado en el portapapeles';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Pegar';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Error de copia';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir a configuración';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Esto podría tardar...';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '¿Salir de la app?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Cerrar app';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '¡URL Invalida!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '¡El portapapeles está vacío!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Error al abrir el link';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Llave API';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID de usuario';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Iniciar sesión';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Contraseña';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausa';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Reanudar';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita nuestro servidor de Discord';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Ítem';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleccionar';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleccionar todo';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetear';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir en una nueva pestaña';
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
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (-)';
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
  late final Translations$validationErrors$es_MX validationErrors = Translations$validationErrors$es_MX.internal(_root);
  @override
  late final Translations$init$es_MX init = Translations$init$es_MX.internal(_root);
  @override
  late final Translations$authentication$es_MX authentication = Translations$authentication$es_MX.internal(_root);
  @override
  late final Translations$snatcher$es_MX snatcher = Translations$snatcher$es_MX.internal(_root);
}

// Path: validationErrors
class Translations$validationErrors$es_MX extends Translations$validationErrors$en {
  Translations$validationErrors$es_MX.internal(TranslationsEsMx root) : this._root = root, super.internal(root);

  final TranslationsEsMx _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor ingrese un valor';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor ingrese un valor válido';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor ingrese un número';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor ingrese un valor numérico válido';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor ingrese un valor mayor que ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor ingrese un valor menor que ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Por favor ingrese un valor entre ${min} y ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor ingrese un valor igual o mayor que 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor ingrese un valor menor que 4';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Usar mas de 4 Columnas Puede Afectar el Rendimiento';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Usar mas de 8 Columnas Puede Afectar el Rendimiento';
}

// Path: init
class Translations$init$es_MX extends Translations$init$en {
  Translations$init$es_MX.internal(TranslationsEsMx root) : this._root = root, super.internal(root);

  final TranslationsEsMx _root; // ignore: unused_field

  // Translations
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando Proxy...';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Leyendo la Base de Datos...';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Cargando Boorus...';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Cargando Etiquetas...';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando Pestañas...';
}

// Path: authentication
class Translations$authentication$es_MX extends Translations$authentication$en {
  Translations$authentication$es_MX.internal(TranslationsEsMx root) : this._root = root, super.internal(root);

  final TranslationsEsMx _root; // ignore: unused_field

  // Translations
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Hardware Biometrico No Disponible';
}

// Path: snatcher
class Translations$snatcher$es_MX extends Translations$snatcher$en {
  Translations$snatcher$es_MX.internal(TranslationsEsMx root) : this._root = root, super.internal(root);

  final TranslationsEsMx _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Descargar...';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Historial de Descargas';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'ingresar Etiquetas';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Cantidad';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Cantidad de Archivos a Descargar';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Delay (En ms)';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Descargar Archivos';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'El Archivo ya ha Sido Descargado';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Error al Descargar el Archivo';
}

/// The flat map containing all translations for locale <es-MX>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEsMx {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'es-MX',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Español',
      'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '¡Error!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Hecho',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '¡Hecho!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar',
      'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Regresar',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Después',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Cerrar',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Si',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor espere...',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Activar',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desactivar',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Añadir',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Editar',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Quitar',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Guardar',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Borrar',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Reintentar',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Despejar',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado en el portapapeles',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Pegar',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Error de copia',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir a configuración',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Esto podría tardar...',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '¿Salir de la app?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Cerrar app',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '¡URL Invalida!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '¡El portapapeles está vacío!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Error al abrir el link',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Llave API',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID de usuario',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Iniciar sesión',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Contraseña',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausa',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Reanudar',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita nuestro servidor de Discord',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Ítem',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleccionar',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleccionar todo',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetear',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir en una nueva pestaña',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Mover',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Barajar',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordenar',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ir',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Buscar',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtrar',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (-)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Página',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Página #',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Etiquetas',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nombre',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Dirección',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nombre de usuario',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoritos',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Descargas',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor ingrese un valor',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor ingrese un valor válido',
      'validationErrors.invalidNumber' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor ingrese un número',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor ingrese un valor numérico válido',
      'validationErrors.tooSmall' => ({
        required double min,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor ingrese un valor mayor que ${min}',
      'validationErrors.tooBig' => ({
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor ingrese un valor menor que ${max}',
      'validationErrors.rangeError' =>
        ({required double min, required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
            'Por favor ingrese un valor entre ${min} y ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor ingrese un valor igual o mayor que 0',
      'validationErrors.lessThan4' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor ingrese un valor menor que 4',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
            'Usar mas de 4 Columnas Puede Afectar el Rendimiento',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
            'Usar mas de 8 Columnas Puede Afectar el Rendimiento',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando Proxy...',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Leyendo la Base de Datos...',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Cargando Boorus...',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Cargando Etiquetas...',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando Pestañas...',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Hardware Biometrico No Disponible',
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Descargar...',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Historial de Descargas',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'ingresar Etiquetas',
      'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Cantidad',
      'snatcher.amountOfFilesToSnatch' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Cantidad de Archivos a Descargar',
      'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Delay (En ms)',
      'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Descargar Archivos',
      'snatcher.itemWasAlreadySnatched' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'El Archivo ya ha Sido Descargado',
      'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Error al Descargar el Archivo',
      _ => null,
    };
  }
}
