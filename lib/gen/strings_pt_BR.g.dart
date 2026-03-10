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
class TranslationsPtBr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsPtBr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ptBr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt-BR>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsPtBr _root = this; // ignore: unused_field

  @override
  TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'pt-BR';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Português do Brasil';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sim';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Não';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Erro';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Erro!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Sucesso';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Sucesso!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Voltar';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Depois';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Fechar';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, aguarde…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Habilitar';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Adicionar';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Editar';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remover';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Salvar';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Apagar';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Tentar novamente';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Limpar';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado para a área de transferência';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Colar';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copiar erro';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir para as configurações';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Isso pode levar algum tempo…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Sair do aplicativo?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Fechar o aplicativo';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL inválido!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'A área de transferência esta vazia!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Falha ao abrir o link';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Chave API';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID do Usuário';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Senha';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausar';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Continuar';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visite nosso servidor no Discord';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Selecionar';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Selecionar tudo';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Redefinir';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir em uma nova aba';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Mover';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Embaralhar';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordenar';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ir';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Pesquisar';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtrar';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Ou (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Página';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Página #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Endereço';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nome de Usuário';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoritos';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Baixados';
  @override
  late final _TranslationsValidationErrorsPtBr validationErrors = _TranslationsValidationErrorsPtBr._(_root);
  @override
  late final _TranslationsInitPtBr init = _TranslationsInitPtBr._(_root);
  @override
  late final _TranslationsPermissionsPtBr permissions = _TranslationsPermissionsPtBr._(_root);
  @override
  late final _TranslationsAuthenticationPtBr authentication = _TranslationsAuthenticationPtBr._(_root);
  @override
  late final _TranslationsSearchHandlerPtBr searchHandler = _TranslationsSearchHandlerPtBr._(_root);
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desabilitar';
  @override
  late final _TranslationsSnatcherPtBr snatcher = _TranslationsSnatcherPtBr._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsPtBr extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, insira um valor';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, insira um valor válido';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor, insira um número';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor, insira um valor numérico válido';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, insira um valor maior do que ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, insira um valor menor do que ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Por favor, insira um valor entre ${min} e ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor, insira um valor maior ou igual a 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor, insira um valor menor do que 4';
  @override
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Por favor, insira um valor maior do que 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Usar mais de 4 colunas pode afetar o desempenho';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Usar mais de 8 colunas pode afetar o desempenho';
}

// Path: init
class _TranslationsInitPtBr extends TranslationsInitEn {
  _TranslationsInitPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Erro de inicialização!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando proxy…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Carregando banco de dados…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Carregando boorus…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Carregando tags…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando abas…';
}

// Path: permissions
class _TranslationsPermissionsPtBr extends TranslationsPermissionsEn {
  _TranslationsPermissionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ??
      'Sem acesso ao diretório de armazenamento personalizado';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Por favor, defina o diretório de armazenamento novamente para conceder acesso ao app';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Caminho atual: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Definir diretório';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Não disponível nesta plataforma';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Redefinir diretório';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Arquivos serão salvos no diretório padrão após a redefinição';
}

// Path: authentication
class _TranslationsAuthenticationPtBr extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
      'Por favor, autentique-se para usar o aplicativo';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Hardware biométrico indisponível';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloqueio temporário';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Ocorreu um erro durante a autenticação: ${error}';
}

// Path: searchHandler
class _TranslationsSearchHandlerPtBr extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'A última aba foi removida';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Classificações alteradas';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'No ${booruType}, [rating:safe] agora é substituído por [rating:general] e [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'A classificação foi corrigida automaticamente. Use a classificação correta em buscas futuras';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Abas restauradas';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} aba restaurada da sessão anterior',
        few: '${count} abas restauradas da sessão anterior',
        many: '${count} abas restauradas da sessão anterior',
        other: '${count} abas restauradas da sessão anterior',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Algumas abas restauradas tinham boorus desconhecidos ou caracteres corrompidos.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'Foram redefinidas para o padrão ou ignoradas.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista de abas corrompidas:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Abas mescladas';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} nova aba adicionada',
        few: '${count} novas abas adicionadas',
        many: '${count} novas abas adicionadas',
        other: '${count} novas abas adicionadas',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Abas substituídas';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} aba recebida',
        few: '${count} abas recebidas',
        many: '${count} abas recebidas',
        other: '${count} abas recebidas',
      );
}

// Path: snatcher
class _TranslationsSnatcherPtBr extends TranslationsSnatcherEn {
  _TranslationsSnatcherPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Histórico de downloads';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserir tags';
}

/// The flat map containing all translations for locale <pt-BR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPtBr {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'pt-BR',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Português do Brasil',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sim',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Não',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Erro',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Erro!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Sucesso',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Sucesso!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar',
      'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Voltar',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Depois',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Fechar',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, aguarde…',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Habilitar',
      'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Adicionar',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Editar',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remover',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Salvar',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Apagar',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirmar',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Tentar novamente',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Limpar',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copiar',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiado',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiado para a área de transferência',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nada encontrado',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Colar',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copiar erro',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ir para as configurações',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Isso pode levar algum tempo…',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Sair do aplicativo?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Fechar o aplicativo',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL inválido!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'A área de transferência esta vazia!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Falha ao abrir o link',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Chave API',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID do Usuário',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Senha',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pausar',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Continuar',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visite nosso servidor no Discord',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Selecionar',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Selecionar tudo',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Redefinir',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Abrir',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Abrir em uma nova aba',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Mover',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Embaralhar',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordenar',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ir',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Pesquisar',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtrar',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Ou (~)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Página',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Página #',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Endereço',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nome de Usuário',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoritos',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Baixados',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, insira um valor',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, insira um valor válido',
      'validationErrors.invalidNumber' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor, insira um número',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor, insira um valor numérico válido',
      'validationErrors.tooSmall' =>
        ({required double min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, insira um valor maior do que ${min}',
      'validationErrors.tooBig' =>
        ({required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, insira um valor menor do que ${max}',
      'validationErrors.rangeError' =>
        ({required double min, required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
            'Por favor, insira um valor entre ${min} e ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor, insira um valor maior ou igual a 0',
      'validationErrors.lessThan4' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor, insira um valor menor do que 4',
      'validationErrors.biggerThan100' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Por favor, insira um valor maior do que 100',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Usar mais de 4 colunas pode afetar o desempenho',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Usar mais de 8 colunas pode afetar o desempenho',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Erro de inicialização!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Configurando proxy…',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Carregando banco de dados…',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Carregando boorus…',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Carregando tags…',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restaurando abas…',
      'permissions.noAccessToCustomStorageDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ??
            'Sem acesso ao diretório de armazenamento personalizado',
      'permissions.pleaseSetStorageDirectoryAgain' =>
        TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
            'Por favor, defina o diretório de armazenamento novamente para conceder acesso ao app',
      'permissions.currentPath' =>
        ({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Caminho atual: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Definir diretório',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Não disponível nesta plataforma',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Redefinir diretório',
      'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
            'Arquivos serão salvos no diretório padrão após a redefinição',
      'authentication.pleaseAuthenticateToUseTheApp' =>
        TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
            'Por favor, autentique-se para usar o aplicativo',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Hardware biométrico indisponível',
      'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloqueio temporário',
      'authentication.somethingWentWrong' =>
        ({required String error}) =>
            TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
            'Ocorreu um erro durante a autenticação: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'A última aba foi removida',
      'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
      'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Classificações alteradas',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            'No ${booruType}, [rating:safe] agora é substituído por [rating:general] e [rating:sensitive]',
      'searchHandler.appFixedRatingAutomatically' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
            'A classificação foi corrigida automaticamente. Use a classificação correta em buscas futuras',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Abas restauradas',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
              count,
              one: '${count} aba restaurada da sessão anterior',
              few: '${count} abas restauradas da sessão anterior',
              many: '${count} abas restauradas da sessão anterior',
              other: '${count} abas restauradas da sessão anterior',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
            'Algumas abas restauradas tinham boorus desconhecidos ou caracteres corrompidos.',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
            'Foram redefinidas para o padrão ou ignoradas.',
      'searchHandler.listOfBrokenTabs' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista de abas corrompidas:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Abas mescladas',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
              count,
              one: '${count} nova aba adicionada',
              few: '${count} novas abas adicionadas',
              many: '${count} novas abas adicionadas',
              other: '${count} novas abas adicionadas',
            ),
      'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Abas substituídas',
      'searchHandler.receivedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
              count,
              one: '${count} aba recebida',
              few: '${count} abas recebidas',
              many: '${count} abas recebidas',
              other: '${count} abas recebidas',
            ),
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desabilitar',
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Histórico de downloads',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserir tags',
      _ => null,
    };
  }
}
