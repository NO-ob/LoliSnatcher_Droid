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
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ptBr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt-BR>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsPtBr _root = this; // ignore: unused_field

  @override
  TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'pt-BR';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Português do Brasil';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
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
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sim';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Não';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, aguarde…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Habilitar';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desabilitar';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Adicionar';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Excluir';
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
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';
  @override
  String get secondsShort => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's';
  @override
  String get minutesShort => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm';
  @override
  String get hoursShort => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h';
  @override
  String get daysShort => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'd';
  @override
  String get leaveThisPageQuestion => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Sair desta página?';
  @override
  String get pageWillCloseAutomatically =>
      TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Esta página será fechada automaticamente';
  @override
  String get stay => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Ficar';
  @override
  String get leaveNow => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Sair agora';
  @override
  late final _Translations$validationErrors$pt_BR validationErrors = _Translations$validationErrors$pt_BR._(_root);
  @override
  late final _Translations$init$pt_BR init = _Translations$init$pt_BR._(_root);
  @override
  late final _Translations$permissions$pt_BR permissions = _Translations$permissions$pt_BR._(_root);
  @override
  late final _Translations$authentication$pt_BR authentication = _Translations$authentication$pt_BR._(_root);
  @override
  late final _Translations$searchHandler$pt_BR searchHandler = _Translations$searchHandler$pt_BR._(_root);
  @override
  late final _Translations$snatcher$pt_BR snatcher = _Translations$snatcher$pt_BR._(_root);
  @override
  late final _Translations$multibooru$pt_BR multibooru = _Translations$multibooru$pt_BR._(_root);
  @override
  late final _Translations$hydrus$pt_BR hydrus = _Translations$hydrus$pt_BR._(_root);
  @override
  late final _Translations$tabs$pt_BR tabs = _Translations$tabs$pt_BR._(_root);
  @override
  late final _Translations$history$pt_BR history = _Translations$history$pt_BR._(_root);
  @override
  late final _Translations$webview$pt_BR webview = _Translations$webview$pt_BR._(_root);
  @override
  late final _Translations$settings$pt_BR settings = _Translations$settings$pt_BR._(_root);
  @override
  late final _Translations$comments$pt_BR comments = _Translations$comments$pt_BR._(_root);
  @override
  late final _Translations$pageChanger$pt_BR pageChanger = _Translations$pageChanger$pt_BR._(_root);
  @override
  late final _Translations$tagsFiltersDialogs$pt_BR tagsFiltersDialogs = _Translations$tagsFiltersDialogs$pt_BR._(_root);
  @override
  late final _Translations$tagsManager$pt_BR tagsManager = _Translations$tagsManager$pt_BR._(_root);
  @override
  late final _Translations$lockscreen$pt_BR lockscreen = _Translations$lockscreen$pt_BR._(_root);
  @override
  late final _Translations$loliSync$pt_BR loliSync = _Translations$loliSync$pt_BR._(_root);
  @override
  late final _Translations$imageSearch$pt_BR imageSearch = _Translations$imageSearch$pt_BR._(_root);
  @override
  late final _Translations$tagView$pt_BR tagView = _Translations$tagView$pt_BR._(_root);
  @override
  late final _Translations$pinnedTags$pt_BR pinnedTags = _Translations$pinnedTags$pt_BR._(_root);
  @override
  late final _Translations$searchBar$pt_BR searchBar = _Translations$searchBar$pt_BR._(_root);
  @override
  late final _Translations$mobileHome$pt_BR mobileHome = _Translations$mobileHome$pt_BR._(_root);
  @override
  late final _Translations$desktopHome$pt_BR desktopHome = _Translations$desktopHome$pt_BR._(_root);
  @override
  late final _Translations$galleryView$pt_BR galleryView = _Translations$galleryView$pt_BR._(_root);
  @override
  late final _Translations$mediaPreviews$pt_BR mediaPreviews = _Translations$mediaPreviews$pt_BR._(_root);
  @override
  late final _Translations$viewer$pt_BR viewer = _Translations$viewer$pt_BR._(_root);
  @override
  late final _Translations$common$pt_BR common = _Translations$common$pt_BR._(_root);
  @override
  late final _Translations$gallery$pt_BR gallery = _Translations$gallery$pt_BR._(_root);
  @override
  late final _Translations$galleryButtons$pt_BR galleryButtons = _Translations$galleryButtons$pt_BR._(_root);
  @override
  late final _Translations$media$pt_BR media = _Translations$media$pt_BR._(_root);
  @override
  late final _Translations$imageStats$pt_BR imageStats = _Translations$imageStats$pt_BR._(_root);
  @override
  late final _Translations$preview$pt_BR preview = _Translations$preview$pt_BR._(_root);
  @override
  late final _Translations$tagType$pt_BR tagType = _Translations$tagType$pt_BR._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$pt_BR extends Translations$validationErrors$en {
  _Translations$validationErrors$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

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
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, insira um valor maior que ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, insira um valor menor que ${max}';
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
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Usar mais de 4 colunas pode afetar o desempenho do app';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Usar mais de 8 colunas pode afetar o desempenho do app';
}

// Path: init
class _Translations$init$pt_BR extends Translations$init$en {
  _Translations$init$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

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
class _Translations$permissions$pt_BR extends Translations$permissions$en {
  _Translations$permissions$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

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
class _Translations$authentication$pt_BR extends Translations$authentication$en {
  _Translations$authentication$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

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
class _Translations$searchHandler$pt_BR extends Translations$searchHandler$en {
  _Translations$searchHandler$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'A última aba foi removida';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Redefinindo para as tags padrão';
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
class _Translations$snatcher$pt_BR extends Translations$snatcher$en {
  _Translations$snatcher$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Histórico de downloads';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserir tags';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantidade';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Quantidade de arquivos para baixar';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Tempo de espera (em ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Tempo de espera entre cada download';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Arquivos baixados';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'O item já foi baixado anteriormente';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Falha ao baixar o item';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'O item foi cancelado';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Começando próximo item da fila…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Item baixado';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Baixado: ${count} item',
        few: 'Baixados: ${count} itens',
        many: 'Baixados: ${count} itens',
        other: 'Baixados: ${count} itens',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} arquivo já foi baixado',
        few: '${count} arquivos já foram baixados',
        many: '${count} arquivos já foram baixados',
        other: '${count} arquivos já foram baixados',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Falha ao baixar ${count} arquivo',
        few: 'Falha ao baixar ${count} arquivos',
        many: 'Falha ao baixar ${count} arquivos',
        other: 'Falha ao baixar ${count} arquivos',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} arquivo cancelado',
        few: '${count} arquivos cancelados',
        many: '${count} arquivos cancelados',
        other: '${count} arquivos cancelados',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Baixando imagens';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Não feche o app!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Item adicionado à fila de download';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} item adicionado a fila de download',
        few: '${count} itens adicionados a fila de download',
        many: '${count} itens adicionados a fila de download',
        other: '${count} itens adicionados a fila de download',
      );
}

// Path: multibooru
class _Translations$multibooru$pt_BR extends Translations$multibooru$en {
  _Translations$multibooru$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Modo Multibooru';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Requer ao menos 2 boorus configurados';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Selecione boorus adicionais:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'Ou seja, modo Multibooru';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Boorus adicionais para incluir';
}

// Path: hydrus
class _Translations$hydrus$pt_BR extends Translations$hydrus$en {
  _Translations$hydrus$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Erro ao importar para o Hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Talvez as permissões da API não estejam corretas. Você pode editá-las em \'Revisar Serviços\'';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Adicionar tags ao arquivo';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Adicionar URLs';
}

// Path: tabs
class _Translations$tabs$pt_BR extends Translations$tabs$en {
  _Translations$tabs$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Aba';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Adicionar boorus nas configurações';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Selecione um Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Boorus secundários';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Nova aba';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Selecione um booru ou deixe vazio';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Posição';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Aba anterior';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Próximo aba';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Fim da lista';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Busca utilizada';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Padrão';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Atual';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Personalizada';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Busca personalizada';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[vazia]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Adicionar boorus secundários';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Manter boorus secundários';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Página inicial personalizada';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Mudar para uma nova aba';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'adicionar';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Gerenciador de abas';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Modo de seleção';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Ordenar abas';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Ajuda';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Apagar abas';
  @override
  String get deleteDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Excluir abas duplicadas';
  @override
  String get deleteDuplicateTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
      'Abas duplicadas encontradas. Selecione as abas que deseja manter em cada grupo:';
  @override
  String get keepFirstDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Manter a primeira';
  @override
  String get keepLastDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Manter a última';
  @override
  String get skipDuplicateTabDelete => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Pular';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Embaralhar abas';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Abas embaralhadas aleatoriamente';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Ordem das abas salva';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Rolar para a aba atual';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Rolar para o topo';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Rolar para o fim';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtrar por booru, estado, duplicadas...';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Rolagem:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Ordenação:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Ordem padrão das abas';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Ordem alfabetica';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Ordem alfabética (inversa)"';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Ordem alfabética por booru';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Ordem alfabética por booru (inversa)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Segure o botão de ordenação para salvar a ordem atual';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Selecionar:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Alternar modo de seleção';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'No fim da pagina:';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Selecionar/desmarcar todas as abas';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Apagar abas selecionadas';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Segure uma aba para movê-la';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Números no canto inferior direito da aba:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Primeiro número — índice da aba na ordem padrão da lista';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Second number - tab index in current list order, appears when filtering/sorting is active';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtros especiais:';
  @override
  String get loadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '​«Carregadas» — mostrar abas que possuem itens carregados';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '​«Não carregadas» — mostrar abas que não estão carregadas e/ou possuem zero itens';
  @override
  String get notLoadedItalic =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Abas não carregadas possuem texto em itálico';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nenhuma aba encontrada';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copiar';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Mover';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Remover';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Embaralhar';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Ordenar';
  @override
  String get shuffleTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Embaralhar a ordem das abas aleatoriamente?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Salvar abas na ordem de classificação atual?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Por Booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabeticamente';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertida)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Você tem certeza de que quer deletar ${count} aba?',
        few: 'Você tem certeza de que quer deletar ${count} abas?',
        many: 'Você tem certeza de que quer deletar ${count} abas?',
        other: 'Você tem certeza de que quer deletar ${count} abas?',
      );
  @override
  late final _Translations$tabs$filters$pt_BR filters = _Translations$tabs$filters$pt_BR._(_root);
  @override
  late final _Translations$tabs$move$pt_BR move = _Translations$tabs$move$pt_BR._(_root);
}

// Path: history
class _Translations$history$pt_BR extends Translations$history$en {
  _Translations$history$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Search history';
  @override
  String get searchHistoryIsEmpty =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'O histórico de busca está vazio';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Histórico de busca desativado';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      'Ative o banco de dados nas configurações para o histórico de busca';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Última busca: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Última busca em: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Tipo de Booru desconhecido!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Booru desconhecido (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Abrir';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Abrir em uma nova aba';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remover dos favoritos';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Definir como Favorito';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copiar';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Deletar';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Excluir itens do histórico';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Tem certeza de que deseja excluir ${count} item?',
        few: 'Tem certeza de que deseja excluir ${count} itens?',
        many: 'Tem certeza de que deseja excluir ${count} itens?',
        other: 'Tem certeza de que deseja excluir ${count} itens?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Limpar seleção';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Excluir ${count} item',
        few: 'Excluir ${count} itens',
        many: 'Excluir ${count} itens',
        other: 'Excluir ${count} itens',
      );
}

// Path: webview
class _Translations$webview$pt_BR extends Translations$webview$en {
  _Translations$webview$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';
  @override
  String get notSupportedOnDevice =>
      TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Não supordado nesse dispositivo';
  @override
  String get captcha => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha';
  @override
  String get captchaCheckDescription =>
      TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
      'Possível CAPTCHA detectado! Por favor, resolva-o e retorne após concluir)';
  @override
  String get captchaCompleted => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha completado';
  @override
  late final _Translations$webview$navigation$pt_BR navigation = _Translations$webview$navigation$pt_BR._(_root);
}

// Path: settings
class _Translations$settings$pt_BR extends Translations$settings$en {
  _Translations$settings$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Configurações';
  @override
  late final _Translations$settings$language$pt_BR language = _Translations$settings$language$pt_BR._(_root);
  @override
  late final _Translations$settings$booru$pt_BR booru = _Translations$settings$booru$pt_BR._(_root);
  @override
  late final _Translations$settings$booruEditor$pt_BR booruEditor = _Translations$settings$booruEditor$pt_BR._(_root);
  @override
  late final _Translations$settings$interface$pt_BR interface = _Translations$settings$interface$pt_BR._(_root);
  @override
  late final _Translations$settings$theme$pt_BR theme = _Translations$settings$theme$pt_BR._(_root);
  @override
  late final _Translations$settings$viewer$pt_BR viewer = _Translations$settings$viewer$pt_BR._(_root);
  @override
  late final _Translations$settings$video$pt_BR video = _Translations$settings$video$pt_BR._(_root);
  @override
  late final _Translations$settings$downloads$pt_BR downloads = _Translations$settings$downloads$pt_BR._(_root);
  @override
  late final _Translations$settings$database$pt_BR database = _Translations$settings$database$pt_BR._(_root);
  @override
  late final _Translations$settings$backupAndRestore$pt_BR backupAndRestore = _Translations$settings$backupAndRestore$pt_BR._(_root);
  @override
  late final _Translations$settings$network$pt_BR network = _Translations$settings$network$pt_BR._(_root);
  @override
  late final _Translations$settings$privacy$pt_BR privacy = _Translations$settings$privacy$pt_BR._(_root);
  @override
  late final _Translations$settings$performance$pt_BR performance = _Translations$settings$performance$pt_BR._(_root);
  @override
  late final _Translations$settings$cache$pt_BR cache = _Translations$settings$cache$pt_BR._(_root);
  @override
  late final _Translations$settings$itemFilters$pt_BR itemFilters = _Translations$settings$itemFilters$pt_BR._(_root);
  @override
  late final _Translations$settings$sync$pt_BR sync = _Translations$settings$sync$pt_BR._(_root);
  @override
  late final _Translations$settings$about$pt_BR about = _Translations$settings$about$pt_BR._(_root);
  @override
  late final _Translations$settings$checkForUpdates$pt_BR checkForUpdates = _Translations$settings$checkForUpdates$pt_BR._(_root);
  @override
  late final _Translations$settings$logs$pt_BR logs = _Translations$settings$logs$pt_BR._(_root);
  @override
  late final _Translations$settings$help$pt_BR help = _Translations$settings$help$pt_BR._(_root);
  @override
  late final _Translations$settings$debug$pt_BR debug = _Translations$settings$debug$pt_BR._(_root);
  @override
  late final _Translations$settings$logging$pt_BR logging = _Translations$settings$logging$pt_BR._(_root);
  @override
  late final _Translations$settings$webview$pt_BR webview = _Translations$settings$webview$pt_BR._(_root);
  @override
  late final _Translations$settings$dirPicker$pt_BR dirPicker = _Translations$settings$dirPicker$pt_BR._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Versão';
}

// Path: comments
class _Translations$comments$pt_BR extends Translations$comments$en {
  _Translations$comments$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Comentários';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nenhum comentário';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'Este booru não tem comentários ou não há API para eles';
}

// Path: pageChanger
class _Translations$pageChanger$pt_BR extends Translations$pageChanger$en {
  _Translations$pageChanger$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Seletor de páginas';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Página #';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Atraso entre carregamentos (em ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Atraso em ms';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Página atual #${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Página máxima possível #~${number}';
  @override
  String get searchCurrentlyRunning => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Busca em andamento!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Ir para a página';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Buscar até a página';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Parar busca';
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$pt_BR extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Campo vazio!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Adicionar novo filtro de ${type}]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Novo filtro de tag: ${type}';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Novo filtro';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Editar filtro';
}

// Path: tagsManager
class _Translations$tagsManager$pt_BR extends Translations$tagsManager$en {
  _Translations$tagsManager$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Adicionar tag';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Nome';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tipo';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'adicionar';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Obsoleto após: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Uma aba adicionada';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Adicionar aba';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copiar';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Marcar como obsoleto';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Redefinir obsoletos';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Tornar inexpirável';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Excluir ${count} tag',
        few: 'Excluir ${count} tags',
        many: 'Excluir ${count} tags',
        other: 'Excluir ${count} tags',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Excluir tags';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Limpar seleção';
}

// Path: lockscreen
class _Translations$lockscreen$pt_BR extends Translations$lockscreen$en {
  _Translations$lockscreen$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Toque para autenticar';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DESBLOQUEIO DEV';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[EM TESTES]: Toque aqui se não conseguir desbloquear o aplicativo pelos meios normais. Relate ao desenvolvedor com detalhes sobre o seu dispositivo.';
}

// Path: loliSync
class _Translations$loliSync$pt_BR extends Translations$loliSync$en {
  _Translations$loliSync$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sync';
  @override
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Deseja parar a sincronização?';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Deseja parar o servidor?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Sem conexão';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Aguardando conexão…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Iniciando o servidor…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Manter a tela acesa';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Servidor de sincronização encerrado';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Erro no teste: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Erro no teste: ${error}';
  @override
  String get testSuccess =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'A requisição de teste recebeu uma resposta positiva';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Deve haver uma mensagem de "Teste" no outro dispositivo';
}

// Path: imageSearch
class _Translations$imageSearch$pt_BR extends Translations$imageSearch$en {
  _Translations$imageSearch$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Pesquisa por imagem';
}

// Path: tagView
class _Translations$tagView$pt_BR extends Translations$tagView$en {
  _Translations$tagView$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Comentários';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Exibir notas (${count})';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Ocultar notas (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Carregar notas';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Esta tag já está na busca atual:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Adicionada à atual lista de pesquisa';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nova aba adicionada';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL do post';
  @override
  String get uploader => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Postado';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detalhes';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Nome do arquivo';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Extensão';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Resolução';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Tamanho';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Classificação';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Pontuação';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nenhuma tag encontrada';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copiar';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Remover da Pesquisa';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Adicionar à pesquisa';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Adicionada a barra de pesquisa';
  @override
  String get excludeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Excluir da busca';
  @override
  String get exclusionAddedToSearchBar =>
      TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Exclusão adicionada à barra de busca:';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Adicionar aos marcados';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Adicionar aos Ocultos';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Remover dos Marcados';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Remover dos Ocultos';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Editar tag';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Fonte';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Prévia';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Selecione um booru para carregar';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Carregando prévia…';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Falha ao carregar prévia';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Toque para tentar novamente';
  @override
  String get copiedFileURL =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL do arquivo copiada para a área de transferência';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Prévia de tags';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Estado atual';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Histórico';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Falha ao carregar a página de prévia';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Tentar novamente';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Links detectados:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Abas relacionadas';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Abas apenas com esta tag';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'Abas apenas com esta tag, mas em outro booru';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Abas contendo esta tag';
}

// Path: pinnedTags
class _Translations$pinnedTags$pt_BR extends Translations$pinnedTags$en {
  _Translations$pinnedTags$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Tags fixadas';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Fixar tag';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Desfixar tag';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Fixar';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Desfixar';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Fixar "${tag}" no acesso rápido?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Remover "${tag}" das tags fixadas?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Apenas para ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Rótulos (opcional)';
  @override
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Digite e toque no botão "Adicionar" para incluir uma etiqueta';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Selecionar etiqueta existente';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag fixada';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Fixado para ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Fixado globalmente${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag desfixada';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Todas';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Reordenar tags fixadas';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Salvando…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Reordenar';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Adicionar tag manualmente';
  @override
  String get noTagsMatchSearch =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nenhuma tag corresponde à sua busca';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Nenhuma tag fixada ainda';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Editar etiquetas';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Rótulos';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Adicionar tag fixada';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Busca da tag';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nome_da_tag';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
      'Você pode inserir qualquer termo de busca, incluindo tags com espaços';
}

// Path: searchBar
class _Translations$searchBar$pt_BR extends Translations$searchBar$en {
  _Translations$searchBar$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Buscar tags';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Não foi possível carregar as sugestões. Toque para tentar novamente${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nenhuma sugestão encontrada';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Sugestões de tags indisponíveis para este booru';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '«${tag}» copiado para área de transferência';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefixo';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Excluir (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatags';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metatags livres';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Metatags livres não contam no limite de busca de tags';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Livre';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Único';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Intervalo';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popular';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Selecionar data';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Selecionar intervalo de datas';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Histórico';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class _Translations$mobileHome$pt_BR extends Translations$mobileHome$en {
  _Translations$mobileHome$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Selecione o booru para o webview';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Bloquear app';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'O arquivo já existe';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Falha ao baixar';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Cancelado pelo usuário';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Salvar mesmo assim';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Pular';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Tentar todos novamente (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Itens existentes, com falha ou cancelados';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Limpar todos os itens que podem ser retentados';
}

// Path: desktopHome
class _Translations$desktopHome$pt_BR extends Translations$desktopHome$en {
  _Translations$desktopHome$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Downloader';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Adicionar outros boorus';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Configurações';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Salvar';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nenhum item selecionado';
}

// Path: galleryView
class _Translations$galleryView$pt_BR extends Translations$galleryView$en {
  _Translations$galleryView$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nenhum item';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nenhum item selecionado';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Fechar';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$pt_BR extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nenhuma configuração de booru encontrada';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Adicionar novo Booru';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Ajuda';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Configurações';
  @override
  String get onboardingTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Configure sua primeira fonte';
  @override
  String get onboardingSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
      'Adicione uma configuração de booru ou restaure um backup para começar a navegar';
  @override
  String get addBooruAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Adicionar novo booru';
  @override
  String get addBooruActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
      'Conecte um site adicionando sua URL e configurações de busca';
  @override
  String get restoreBackupAction =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Restaurar ou gerenciar backups';
  @override
  String get restoreBackupActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
      'Recupere configurações, boorus, abas e dados salvos';
  @override
  String get openSettingsAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Abrir configurações';
  @override
  String get openSettingsActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
      'Ajuste o comportamento do aplicativo antes de configurar as fontes';
  @override
  String get helpSectionTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Precisa de ajuda?';
  @override
  String get booruSourcesArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
      'Como adicionar uma configuração de booru e como elas funcionam';
  @override
  String get booruSourcesArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
      'Instruções para usuários que estão criando sua primeira configuração de booru';
  @override
  String get backupRestoreArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Restaurando dados de um backup';
  @override
  String get backupRestoreArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
      'Instruções para usuários que estão migrando de um app/versão anterior';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restaurando sessão anterior…';
  @override
  String get copiedFileURL =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL do arquivo copiada para a área de transferência!';
}

// Path: viewer
class _Translations$viewer$pt_BR extends Translations$viewer$en {
  _Translations$viewer$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$tutorial$pt_BR tutorial = _Translations$viewer$tutorial$pt_BR._(_root);
  @override
  late final _Translations$viewer$appBar$pt_BR appBar = _Translations$viewer$appBar$pt_BR._(_root);
  @override
  late final _Translations$viewer$notes$pt_BR notes = _Translations$viewer$notes$pt_BR._(_root);
}

// Path: common
class _Translations$common$pt_BR extends Translations$common$en {
  _Translations$common$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Selecionar um booru';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Item do booru copiado para a área de transferência';
}

// Path: gallery
class _Translations$gallery$pt_BR extends Translations$gallery$en {
  _Translations$gallery$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Baixar?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Sem URL do post!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Carregando arquivo…';
  @override
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Isso pode levar algum tempo, aguarde…';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Fonte',
        few: 'Fontes',
        many: 'Fontes',
        other: 'Fontes',
      );
}

// Path: galleryButtons
class _Translations$galleryButtons$pt_BR extends Translations$galleryButtons$en {
  _Translations$galleryButtons$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Baixar';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favorito';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Compartilhar';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Selecionar';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Abrir no navegador';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Apresentação de slides';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Alternar escala';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Alternar qualidade';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Player externo';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Buscar por imagem';
}

// Path: media
class _Translations$media$pt_BR extends Translations$media$en {
  _Translations$media$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$loading$pt_BR loading = _Translations$media$loading$pt_BR._(_root);
  @override
  late final _Translations$media$video$pt_BR video = _Translations$media$video$pt_BR._(_root);
}

// Path: imageStats
class _Translations$imageStats$pt_BR extends Translations$imageStats$en {
  _Translations$imageStats$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Live: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Pendente: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Total: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Tamanho: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Máx: ${max}';
}

// Path: preview
class _Translations$preview$pt_BR extends Translations$preview$en {
  _Translations$preview$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$pt_BR error = _Translations$preview$error$pt_BR._(_root);
}

// Path: tagType
class _Translations$tagType$pt_BR extends Translations$tagType$en {
  _Translations$tagType$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Personagem';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Direitos autorais';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Espécie';
  @override
  String get lore => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nenhum/Geral';
}

// Path: tabs.filters
class _Translations$tabs$filters$pt_BR extends Translations$tabs$filters$en {
  _Translations$tabs$filters$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Carregada';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tipo de tag';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicadas';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Verificar duplicadas no mesmo Booru';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Consulta de busca vazia';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtros de abas';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Todas';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Não caregada';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Ativado';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Desativado';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Também ativará a ordenação';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      'Filtrar abas que contêm ao menos uma tag do tipo selecionado';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Qualquer';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Aplicar';
}

// Path: tabs.move
class _Translations$tabs$move$pt_BR extends Translations$tabs$move$en {
  _Translations$tabs$move$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Mover para o início';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Mover para o fim';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Número da tab';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Número da aba inválido.';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Entrada inválida';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Fora do intervalo';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Por favor, digite um número de aba válido';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Mover para #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Prévia:';
}

// Path: webview.navigation
class _Translations$webview$navigation$pt_BR extends Translations$webview$navigation$en {
  _Translations$webview$navigation$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Digite uma URL';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Digite uma URL personalizada';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navegar para ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Listar cookies';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Limpar cookies';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Cookies limpos';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Obter favicon';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Nenhum favicon encontrado';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(o texto acima é selecionável)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copiar URL';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL copiado para a area de transferência';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Histórico';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nenhum item no histórico para voltar';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nenhum item no histórico para avançar';
}

// Path: settings.language
class _Translations$settings$language$pt_BR extends Translations$settings$language$en {
  _Translations$settings$language$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Idioma';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistema';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Nos ajude a traduzir';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Visite o <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> para detalhes ou toque na imagem abaixo para ir para o POEditor';
}

// Path: settings.booru
class _Translations$settings$booru$pt_BR extends Translations$settings$booru$en {
  _Translations$settings$booru$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Pesquisa';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Tags padrão';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Itens por página';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Alguns boorus podem ignorar isso';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Adicionar configuração de Booru';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Compartilhar configuração do Booru';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Compartilhar configuração de ${booruName} como link.\n\nIncluir chave de login/API?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Copiar o link de configuração de ${booruName} para área de transferência.\n\nIncluir chave de login/API?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Compartilhamento de Booru';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Como abrir automaticamente links de configuração do Booru no app no Android 12 ou superior:\n1) Toque no botão abaixo para abrir as configurações de links padrão do app no sistema\n2) Toque em «Adicionar link» e selecione todas as opções disponíveis';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus adicionados';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Editar configuração do Booru';
  @override
  String get importBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importar configuração de Booru da área de transferência';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Apenas URLs do loli.snatcher são suportadas';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Apagar configuração de Booru';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Ocorreu um erro ao apagar a configuração do Booru!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Configuração do Booru apagada';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      '​O Booru selecionado se torna o padrão após salvar.\n\n​O Booru padrão aparece primeiro nos menus suspensos';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Alterar Booru padrão?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Alterar para: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Clique em [Não] para manter o atual: ';
  @override
  String get changeToNewBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Clique em [Sim] para alterar para: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
      'Link de configuração do Booru copiado para a área de transferência';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nenhum Booru selecionado!';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Não é possível apagar este Booru!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remova as abas relacionadas primeiro';
  @override
  String get sourceLimitNotice =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ??
      'O comportamento de configuração de algumas fontes pode depender das configurações de compatibilidade abaixo. O conteúdo é hospedado e fornecido por sites externos e não é controlado pelo aplicativo';
  @override
  String get advanced => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Avançado';
  @override
  String get expandedSourceCompatibility =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Compatibilidade de configuração de fontes';
  @override
  String get expandedSourceCompatibilitySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
      'Ajusta como as configurações de compatibilidade de fontes são gerenciadas';
  @override
  String get expandedSourceCompatibilityConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ??
      'Alterar isso pode afetar o funcionamento das fontes. O conteúdo é hospedado e fornecido por sites externos e não é controlado pelo aplicativo. Deseja continuar?';
  @override
  String get sourceUnavailableCurrentSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Este site não está disponível';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$pt_BR extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'O teste do Booru falhou';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Os parâmetros de configuração podem estar incorretos, o Booru não permite acesso por API, a solicitação não retornou dados ou houve um erro de rede.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Salvar Booru';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Executando teste...';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Esta configuração de Booru ja existe';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
      'Ja existe uma Configuração de Booru com o mesmo nome';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
      'Já existe uma configuração de Booru com a mesma URL';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
      'Essa configuração de Booru não será adicionada';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Configuração de Booru salva';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'As abas existentes com este Booru precisam ser recarregadas para aplicar as alterações!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Falha ao verificar acesso API ao Hydrus';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Chave de acesso solicitada';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Toque em \'OK\' no Hydrus e depois em \'Aplicar\'. Em seguida, você pode tocar em \'Testar Booru\'';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Falha ao obter a chave de acesso';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Você tem a janela de solicitação aberta no Hydrus?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Para obter a chave Hydrus, você precisa abrir a caixa de diálogo de solicitação no cliente Hydrus: Serviços > Revisar serviços > API do cliente > Adicionar > Da solicitação de API';
  @override
  String get getHydrusApiKey =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Obter chave de API do Hydrus';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nome do Booru';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'O nome do Booru é obrigatório!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL do Booru';
  @override
  String get booruUrlRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'A URL do Booru é obrigatória!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tipo de Booru';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL do Favicon';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Preenchido automaticamente se vazio)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Tags padrão';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Busca padrão para o booru';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'Os campos abaixo podem ser obrigatórios para alguns boorus';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
      'Confirmar o salvamento desta configuração de Booru';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Tipo de Booru selecionado/detectado: ${booruType}';
}

// Path: settings.interface
class _Translations$settings$interface$pt_BR extends Translations$settings$interface$en {
  _Translations$settings$interface$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Modo de interface do usuário do app';
  @override
  String get appUIModeWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Modo de interface do usuário do app';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Usar o modo Desktop? Pode causar problemas em dispositivos móveis. [INTERFACE DESCONTINUADA]';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Interface dispositivos móveis';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Estilo de UI do Ahoviewer [OBSOLETO, PRECISA DE REFORMULAÇÃO]\n';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Aviso]: Não defina o Modo de Interface para Desktop em um celular, pois isso pode danificar o aplicativo e você poderá ter que apagar todas as suas configurações, incluindo as configurações do Booru.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Mão dominante';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
      'Ajusta a posição dos elementos da interface para o lado selecionado';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
      'Mostrar barra de pesquisa na grade de pré-visualização';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
      'Mover campo de entrada para o topo na tela de busca';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
      'Painel de ações rápidas da visualização de busca';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Foco automático no campo de busca';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Desativar vibração';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'Ainda pode ocorrer em algumas ações, mesmo quando desativado';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gesto de voltar preditivo';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Colunas da prévia (retrato)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Colunas da prévia (paisagem)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Qualidade da pré-visualização';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Altera a resolução das imagens na grade de prévias';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Amostra – Resolução média; o app também carregará uma miniatura temporária enquanto a qualidade mais alta é carregada';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Miniatura - Baixa resolução';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Nota]: A qualidade da amostra pode prejudicar visivelmente o desempenho, especialmente se houver muitas colunas na grade de prévias';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Exibição da prévia';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Exibição alternativa da prévia';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Isso será usado quando a opção Mosaico não for possível';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Não redimensionar imagens';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Pode reduzir o desempenho';
  @override
  String get dontScaleImagesWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Aviso';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Tem certeza de que deseja desativar o redimensionamento de imagens?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Isso pode afetar negativamente o desempenho, especialmente em dispositivos mais antigos';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniaturas em GIF';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Requer «Não redimensionar imagens»';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Posição dos botões de rolagem das prévias';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Modificador de rolagem da roda do mouse';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modificador de rolagem';
  @override
  late final _Translations$settings$interface$previewQualityValues$pt_BR previewQualityValues =
      _Translations$settings$interface$previewQualityValues$pt_BR._(_root);
  @override
  late final _Translations$settings$interface$previewDisplayModeValues$pt_BR previewDisplayModeValues =
      _Translations$settings$interface$previewDisplayModeValues$pt_BR._(_root);
  @override
  late final _Translations$settings$interface$appModeValues$pt_BR appModeValues = _Translations$settings$interface$appModeValues$pt_BR._(_root);
  @override
  late final _Translations$settings$interface$handSideValues$pt_BR handSideValues = _Translations$settings$interface$handSideValues$pt_BR._(_root);
}

// Path: settings.theme
class _Translations$settings$theme$pt_BR extends Translations$settings$theme$en {
  _Translations$settings$theme$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Temas';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Modo do tema';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Fundo preto';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Usar cores dinâmicas';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Apenas Android 12+';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Cor primária';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Cor secundária';
  @override
  String get enableDrawerMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Ativar mascote do menu lateral';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Definir mascote personalizado';
  @override
  String get removeCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remover mascote personalizado';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Caminho do mascote atual';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistema';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Claro';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Escuro';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Rosa';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Roxo';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Azul';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Azul-claro';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Vermelho';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Verde';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Personalizado';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Selecionar cor';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Cor selecionada';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Cor selecionada e seus tons';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Fonte';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Padrão do sistema';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Ver mais fontes';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'A rápida raposa marrom salta sobre o cão preguiçoso';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Fonte personalizada';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Insira o nome de qualquer Google Font';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nome da fonte';
  @override
  String get customFontHint =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Navegue pelas fontes em fonts.google.com';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Fonte não encontrada';
}

// Path: settings.viewer
class _Translations$settings$viewer$pt_BR extends Translations$settings$viewer$en {
  _Translations$settings$viewer$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Visualizador';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Quantidade de pré-carregamento';
  @override
  String get preloadSizeLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Limite de tamanho do pré-carregamento';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'em GB, 0 para sem limite';
  @override
  String get preloadHeightLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Limite de altura do pré-carregamento';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'em pixels, 0 para sem limite';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Qualidade da imagem';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Direção de rolagem do visualizador';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Posição da barra de ferramentas do visualizador';
  @override
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Posição do botão de zoom';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Posição dos botões de mudar de página';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
      'Ocultar barra de ferramentas ao abrir o visualizador';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Expandir detalhes por padrão';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Ocultar notas de tradução por padrão';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Ativar rotação';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Toque duas vezes para redefinir';
  @override
  String get toolbarButtonsOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Ordem dos botões da barra de ferramentas';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Ordem dos botões';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
      'Pressione e segure para mudar a ordem dos itens.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Pelo menos 4 botões desta lista estarão sempre visíveis na barra de ferramentas.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Os demais botões irão para o menu de três pontos (overflow).';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Pressione e segure para mover itens';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Somente para vídeos';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Esse botão não pode ser desativado';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Ação padrão de compartilhamento';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Ações de compartilhamento';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Perguntar – sempre pergunta o que compartilhar';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL do post';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- URL do arquivo – compartilha o link direto para o arquivo original (pode não funcionar em alguns sites)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- URL do post/URL do arquivo/Arquivo com tags — compartilha a URL ou o arquivo e as tags selecionadas';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Arquivo – compartilha o próprio arquivo. Pode levar algum tempo para carregar; o progresso será exibido no botão Compartilhar';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
      '- Hydrus – envia a URL do post para o Hydrus para importação';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Nota]: Se o arquivo estiver salvo no cache, ele será carregado de lá. Caso contrário, será carregado novamente da rede.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '​[Dica]: Toque e segure o botão de Compartilhar para abrir o menu de ações.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Usar botões de volume para rolar';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Rolagem com botões de volume';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Usar botões de volume para rolar pelas prévias e pelo visualizador';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Diminuir volume – próximo item';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Aumentar volume – item anterior';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'No visualizador:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
      ' - Barra de ferramentas visível – controla o volume';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Barra de ferramentas oculta – controla a rolagem';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Velocidade de rolagem dos botões de volume';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Duração da apresentação de slides (em ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Apresentação de slides';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '​[Em desenvolvimento] Vídeos/GIFs: apenas rolagem manual';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Manter a tela ligada';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Animação de abertura e fechamento do visualizador';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Animação de transição de página do visualizador';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Usando animação padrão';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Usando animação personalizada';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF de carregamento da Kanna';
  @override
  late final _Translations$settings$viewer$imageQualityValues$pt_BR imageQualityValues = _Translations$settings$viewer$imageQualityValues$pt_BR._(
    _root,
  );
  @override
  late final _Translations$settings$viewer$scrollDirectionValues$pt_BR scrollDirectionValues =
      _Translations$settings$viewer$scrollDirectionValues$pt_BR._(_root);
  @override
  late final _Translations$settings$viewer$toolbarPositionValues$pt_BR toolbarPositionValues =
      _Translations$settings$viewer$toolbarPositionValues$pt_BR._(_root);
  @override
  late final _Translations$settings$viewer$buttonPositionValues$pt_BR buttonPositionValues =
      _Translations$settings$viewer$buttonPositionValues$pt_BR._(_root);
  @override
  late final _Translations$settings$viewer$shareActionValues$pt_BR shareActionValues = _Translations$settings$viewer$shareActionValues$pt_BR._(_root);
}

// Path: settings.video
class _Translations$settings$video$pt_BR extends Translations$settings$video$en {
  _Translations$settings$video$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Vídeo';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Desativar vídeos';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Útil em dispositivos fracos que travam ao tentar carregar vídeos. Oferece opções para assistir em um reprodutor externo ou no navegador.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Reproduzir vídeos automaticamente';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Iniciar vídeos sem som';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimental]';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Backend do player de vídeo';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Padrão';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Baseado no ExoPlayer. Oferece a melhor compatibilidade com dispositivos, mas pode apresentar problemas com vídeos em 4K, alguns codecs ou aparelhos antigos';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Baseado no libmpv, possui configurações avançadas que podem ajudar a corrigir problemas com alguns codecs/dispositivos\n[PODE CAUSAR TRAVAMENTOS]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Baseado no libmdk, pode oferecer um desempenho melhor em alguns codecs/dispositivos\n[PODE CAUSAR TRAVAMENTOS]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Altere as configurações do \'MPV\' abaixo caso os vídeos apresentem erros de codec ou não funcionem corretamente:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: usar aceleração de hardware';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Modo de cache de vídeo';
  @override
  late final _Translations$settings$video$cacheModes$pt_BR cacheModes = _Translations$settings$video$cacheModes$pt_BR._(_root);
  @override
  late final _Translations$settings$video$cacheModeValues$pt_BR cacheModeValues = _Translations$settings$video$cacheModeValues$pt_BR._(_root);
  @override
  late final _Translations$settings$video$videoBackendModeValues$pt_BR videoBackendModeValues =
      _Translations$settings$video$videoBackendModeValues$pt_BR._(_root);
}

// Path: settings.downloads
class _Translations$settings$downloads$pt_BR extends Translations$settings$downloads$en {
  _Translations$settings$downloads$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'A partir do próximo item da fila';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Por favor, conceda permissão de armazenamento para poder baixar arquivos';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nenhum item selecionado';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nenhum item na fila';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Lote';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Baixar selecionados';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
      'Remover status de baixado dos selecionados';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favoritar selecionados';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Desfavoritar selecionados';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Limpar selecionados';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Atualizando dados…';
}

// Path: settings.database
class _Translations$settings$database$pt_BR extends Translations$settings$database$en {
  _Translations$settings$database$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Banco de dados';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexando banco de dados';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Excluindo índices';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Ativar banco de dados';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Ativar indexação';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Ativar histórico de pesquisa';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Ativar busca de tipos de tags';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Tipo de Sankaku para atualiza';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Termo de pesquisa';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opcional, pode deixar o processo mais lento)';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Não é possível sair da página agora!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Os dados do Sankaku estão sendo atualizados. Aguarde a conclusão ou cancele manualmente no final da página.';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Por favor, aguarde!';
  @override
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Os índices estão sendo alterados';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Armazena favoritos e rastreia itens baixados';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Itens já baixados não serão baixados novamente';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Acelera as pesquisas no banco de dados, mas usa mais espaço em disco (até 2x).\n\nNão saia da página nem feche o aplicativo durante a indexação.';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Criar índices [Debug]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Remover índices [Debug]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Requer que o banco de dados esteja ativado.';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Salva as últimas ${limit} pesquisas';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Toque no item para ver ações (Excluir, Favoritar…)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Pesquisas favoritadas são fixadas no topo da lista e não contam para o limite';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Busca os tipos de tags de boorus suportados';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Pode causar limitação de requisições';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Excluir banco de dados';
  @override
  String get deleteDatabaseConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Excluir o banco de dados?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Banco de dados excluído!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'É necessário reiniciar o aplicativo!';
  @override
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Limpar itens baixados';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Limpar todos os itens baixados?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Itens baixados removidos';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Pode ser necessário reiniciar o app!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Limpar itens favoritados';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Limpar todos os itens favoritados?';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoritos limpos';
  @override
  String get clearSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Limpar histórico de pesquisa';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Limpar histórico de pesquisa?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Histórico de pesquisa limpo';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Atualização de favoritos do Sankaku';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
      'Atualização de favoritos do Sankaku iniciada';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Novos URLs de imagem serão buscados para os itens do Sankaku nos seus favoritos';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Não saia desta página até que o processo seja concluído ou interrompido';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Nenhuma configuração do Sankaku encontrada!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Atualização dos favoritos do Sankaku concluída!';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Limpeza de itens com falha iniciada';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Itens que falharem ao atualizar serão removidos do banco de dados';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Atualizar URLs do Sankaku';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Atualizando ${count} itens:';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Restantes: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Concluídos: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Falhas/Pulados: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Pare e tente novamente mais tarde se notar o número de \'Falhas\' crescer constantemente; você pode ter atingido o limite de requisições (rate limit) e/ou o Sankaku está bloqueando o seu IP.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Toque aqui para pular o item atual';
  @override
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Use se o item parecer travado';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Toque aqui para parar';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Limpar itens com falha (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
      'Tentar novamente itens com falha (${count})';
}

// Path: settings.backupAndRestore
class _Translations$settings$backupAndRestore$pt_BR extends Translations$settings$backupAndRestore$en {
  _Translations$settings$backupAndRestore$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup e Restauração';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Arquivo duplicado detectado!';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'O arquivo ${fileName} já existe. Deseja substituí-lo? Se escolher "Não", o backup será cancelado.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Este recurso está disponível apenas no Android. Nas versões de desktop, você pode simplesmente copiar e colar os arquivos de/para a pasta de dados do app correspondente ao seu sistema.';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Selecionar pasta de backup';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Falha ao obter o caminho do backup';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Caminho de backup é: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Nenhum diretório de backup selecionado';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Os arquivos devem estar na raiz do diretório';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Configurações de backup';
  @override
  String get restoreSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restaurar configurações';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Backup das configurações salvo em settings.json';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Configurações restauradas do backup';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Falha ao fazer backup das configurações';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Falha ao restaurar as configurações';
  @override
  String get resetBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Redefinir diretório de backup';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Fazer backup dos Boorus';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restaurar Boorus';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Backup dos boorus salvo em boorus.json';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restauradas do backup';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Falha ao fazer backup dos Boorus';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Falha ao restaurar os Boorus';
  @override
  String get backupDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Fazer backup do banco de dados';
  @override
  String get restoreDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restaurar banco de dados';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Pode levar algum tempo dependendo do tamanho do banco de dados; o app será reiniciado após a conclusão';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Backup do banco de dados salvo em store.db';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Banco de dados restaurado do backup! O app será reiniciado em alguns segundos!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Falha ao fazer backup do banco de dados';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Falha ao restaurar o banco de dados';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'Arquivo do banco de dados não encontrado ou não pôde ser lido!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Fazer backup das tags';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restaurar tags';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Pode demorar um pouco se você tiver muitas tags. Se você restaurou o banco de dados, não precisa fazer isso porque elas já estão incluídas no banco de dados';
  @override
  String get tagsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Backup das tags salvo em tags.json';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restauradas do backup';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Falha ao fazer backup das tags';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Falha ao restaurar as tags';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
      'Arquivo de tags não encontrado ou não pode ser lido!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Toque em Ocultar abaixo se demorar muito; a operação continuará em segundo plano';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
      'Arquivo de backup não encontrado ou não pôde ser lido!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Sem acesso ao diretório de backup!';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelado';
}

// Path: settings.network
class _Translations$settings$network$pt_BR extends Translations$settings$network$en {
  _Translations$settings$network$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Rede';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Ativar certificados SSL autoassinados';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Não se aplica ao modo de streaming de vídeo; use o modo de cache de vídeo em vez disso';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'User-Agent personalizado';
  @override
  String get customUserAgentTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'User-Agent personalizado';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Deixe em branco para usar o valor padrão';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Padrão: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
      'Usado na maioria das requisições de Booru e WebView';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Salvo ao sair da página';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Toque aqui para usar o User-Agent do navegador Chrome (recomendado apenas se o site bloquear user-agents que não sejam de navegadores)';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Limpador de cookies';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Selecione um booru para limpar os cookies ou deixe em branco para limpar todos';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies do ${booruName}:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '«${cookieName}» cookie apagado';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Limpar cookies';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Limpar cookies do ${booruName}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Cookies do ${booruName} foram limpos';
  @override
  String get allCookiesDeleted =>
      TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Todos os cookies foram limpos';
}

// Path: settings.privacy
class _Translations$settings$privacy$pt_BR extends Translations$settings$privacy$en {
  _Translations$settings$privacy$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacidade';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Proteger app';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Proteger app manualmente ou depois de um tempo inativo. Requer PIN ou biometria';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Bloquear automaticamente após';
  @override
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'em segundos, 0 para desativar';
  @override
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Desfocar a tela ao sair do app';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Pode não funcionar em alguns dispositivos devido a limitações do sistema';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Teclado anônimo';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Impede que o teclado salve o histórico de digitação.\nAplicado à maioria dos campos de texto';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome de exibição do aplicativo';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? 'Mude como o nome do app aparece nos seus apps';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Nome do app alterado';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'A alteração do nome do app entrará em vigor após reiniciar o aplicativo. Alguns launchers podem precisar de um tempo adicional ou da reinicialização do sistema para atualizar.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
      'Falha ao alterar o nome do app. Por favor, tente novamente.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Reiniciar agora';
}

// Path: settings.performance
class _Translations$settings$performance$pt_BR extends Translations$settings$performance$en {
  _Translations$settings$performance$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance';
  @override
  String get lowPerformanceMode =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Modo de baixo desempenho';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Recomendado para dispositivos antigos e com pouca RAM';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Modo de baixo desempenho';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Desativa informações detalhadas do progresso de carregamento';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Desativa elementos pesados (desfoques, opacidade animada, algumas animações…)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Define configurações otimizadas para estas opções (você poderá alterá-las separadamente mais tarde):';
  @override
  String get autoplayVideos =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Reprodução automática de vídeos';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Desativar vídeos';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Útil em dispositivos de baixo desempenho que travam ao tentar carregar vídeos. Oferece opções para assistir ao vídeo em um player externo ou no navegador.';
}

// Path: settings.cache
class _Translations$settings$cache$pt_BR extends Translations$settings$cache$en {
  _Translations$settings$cache$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download e cache';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Qualidade do download';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Intervalo de download (em ms)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Por favor, insira um valor de tempo limite válido';
  @override
  String get biggerThan10 =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Por favor, insira um valor maior que 10ms';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Exibir notificações de download';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Baixar itens ao favoritar';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Favoritar itens ao baixar';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Salvar metadados em arquivo JSON ao baixar';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Requer diretório personalizado';
  @override
  String get setStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Definir diretório de armazenamento';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Atual: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Redefinir diretório de armazenamento';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Cache de prévias';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Cache de mídia';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Modo de cache de vídeo';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Modos de cache de vídeo';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      'Streaming — Não armazena em cache, começa a reproduzir o mais rápido possível';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Cache — Salva o arquivo no armazenamento do dispositivo e só reproduz quando o download estiver concluído';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      'Streaming + Cache — Mistura dos dois, mas no momento resulta em download duplo';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Nota]: Os vídeos só serão salvos em cache se "Cache de mídia" estiver ativado.';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Aviso]: No desktop, o modo Streaming pode não funcionar corretamente em alguns Boorus.';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Limpar cache após:';
  @override
  String get neverDeleteDuration => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nunca';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Limite de tamanho do cache (em GB)';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Tamanho máximo total do cache';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Estatus do cache:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Carregando…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Vazio';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} arquivos';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 arquivo';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Total';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Miniaturas';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Amostras';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Mídia';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache limpo';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cache de ${type} limpo';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Limpar todo o cache';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cache totalmente limpo';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Pode ser necessário reiniciar o app!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Erro!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Não disponível para esta plataforma no momento';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$pt_BR extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtros';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Escondido';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Marcado';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filtro duplicado';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' já está na lista de \'${type}\'';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nenhum filtro encontrado';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nenhum filtro adicionado';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
      'Ocultar completamente itens que correspondem aos filtros Ocultos';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
      'Ocultar completamente itens que correspondem aos filtros marcados';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Remover itens favoritados';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Remover itens baixados';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Remover itens gerados por IA';
}

// Path: settings.sync
class _Translations$settings$sync$pt_BR extends Translations$settings$sync$en {
  _Translations$settings$sync$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sincronizar';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'O banco de dados precisa estar ativado para usar a Sincronização';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Erro!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Por favor, insira o endereço IP e a porta.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Selecione o que deseja fazer';
  @override
  String get sendDataToDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'ENVIAR dados PARA outro dispositivo';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RECEBER dados DE outro dispositivo';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Inicie o servidor no outro dispositivo, insira o IP/porta e toque em Iniciar sincronização';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'Endereço IP';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Endereço IP do servidor (ex.: 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Porta';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Porta do servidor (ex.: 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Enviar favoritos';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoritos: ${count}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Enviar favoritos (legado)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sincronizar favoritos a partir de #…';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Permite definir a partir de onde a sincronização deve começar; útil se você já sincronizou todos os seus favoritos anteriormente e quer sincronizar apenas os itens mais recentes';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'Se desejar sincronizar desde o início, deixe este campo em branco';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Exemplo: você tem uma quantidade X de favoritos; ao definir este campo como 100, a sincronização começará a partir do item nº 100 e continuará até atingir X';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
      'Ordem dos baixados: Do mais antigo (0) ao mais recente (X)';
  @override
  String get sendSnatchedHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Enviar histórico de downloads';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Baixados: ${count}';
  @override
  String get syncSnatchedFrom =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sincronizar baixados a partir de #…';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Permite definir a partir de onde a sincronização deve começar; útil se você já sincronizou todo o seu histórico de downloads anteriormente e quer sincronizar apenas os itens mais recentes';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'Se quiser sincronizar do início, deixe este campo em branco';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Exemplo: você tem uma quantidade X de baixados; ao definir este campo como 100, a sincronização começará a partir do item nº 100 e continuará até atingir X';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
      'Ordem dos baixados: Do mais antigo (0) ao mais recente (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Enviar configurações';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Enviar configurações do booru';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configurações: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Enviar abas';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Abas: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Modo de sincronização de abas';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Mesclar: Mesclar as abas deste dispositivo no outro dispositivo; abas com boorus desconhecidos e abas já existentes serão ignoradas';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Substituir: Substituir completamente as abas no outro dispositivo pelas abas deste dispositivo';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Mesclar';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Substituir';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Enviar tags';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Modo de sincronização de tags';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Preservar tipo: Se a tag existir com um tipo de tag no outro dispositivo e não neste, ela será ignorada';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Sobrescrever: Todas as tags serão adicionadas; se uma tag e o tipo de tag existirem no outro dispositivo, serão sobrescritos';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preservar tipo';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Sobescrever';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testar conexão';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ??
      'Envia uma solicitação de teste para outro dispositivo.';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Exibe uma notificação em caso de sucesso ou falha.';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Iniciar sincronização';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Os campos Porta e IP não podem ficar vazios!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Você não selecionou nada para sincronizar!';
  @override
  String get statsOfThisDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Estatísticas deste dispositivo:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Inicie o servidor para receber dados. Evite Wi-Fi público por segurança';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Interfaces de rede disponíveis';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP da interface selecionada: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Porta do servidor';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(o padrão será \'8080\' se estiver vazio)';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Iniciar servidor receptor';
}

// Path: settings.about
class _Translations$settings$about$pt_BR extends Translations$settings$about$en {
  _Translations$settings$about$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Sobre';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher é de código aberto e licenciado com GPLv3. O código-fonte está disponível no GitHub. Por favor, reporte qualquer problema ou pedido de funcionalidade na seção "issues" no repositório.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher no Github';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contato';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-mail copiado!';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Agradecimentos especiais ao Showers-U por nos permitir usar sua arte no logo do aplicativo. Confira o trabalho deles no Pixiv';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Desenvolvedores';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Tradutores';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Lançamentos';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'A versão mais recente e o histórico completo de alterações podem ser encontrados na página de Releases do GitHub:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licensas';
}

// Path: settings.checkForUpdates
class _Translations$settings$checkForUpdates$pt_BR extends Translations$settings$checkForUpdates$en {
  _Translations$settings$checkForUpdates$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Verificar se há atualizações';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Atualização disponível!';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Novidades';
  @override
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Notas da atualização';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Erro ao verificar atualizações!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Você já possui a versão mais recente';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Ver registro de alterações';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Versão atual';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Registro de alterações';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Ver na Play Store';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Ver lançamentos';
}

// Path: settings.logs
class _Translations$settings$logs$pt_BR extends Translations$settings$logs$en {
  _Translations$settings$logs$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Logs';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Compartilhar logs';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Compartilhar logs com um aplicativo externo?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      'VISO]: Os logs podem conter informações sensíveis, compartilhe com cuidado!';
}

// Path: settings.help
class _Translations$settings$help$pt_BR extends Translations$settings$help$en {
  _Translations$settings$help$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Ajuda';
}

// Path: settings.debug
class _Translations$settings$debug$pt_BR extends Translations$settings$debug$en {
  _Translations$settings$debug$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Depuração';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Modo de depuração ativado!';
  @override
  String get disabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Modo de depuração desativado!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'O modo de depuração já está ativado!';
  @override
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Exibir gráfico de desempenho';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Exibir gráfico de FPS';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Exibir estatísticas da imagem';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Exibir estatísticas do vídeo';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Desfocar imagens + silenciar vídeos [Apenas DEV]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Ativar rolagem por arraste em listas [Apenas Desktop]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Velocidade das animações (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Gerenciador de tags';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Res.: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Proporção de pixels: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Registrador de logs';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Limpar todos os cookies';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Limpar armazenamento seguro';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Obter string da sessão';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Definir string de sessão';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'String da sessão';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sessão restaurada a partir da string';
}

// Path: settings.logging
class _Translations$settings$logging$pt_BR extends Translations$settings$logging$en {
  _Translations$settings$logging$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Registrador de logs';
  @override
  String get captureLogcat => TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Capturar logcat do Android';
  @override
  String get captureLogcatDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
      'Gravar mensagens de aviso e erro do processo Android deste aplicativo';
}

// Path: settings.webview
class _Translations$settings$webview$pt_BR extends Translations$settings$webview$en {
  _Translations$settings$webview$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Abrir o webview';
  @override
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'para fazer login ou obter cookies';
}

// Path: settings.dirPicker
class _Translations$settings$dirPicker$pt_BR extends Translations$settings$dirPicker$en {
  _Translations$settings$dirPicker$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Nome do diretório';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Selecionar um diretório';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? 'Deseja fechar o seletor sem escolher um diretório?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Não';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Sim';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Erro!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Falha ao criar o diretório';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'O diretório não possui permissão de escrita!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Nova pasta';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Criar';
}

// Path: viewer.tutorial
class _Translations$viewer$tutorial$pt_BR extends Translations$viewer$tutorial$en {
  _Translations$viewer$tutorial$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Imagens';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Toque/Toque longo: alternar modo imersivo';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Toque duplo: ajustar à tela / tamanho original / redefinir zoom';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$pt_BR extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Não é possível iniciar a apresentação de slides';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Você chegou ao último item carregado';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pausar';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Começar';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Desfavoritar';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deselecionar';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Recarregar com escala';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Carregar qualidade de amostra';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Carregar em alta qualidade';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Remover status de baixado';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Definir status de baixado';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Baixar';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forçado)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Enviar para o Hydrus';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Qual URL você deseja enviar para o Hydrus?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL do post';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL do arquivo';
  @override
  String get hydrusNotConfigured =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'O Hydrus não está configurado!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Compartilhar arquivo';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Este arquivo já está sendo baixado para compartilhamento. Deseja cancelar?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Já existe um arquivo sendo baixado para compartilhamento. Deseja cancelar o atual e compartilhar o novo?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Atual:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Novo:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Compartilhar novo';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abortar';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Erro!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Ocorreu um erro ao salvar o arquivo antes de compartilhar';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'O que você deseja compartilhar?';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL do post com tags';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL do arquivo com tags';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Arquivo';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Arquivo com tags';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Selecionar tags';
}

// Path: viewer.notes
class _Translations$viewer$notes$pt_BR extends Translations$viewer$notes$en {
  _Translations$viewer$notes$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Nota';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notas';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _Translations$media$loading$pt_BR extends Translations$media$loading$en {
  _Translations$media$loading$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Renderizando…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Carregando e renderizando do cache…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Carregando do cache…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Carregando buffer…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Carregando…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Carregar mesmo assim';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Reiniciar carregamento';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Parar carregamento';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Começou há ${seconds}s';
  @override
  late final _Translations$media$loading$stopReasons$pt_BR stopReasons = _Translations$media$loading$stopReasons$pt_BR._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Arquivo tem 0 bytes';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Tamanho do arquivo: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limite: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Problemas frequentes de reprodução? Tente alterar [Configurações > Vídeo > Backend do player de vídeo]';
}

// Path: media.video
class _Translations$media$video$pt_BR extends Translations$media$video$en {
  _Translations$media$video$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Vídeos desativados ou sem suporte';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Abrir vídeo no player externo';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Abrir vídeo no navegador';
  @override
  String get failedToLoadItemData =>
      TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Falha ao carregar dados do item';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Carregando dados do item...';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Tentar novamente';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Abrir arquivo no navegador';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Abrir post no navegador';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Verificando no momento:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Formato de arquivo desconhecido (.${fileExt}), toque aqui para abrir no navegador';
}

// Path: preview.error
class _Translations$preview$error$pt_BR extends Translations$preview$error$en {
  _Translations$preview$error$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nenhum resultado';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Altere o termo de busca ou toque para tentar novamente';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Você chegou ao fim';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Páginas carregadas: ${pageNum}\nToque aqui para recarregar a última página';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Carregando página #${pageNum}…';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        seconds,
        one: 'Iniciado há ${seconds} segundo',
        few: 'Iniciado há ${seconds} segundos',
        many: 'Iniciado há ${seconds} segundos',
        other: 'Iniciado há ${seconds} segundos',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'Toque para tentar novamente se a requisição parecer travada ou estiver demorando muito';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Erro ao carregar a página #${pageNum}';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Toque aqui para tentar novamente';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Erro, nenhum resultado carregado';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Toque aqui para tentar novamente';
}

// Path: settings.interface.previewQualityValues
class _Translations$settings$interface$previewQualityValues$pt_BR extends Translations$settings$interface$previewQualityValues$en {
  _Translations$settings$interface$previewQualityValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Miniatura';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Amostra';
}

// Path: settings.interface.previewDisplayModeValues
class _Translations$settings$interface$previewDisplayModeValues$pt_BR extends Translations$settings$interface$previewDisplayModeValues$en {
  _Translations$settings$interface$previewDisplayModeValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrado';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Retângulo';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Mosaico';
}

// Path: settings.interface.appModeValues
class _Translations$settings$interface$appModeValues$pt_BR extends Translations$settings$interface$appModeValues$en {
  _Translations$settings$interface$appModeValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile';
}

// Path: settings.interface.handSideValues
class _Translations$settings$interface$handSideValues$pt_BR extends Translations$settings$interface$handSideValues$en {
  _Translations$settings$interface$handSideValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Esquerda';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Direita';
}

// Path: settings.viewer.imageQualityValues
class _Translations$settings$viewer$imageQualityValues$pt_BR extends Translations$settings$viewer$imageQualityValues$en {
  _Translations$settings$viewer$imageQualityValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Amostra';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original';
}

// Path: settings.viewer.scrollDirectionValues
class _Translations$settings$viewer$scrollDirectionValues$pt_BR extends Translations$settings$viewer$scrollDirectionValues$en {
  _Translations$settings$viewer$scrollDirectionValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertical';
}

// Path: settings.viewer.toolbarPositionValues
class _Translations$settings$viewer$toolbarPositionValues$pt_BR extends Translations$settings$viewer$toolbarPositionValues$en {
  _Translations$settings$viewer$toolbarPositionValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Superior';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Inferior';
}

// Path: settings.viewer.buttonPositionValues
class _Translations$settings$viewer$buttonPositionValues$pt_BR extends Translations$settings$viewer$buttonPositionValues$en {
  _Translations$settings$viewer$buttonPositionValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Desativado';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Esquerda';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Direita';
}

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$pt_BR extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Perguntar';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL do post';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL do post com tags';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL do arquivo';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL do ficheiro com tags';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Arquivo';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Arquivo com tags';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _Translations$settings$video$cacheModes$pt_BR extends Translations$settings$video$cacheModes$en {
  _Translations$settings$video$cacheModes$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Modos de cache de vídeo';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      'Streaming — Não armazena em cache, começa a reproduzir o mais rápido possível';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      'Cache — Salva no armazenamento, reproduz apenas após concluir o download';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      'Streaming + Cache — Mistura dos dois, mas no momento resulta em download duplo';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Nota]: Os vídeos só serão salvos em cache se "Cache de mídia" estiver ativado.';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[AVISO]: No desktop, o modo Stream pode funcionar incorretamente para alguns Boorus';
}

// Path: settings.video.cacheModeValues
class _Translations$settings$video$cacheModeValues$pt_BR extends Translations$settings$video$cacheModeValues$en {
  _Translations$settings$video$cacheModeValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Streaming';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache';
}

// Path: settings.video.videoBackendModeValues
class _Translations$settings$video$videoBackendModeValues$pt_BR extends Translations$settings$video$videoBackendModeValues$en {
  _Translations$settings$video$videoBackendModeValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Padrão';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _Translations$media$loading$stopReasons$pt_BR extends Translations$media$loading$stopReasons$en {
  _Translations$media$loading$stopReasons$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Interrompido pelo usuário';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Erro ao carregar';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'O arquivo é muito grande';
  @override
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Oculto por filtros:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Erro de vídeo';
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
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Erro',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Erro!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Sucesso',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Sucesso!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancelar',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Voltar',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Depois',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Fechar',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sim',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Não',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Por favor, aguarde…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostrar',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ocultar',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Habilitar',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Desabilitar',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Adicionar',
          'exclude' => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Excluir',
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
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads',
          'secondsShort' => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's',
          'minutesShort' => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm',
          'hoursShort' => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h',
          'daysShort' => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'd',
          'leaveThisPageQuestion' => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Sair desta página?',
          'pageWillCloseAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Esta página será fechada automaticamente',
          'stay' => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Ficar',
          'leaveNow' => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Sair agora',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, insira um valor',
          'validationErrors.invalid' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, insira um valor válido',
          'validationErrors.invalidNumber' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Por favor, insira um número',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Por favor, insira um valor numérico válido',
          'validationErrors.tooSmall' => ({
            required double min,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Por favor, insira um valor maior que ${min}',
          'validationErrors.tooBig' => ({
            required double max,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Por favor, insira um valor menor que ${max}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Por favor, insira um valor entre ${min} e ${max}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
                'Por favor, insira um valor maior ou igual a 0',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Por favor, insira um valor menor do que 4',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Por favor, insira um valor maior do que 100',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Usar mais de 4 colunas pode afetar o desempenho do app',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Usar mais de 8 colunas pode afetar o desempenho do app',
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
          'permissions.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Caminho atual: ${path}',
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
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloqueio temporário',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Ocorreu um erro durante a autenticação: ${error}',
          'searchHandler.removedLastTab' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'A última aba foi removida',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Redefinindo para as tags padrão',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Classificações alteradas',
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
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Histórico de downloads',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserir tags',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantidade',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Quantidade de arquivos para baixar',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Tempo de espera (em ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Tempo de espera entre cada download',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Arquivos baixados',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'O item já foi baixado anteriormente',
          'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Falha ao baixar o item',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'O item foi cancelado',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Começando próximo item da fila…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Item baixado',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Baixado: ${count} item',
                  few: 'Baixados: ${count} itens',
                  many: 'Baixados: ${count} itens',
                  other: 'Baixados: ${count} itens',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '${count} arquivo já foi baixado',
                  few: '${count} arquivos já foram baixados',
                  many: '${count} arquivos já foram baixados',
                  other: '${count} arquivos já foram baixados',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Falha ao baixar ${count} arquivo',
                  few: 'Falha ao baixar ${count} arquivos',
                  many: 'Falha ao baixar ${count} arquivos',
                  other: 'Falha ao baixar ${count} arquivos',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '${count} arquivo cancelado',
                  few: '${count} arquivos cancelados',
                  many: '${count} arquivos cancelados',
                  other: '${count} arquivos cancelados',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Baixando imagens',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Não feche o app!',
          'snatcher.addedItemToQueue' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Item adicionado à fila de download',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '${count} item adicionado a fila de download',
                  few: '${count} itens adicionados a fila de download',
                  many: '${count} itens adicionados a fila de download',
                  other: '${count} itens adicionados a fila de download',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Modo Multibooru',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Requer ao menos 2 boorus configurados',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Selecione boorus adicionais:',
          'multibooru.akaMultibooruMode' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'Ou seja, modo Multibooru',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Boorus adicionais para incluir',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Erro ao importar para o Hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Talvez as permissões da API não estejam corretas. Você pode editá-las em \'Revisar Serviços\'',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Adicionar tags ao arquivo',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Adicionar URLs',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Aba',
          'tabs.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Adicionar boorus nas configurações',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Selecione um Booru',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Boorus secundários',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Nova aba',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Selecione um booru ou deixe vazio',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Posição',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Aba anterior',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Próximo aba',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Fim da lista',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Busca utilizada',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Padrão',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Atual',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Personalizada',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Busca personalizada',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[vazia]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Adicionar boorus secundários',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Manter boorus secundários',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Página inicial personalizada',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Mudar para uma nova aba',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'adicionar',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Gerenciador de abas',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Modo de seleção',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Ordenar abas',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Ajuda',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Apagar abas',
          'tabs.deleteDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Excluir abas duplicadas',
          'tabs.deleteDuplicateTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
                'Abas duplicadas encontradas. Selecione as abas que deseja manter em cada grupo:',
          'tabs.keepFirstDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Manter a primeira',
          'tabs.keepLastDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Manter a última',
          'tabs.skipDuplicateTabDelete' => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Pular',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Embaralhar abas',
          'tabs.tabRandomlyShuffled' =>
            TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Abas embaralhadas aleatoriamente',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Ordem das abas salva',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Rolar para a aba atual',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Rolar para o topo',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Rolar para o fim',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtrar por booru, estado, duplicadas...',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Rolagem:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Ordenação:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Ordem padrão das abas',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Ordem alfabetica',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Ordem alfabética (inversa)"',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Ordem alfabética por booru',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Ordem alfabética por booru (inversa)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Segure o botão de ordenação para salvar a ordem atual',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Selecionar:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Alternar modo de seleção',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'No fim da pagina:',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Selecionar/desmarcar todas as abas',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Apagar abas selecionadas',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Segure uma aba para movê-la',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Números no canto inferior direito da aba:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Primeiro número — índice da aba na ordem padrão da lista',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Second number - tab index in current list order, appears when filtering/sorting is active',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtros especiais:',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '​«Carregadas» — mostrar abas que possuem itens carregados',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '​«Não carregadas» — mostrar abas que não estão carregadas e/ou possuem zero itens',
          'tabs.notLoadedItalic' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Abas não carregadas possuem texto em itálico',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nenhuma aba encontrada',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copiar',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Mover',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Remover',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Embaralhar',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Ordenar',
          'tabs.shuffleTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Embaralhar a ordem das abas aleatoriamente?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Salvar abas na ordem de classificação atual?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Por Booru',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabeticamente',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertida)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Você tem certeza de que quer deletar ${count} aba?',
                  few: 'Você tem certeza de que quer deletar ${count} abas?',
                  many: 'Você tem certeza de que quer deletar ${count} abas?',
                  other: 'Você tem certeza de que quer deletar ${count} abas?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Carregada',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tipo de tag',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicadas',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Verificar duplicadas no mesmo Booru',
          'tabs.filters.emptySearchQuery' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Consulta de busca vazia',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtros de abas',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Todas',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Não caregada',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Ativado',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Desativado',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Também ativará a ordenação',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Filtrar abas que contêm ao menos uma tag do tipo selecionado',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Qualquer',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Aplicar',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Mover para o início',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Mover para o fim',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Número da tab',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Número da aba inválido.',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Entrada inválida',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Fora do intervalo',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Por favor, digite um número de aba válido',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ??
                'Mover para #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Prévia:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Search history',
          'history.searchHistoryIsEmpty' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'O histórico de busca está vazio',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Histórico de busca desativado',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                'Ative o banco de dados nas configurações para o histórico de busca',
          'history.lastSearch' => ({
            required String search,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Última busca: ${search}',
          'history.lastSearchWithDate' => ({
            required String date,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Última busca em: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Tipo de Booru desconhecido!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ??
                'Booru desconhecido (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Abrir',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Abrir em uma nova aba',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remover dos favoritos',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Definir como Favorito',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copiar',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Deletar',
          'history.deleteHistoryEntries' =>
            TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Excluir itens do histórico',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Tem certeza de que deseja excluir ${count} item?',
                  few: 'Tem certeza de que deseja excluir ${count} itens?',
                  many: 'Tem certeza de que deseja excluir ${count} itens?',
                  other: 'Tem certeza de que deseja excluir ${count} itens?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Limpar seleção',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Excluir ${count} item',
                  few: 'Excluir ${count} itens',
                  many: 'Excluir ${count} itens',
                  other: 'Excluir ${count} itens',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Não supordado nesse dispositivo',
          'webview.captcha' => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha',
          'webview.captchaCheckDescription' =>
            TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
                'Possível CAPTCHA detectado! Por favor, resolva-o e retorne após concluir)',
          'webview.captchaCompleted' => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha completado',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Digite uma URL',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Digite uma URL personalizada',
          'webview.navigation.navigateTo' => ({
            required String url,
          }) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navegar para ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Listar cookies',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Limpar cookies',
          'webview.navigation.cookiesGone' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Cookies limpos',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Obter favicon',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Nenhum favicon encontrado',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(o texto acima é selecionável)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copiar URL',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL copiado para a area de transferência',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Histórico',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nenhum item no histórico para voltar',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nenhum item no histórico para avançar',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Configurações',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Idioma',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistema',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Nos ajude a traduzir',
          'settings.language.visitForDetails' => TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ?? 'Visite o <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> para detalhes ou toque na imagem abaixo para ir para o POEditor',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Pesquisa',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Tags padrão',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Itens por página',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Alguns boorus podem ignorar isso',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Adicionar configuração de Booru',
          'settings.booru.shareBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Compartilhar configuração do Booru',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Compartilhar configuração de ${booruName} como link.\n\nIncluir chave de login/API?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Copiar o link de configuração de ${booruName} para área de transferência.\n\nIncluir chave de login/API?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Compartilhamento de Booru',
          'settings.booru.booruSharingMsgAndroid' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ?? 'Como abrir automaticamente links de configuração do Booru no app no Android 12 ou superior:\n1) Toque no botão abaixo para abrir as configurações de links padrão do app no sistema\n2) Toque em «Adicionar link» e selecione todas as opções disponíveis',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus adicionados',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Editar configuração do Booru',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importar configuração de Booru da área de transferência',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Apenas URLs do loli.snatcher são suportadas',
          'settings.booru.deleteBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Apagar configuração de Booru',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Ocorreu um erro ao apagar a configuração do Booru!',
          'settings.booru.booruDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Configuração do Booru apagada',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                '​O Booru selecionado se torna o padrão após salvar.\n\n​O Booru padrão aparece primeiro nos menus suspensos',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Alterar Booru padrão?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Alterar para: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Clique em [Não] para manter o atual: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Clique em [Sim] para alterar para: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
                'Link de configuração do Booru copiado para a área de transferência',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nenhum Booru selecionado!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Não é possível apagar este Booru!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remova as abas relacionadas primeiro',
          'settings.booru.sourceLimitNotice' => TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ?? 'O comportamento de configuração de algumas fontes pode depender das configurações de compatibilidade abaixo. O conteúdo é hospedado e fornecido por sites externos e não é controlado pelo aplicativo',
          'settings.booru.advanced' => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Avançado',
          'settings.booru.expandedSourceCompatibility' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Compatibilidade de configuração de fontes',
          'settings.booru.expandedSourceCompatibilitySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
                'Ajusta como as configurações de compatibilidade de fontes são gerenciadas',
          'settings.booru.expandedSourceCompatibilityConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ?? 'Alterar isso pode afetar o funcionamento das fontes. O conteúdo é hospedado e fornecido por sites externos e não é controlado pelo aplicativo. Deseja continuar?',
          'settings.booru.sourceUnavailableCurrentSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Este site não está disponível',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'O teste do Booru falhou',
          'settings.booruEditor.testBooruFailedMsg' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? 'Os parâmetros de configuração podem estar incorretos, o Booru não permite acesso por API, a solicitação não retornou dados ou houve um erro de rede.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Salvar Booru',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Executando teste...',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Esta configuração de Booru ja existe',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Ja existe uma Configuração de Booru com o mesmo nome',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Já existe uma configuração de Booru com a mesma URL',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
                'Essa configuração de Booru não será adicionada',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Configuração de Booru salva',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'As abas existentes com este Booru precisam ser recarregadas para aplicar as alterações!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Falha ao verificar acesso API ao Hydrus',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Chave de acesso solicitada',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Toque em \'OK\' no Hydrus e depois em \'Aplicar\'. Em seguida, você pode tocar em \'Testar Booru\'',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Falha ao obter a chave de acesso',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
                'Você tem a janela de solicitação aberta no Hydrus?',
          'settings.booruEditor.hydrusInstructions' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ?? 'Para obter a chave Hydrus, você precisa abrir a caixa de diálogo de solicitação no cliente Hydrus: Serviços > Revisar serviços > API do cliente > Adicionar > Da solicitação de API',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Obter chave de API do Hydrus',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nome do Booru',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'O nome do Booru é obrigatório!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL do Booru',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'A URL do Booru é obrigatória!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tipo de Booru',
          'settings.booruEditor.booruFavicon' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL do Favicon',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Preenchido automaticamente se vazio)',
          'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Tags padrão',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Busca padrão para o booru',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Os campos abaixo podem ser obrigatórios para alguns boorus',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
                'Confirmar o salvamento desta configuração de Booru',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Tipo de Booru selecionado/detectado: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface',
          'settings.interface.appUIMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Modo de interface do usuário do app',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Modo de interface do usuário do app',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Usar o modo Desktop? Pode causar problemas em dispositivos móveis. [INTERFACE DESCONTINUADA]',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Interface dispositivos móveis',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Desktop - Estilo de UI do Ahoviewer [OBSOLETO, PRECISA DE REFORMULAÇÃO]\n',
          'settings.interface.appUIModeHelpWarning' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ?? '[Aviso]: Não defina o Modo de Interface para Desktop em um celular, pois isso pode danificar o aplicativo e você poderá ter que apagar todas as suas configurações, incluindo as configurações do Booru.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Mão dominante',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                'Ajusta a posição dos elementos da interface para o lado selecionado',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Mostrar barra de pesquisa na grade de pré-visualização',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Mover campo de entrada para o topo na tela de busca',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
                'Painel de ações rápidas da visualização de busca',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Foco automático no campo de busca',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Desativar vibração',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Ainda pode ocorrer em algumas ações, mesmo quando desativado',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gesto de voltar preditivo',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Colunas da prévia (retrato)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Colunas da prévia (paisagem)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Qualidade da pré-visualização',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
                'Altera a resolução das imagens na grade de prévias',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Amostra – Resolução média; o app também carregará uma miniatura temporária enquanto a qualidade mais alta é carregada',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Miniatura - Baixa resolução',
          'settings.interface.previewQualityHelpNote' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ?? '[Nota]: A qualidade da amostra pode prejudicar visivelmente o desempenho, especialmente se houver muitas colunas na grade de prévias',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Exibição da prévia',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Exibição alternativa da prévia',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Isso será usado quando a opção Mosaico não for possível',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Não redimensionar imagens',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Pode reduzir o desempenho',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Aviso',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Tem certeza de que deseja desativar o redimensionamento de imagens?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Isso pode afetar negativamente o desempenho, especialmente em dispositivos mais antigos',
          'settings.interface.gifThumbnails' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniaturas em GIF',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Requer «Não redimensionar imagens»',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ??
                'Posição dos botões de rolagem das prévias',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Modificador de rolagem da roda do mouse',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modificador de rolagem',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Miniatura',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Amostra',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrado',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Retângulo',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Mosaico',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Esquerda',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Direita',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Temas',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Modo do tema',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Fundo preto',
          'settings.theme.useDynamicColor' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Usar cores dinâmicas',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Apenas Android 12+',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Cor primária',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Cor secundária',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Ativar mascote do menu lateral',
          'settings.theme.setCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Definir mascote personalizado',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remover mascote personalizado',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Caminho do mascote atual',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistema',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Claro',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Escuro',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Rosa',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Roxo',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Azul',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Azul-claro',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Vermelho',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Verde',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Personalizado',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Selecionar cor',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Cor selecionada',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Cor selecionada e seus tons',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Fonte',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Padrão do sistema',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Ver mais fontes',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'A rápida raposa marrom salta sobre o cão preguiçoso',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Fonte personalizada',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Insira o nome de qualquer Google Font',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nome da fonte',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Navegue pelas fontes em fonts.google.com',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Fonte não encontrada',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Visualizador',
          'settings.viewer.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Quantidade de pré-carregamento',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Limite de tamanho do pré-carregamento',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'em GB, 0 para sem limite',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Limite de altura do pré-carregamento',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'em pixels, 0 para sem limite',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Qualidade da imagem',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Direção de rolagem do visualizador',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ??
                'Posição da barra de ferramentas do visualizador',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Posição do botão de zoom',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Posição dos botões de mudar de página',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Ocultar barra de ferramentas ao abrir o visualizador',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Expandir detalhes por padrão',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Ocultar notas de tradução por padrão',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Ativar rotação',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Toque duas vezes para redefinir',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Ordem dos botões da barra de ferramentas',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Ordem dos botões',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
                'Pressione e segure para mudar a ordem dos itens.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Pelo menos 4 botões desta lista estarão sempre visíveis na barra de ferramentas.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Os demais botões irão para o menu de três pontos (overflow).',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Pressione e segure para mover itens',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Somente para vídeos',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Esse botão não pode ser desativado',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Ação padrão de compartilhamento',
          'settings.viewer.shareActions' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Ações de compartilhamento',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Perguntar – sempre pergunta o que compartilhar',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL do post',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- URL do arquivo – compartilha o link direto para o arquivo original (pode não funcionar em alguns sites)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- URL do post/URL do arquivo/Arquivo com tags — compartilha a URL ou o arquivo e as tags selecionadas',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- Arquivo – compartilha o próprio arquivo. Pode levar algum tempo para carregar; o progresso será exibido no botão Compartilhar',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus – envia a URL do post para o Hydrus para importação',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Nota]: Se o arquivo estiver salvo no cache, ele será carregado de lá. Caso contrário, será carregado novamente da rede.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '​[Dica]: Toque e segure o botão de Compartilhar para abrir o menu de ações.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Usar botões de volume para rolar',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Rolagem com botões de volume',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Usar botões de volume para rolar pelas prévias e pelo visualizador',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Diminuir volume – próximo item',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Aumentar volume – item anterior',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'No visualizador:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Barra de ferramentas visível – controla o volume',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Barra de ferramentas oculta – controla a rolagem',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Velocidade de rolagem dos botões de volume',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Duração da apresentação de slides (em ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Apresentação de slides',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
                '​[Em desenvolvimento] Vídeos/GIFs: apenas rolagem manual',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Manter a tela ligada',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ??
                'Animação de abertura e fechamento do visualizador',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ??
                'Animação de transição de página do visualizador',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Usando animação padrão',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Usando animação personalizada',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF de carregamento da Kanna',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Amostra',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertical',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Superior',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Inferior',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Desativado',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Esquerda',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Direita',
          'settings.viewer.shareActionValues.ask' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Perguntar',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL do post',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL do post com tags',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL do arquivo',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL do ficheiro com tags',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Arquivo',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Arquivo com tags',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Vídeo',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Desativar vídeos',
          'settings.video.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ?? 'Útil em dispositivos fracos que travam ao tentar carregar vídeos. Oferece opções para assistir em um reprodutor externo ou no navegador.',
          'settings.video.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Reproduzir vídeos automaticamente',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Iniciar vídeos sem som',
          _ => null,
        } ??
        switch (path) {
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimental]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Backend do player de vídeo',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Padrão',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ?? 'Baseado no ExoPlayer. Oferece a melhor compatibilidade com dispositivos, mas pode apresentar problemas com vídeos em 4K, alguns codecs ou aparelhos antigos',
          'settings.video.backendMPVHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ?? 'Baseado no libmpv, possui configurações avançadas que podem ajudar a corrigir problemas com alguns codecs/dispositivos\n[PODE CAUSAR TRAVAMENTOS]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Baseado no libmdk, pode oferecer um desempenho melhor em alguns codecs/dispositivos\n[PODE CAUSAR TRAVAMENTOS]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Altere as configurações do \'MPV\' abaixo caso os vídeos apresentem erros de codec ou não funcionem corretamente:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: usar aceleração de hardware',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Modo de cache de vídeo',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Modos de cache de vídeo',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                'Streaming — Não armazena em cache, começa a reproduzir o mais rápido possível',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                'Cache — Salva no armazenamento, reproduz apenas após concluir o download',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                'Streaming + Cache — Mistura dos dois, mas no momento resulta em download duplo',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Nota]: Os vídeos só serão salvos em cache se "Cache de mídia" estiver ativado.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[AVISO]: No desktop, o modo Stream pode funcionar incorretamente para alguns Boorus',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Streaming',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Padrão',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'A partir do próximo item da fila',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Por favor, conceda permissão de armazenamento para poder baixar arquivos',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nenhum item selecionado',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nenhum item na fila',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Lote',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Baixar selecionados',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Remover status de baixado dos selecionados',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favoritar selecionados',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Desfavoritar selecionados',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Limpar selecionados',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Atualizando dados…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Banco de dados',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexando banco de dados',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Excluindo índices',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Ativar banco de dados',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Ativar indexação',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Ativar histórico de pesquisa',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Ativar busca de tipos de tags',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Tipo de Sankaku para atualiza',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Termo de pesquisa',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opcional, pode deixar o processo mais lento)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Não é possível sair da página agora!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Os dados do Sankaku estão sendo atualizados. Aguarde a conclusão ou cancele manualmente no final da página.',
          'settings.database.pleaseWaitTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Por favor, aguarde!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Os índices estão sendo alterados',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Armazena favoritos e rastreia itens baixados',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Itens já baixados não serão baixados novamente',
          'settings.database.indexingInfo' => TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ?? 'Acelera as pesquisas no banco de dados, mas usa mais espaço em disco (até 2x).\n\nNão saia da página nem feche o aplicativo durante a indexação.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Criar índices [Debug]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Remover índices [Debug]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Requer que o banco de dados esteja ativado.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Salva as últimas ${limit} pesquisas',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                'Toque no item para ver ações (Excluir, Favoritar…)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Pesquisas favoritadas são fixadas no topo da lista e não contam para o limite',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Busca os tipos de tags de boorus suportados',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Pode causar limitação de requisições',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Excluir banco de dados',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Excluir o banco de dados?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Banco de dados excluído!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'É necessário reiniciar o aplicativo!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Limpar itens baixados',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Limpar todos os itens baixados?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Itens baixados removidos',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Pode ser necessário reiniciar o app!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Limpar itens favoritados',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Limpar todos os itens favoritados?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoritos limpos',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Limpar histórico de pesquisa',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Limpar histórico de pesquisa?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Histórico de pesquisa limpo',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Atualização de favoritos do Sankaku',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Atualização de favoritos do Sankaku iniciada',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Novos URLs de imagem serão buscados para os itens do Sankaku nos seus favoritos',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Não saia desta página até que o processo seja concluído ou interrompido',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Nenhuma configuração do Sankaku encontrada!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Atualização dos favoritos do Sankaku concluída!',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Limpeza de itens com falha iniciada',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Itens que falharem ao atualizar serão removidos do banco de dados',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Atualizar URLs do Sankaku',
          'settings.database.updating' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Atualizando ${count} itens:',
          'settings.database.left' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Restantes: ${count}',
          'settings.database.done' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Concluídos: ${count}',
          'settings.database.failedSkipped' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Falhas/Pulados: ${count}',
          'settings.database.sankakuRateLimitWarning' => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ?? 'Pare e tente novamente mais tarde se notar o número de \'Falhas\' crescer constantemente; você pode ter atingido o limite de requisições (rate limit) e/ou o Sankaku está bloqueando o seu IP.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Toque aqui para pular o item atual',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Use se o item parecer travado',
          'settings.database.pressToStop' => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Toque aqui para parar',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Limpar itens com falha (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Tentar novamente itens com falha (${count})',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup e Restauração',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Arquivo duplicado detectado!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'O arquivo ${fileName} já existe. Deseja substituí-lo? Se escolher "Não", o backup será cancelado.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ?? 'Este recurso está disponível apenas no Android. Nas versões de desktop, você pode simplesmente copiar e colar os arquivos de/para a pasta de dados do app correspondente ao seu sistema.',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Selecionar pasta de backup',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Falha ao obter o caminho do backup',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Caminho de backup é: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Nenhum diretório de backup selecionado',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
                'Os arquivos devem estar na raiz do diretório',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Configurações de backup',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restaurar configurações',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ??
                'Backup das configurações salvo em settings.json',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Configurações restauradas do backup',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
                'Falha ao fazer backup das configurações',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Falha ao restaurar as configurações',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Redefinir diretório de backup',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Fazer backup dos Boorus',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restaurar Boorus',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Backup dos boorus salvo em boorus.json',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restauradas do backup',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Falha ao fazer backup dos Boorus',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Falha ao restaurar os Boorus',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Fazer backup do banco de dados',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restaurar banco de dados',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'Pode levar algum tempo dependendo do tamanho do banco de dados; o app será reiniciado após a conclusão',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ??
                'Backup do banco de dados salvo em store.db',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Banco de dados restaurado do backup! O app será reiniciado em alguns segundos!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ??
                'Falha ao fazer backup do banco de dados',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Falha ao restaurar o banco de dados',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'Arquivo do banco de dados não encontrado ou não pôde ser lido!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Fazer backup das tags',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restaurar tags',
          'settings.backupAndRestore.restoreTagsInfo' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ?? 'Pode demorar um pouco se você tiver muitas tags. Se você restaurou o banco de dados, não precisa fazer isso porque elas já estão incluídas no banco de dados',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Backup das tags salvo em tags.json',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restauradas do backup',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Falha ao fazer backup das tags',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Falha ao restaurar as tags',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
                'Arquivo de tags não encontrado ou não pode ser lido!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Toque em Ocultar abaixo se demorar muito; a operação continuará em segundo plano',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'Arquivo de backup não encontrado ou não pôde ser lido!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Sem acesso ao diretório de backup!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelado',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Rede',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                'Ativar certificados SSL autoassinados',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Não se aplica ao modo de streaming de vídeo; use o modo de cache de vídeo em vez disso',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'User-Agent personalizado',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'User-Agent personalizado',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Deixe em branco para usar o valor padrão',
          'settings.network.defaultUserAgent' => ({
            required String agent,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Padrão: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Usado na maioria das requisições de Booru e WebView',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Salvo ao sair da página',
          'settings.network.setBrowserUserAgent' => TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ?? 'Toque aqui para usar o User-Agent do navegador Chrome (recomendado apenas se o site bloquear user-agents que não sejam de navegadores)',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Limpador de cookies',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Selecione um booru para limpar os cookies ou deixe em branco para limpar todos',
          'settings.network.cookiesFor' => ({
            required String booruName,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies do ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                '«${cookieName}» cookie apagado',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Limpar cookies',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Limpar cookies do ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Cookies do ${booruName} foram limpos',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Todos os cookies foram limpos',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacidade',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Proteger app',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Proteger app manualmente ou depois de um tempo inativo. Requer PIN ou biometria',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Bloquear automaticamente após',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'em segundos, 0 para desativar',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Desfocar a tela ao sair do app',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Pode não funcionar em alguns dispositivos devido a limitações do sistema',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Teclado anônimo',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Impede que o teclado salve o histórico de digitação.\nAplicado à maioria dos campos de texto',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome de exibição do aplicativo',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Mude como o nome do app aparece nos seus apps',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Nome do app alterado',
          'settings.privacy.appAliasRestartHint' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ?? 'A alteração do nome do app entrará em vigor após reiniciar o aplicativo. Alguns launchers podem precisar de um tempo adicional ou da reinicialização do sistema para atualizar.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Falha ao alterar o nome do app. Por favor, tente novamente.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Reiniciar agora',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Modo de baixo desempenho',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Recomendado para dispositivos antigos e com pouca RAM',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Modo de baixo desempenho',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- Desativa informações detalhadas do progresso de carregamento',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- Desativa elementos pesados (desfoques, opacidade animada, algumas animações…)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Define configurações otimizadas para estas opções (você poderá alterá-las separadamente mais tarde):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Reprodução automática de vídeos',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Desativar vídeos',
          'settings.performance.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ?? 'Útil em dispositivos de baixo desempenho que travam ao tentar carregar vídeos. Oferece opções para assistir ao vídeo em um player externo ou no navegador.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download e cache',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Qualidade do download',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Intervalo de download (em ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
                'Por favor, insira um valor de tempo limite válido',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Por favor, insira um valor maior que 10ms',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Exibir notificações de download',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Baixar itens ao favoritar',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Favoritar itens ao baixar',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Salvar metadados em arquivo JSON ao baixar',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Requer diretório personalizado',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Definir diretório de armazenamento',
          'settings.cache.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Atual: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Redefinir diretório de armazenamento',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Cache de prévias',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Cache de mídia',
          'settings.cache.videoCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Modo de cache de vídeo',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Modos de cache de vídeo',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                'Streaming — Não armazena em cache, começa a reproduzir o mais rápido possível',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Cache — Salva o arquivo no armazenamento do dispositivo e só reproduz quando o download estiver concluído',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                'Streaming + Cache — Mistura dos dois, mas no momento resulta em download duplo',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Nota]: Os vídeos só serão salvos em cache se "Cache de mídia" estiver ativado.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Aviso]: No desktop, o modo Streaming pode não funcionar corretamente em alguns Boorus.',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Limpar cache após:',
          'settings.cache.neverDeleteDuration' => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nunca',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Limite de tamanho do cache (em GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Tamanho máximo total do cache',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Estatus do cache:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Carregando…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Vazio',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ??
                '${size}, ${count} arquivos',
          'settings.cache.inFileSingular' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 arquivo',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Total',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Miniaturas',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Amostras',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Mídia',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache limpo',
          'settings.cache.clearedCacheType' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cache de ${type} limpo',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Limpar todo o cache',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cache totalmente limpo',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Pode ser necessário reiniciar o app!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Erro!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ??
                'Não disponível para esta plataforma no momento',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtros',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Escondido',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Marcado',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filtro duplicado',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' já está na lista de \'${type}\'',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nenhum filtro encontrado',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nenhum filtro adicionado',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
                'Ocultar completamente itens que correspondem aos filtros Ocultos',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
                'Ocultar completamente itens que correspondem aos filtros marcados',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Remover itens favoritados',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Remover itens baixados',
          'settings.itemFilters.removeAI' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Remover itens gerados por IA',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sincronizar',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ??
                'O banco de dados precisa estar ativado para usar a Sincronização',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Erro!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Por favor, insira o endereço IP e a porta.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Selecione o que deseja fazer',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'ENVIAR dados PARA outro dispositivo',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RECEBER dados DE outro dispositivo',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Inicie o servidor no outro dispositivo, insira o IP/porta e toque em Iniciar sincronização',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'Endereço IP',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Endereço IP do servidor (ex.: 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Porta',
          'settings.sync.portPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Porta do servidor (ex.: 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Enviar favoritos',
          'settings.sync.favouritesCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoritos: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Enviar favoritos (legado)',
          'settings.sync.syncFavsFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sincronizar favoritos a partir de #…',
          'settings.sync.syncFavsFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ?? 'Permite definir a partir de onde a sincronização deve começar; útil se você já sincronizou todos os seus favoritos anteriormente e quer sincronizar apenas os itens mais recentes',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'Se desejar sincronizar desde o início, deixe este campo em branco',
          'settings.sync.syncFavsFromHelpText3' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ?? 'Exemplo: você tem uma quantidade X de favoritos; ao definir este campo como 100, a sincronização começará a partir do item nº 100 e continuará até atingir X',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
                'Ordem dos baixados: Do mais antigo (0) ao mais recente (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Enviar histórico de downloads',
          'settings.sync.snatchedCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Baixados: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sincronizar baixados a partir de #…',
          'settings.sync.syncSnatchedFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ?? 'Permite definir a partir de onde a sincronização deve começar; útil se você já sincronizou todo o seu histórico de downloads anteriormente e quer sincronizar apenas os itens mais recentes',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Se quiser sincronizar do início, deixe este campo em branco',
          'settings.sync.syncSnatchedFromHelpText3' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ?? 'Exemplo: você tem uma quantidade X de baixados; ao definir este campo como 100, a sincronização começará a partir do item nº 100 e continuará até atingir X',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                'Ordem dos baixados: Do mais antigo (0) ao mais recente (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Enviar configurações',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Enviar configurações do booru',
          'settings.sync.configsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configurações: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Enviar abas',
          'settings.sync.tabsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Abas: ${count}',
          'settings.sync.tabsSyncMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Modo de sincronização de abas',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                'Mesclar: Mesclar as abas deste dispositivo no outro dispositivo; abas com boorus desconhecidos e abas já existentes serão ignoradas',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Substituir: Substituir completamente as abas no outro dispositivo pelas abas deste dispositivo',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Mesclar',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Substituir',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Enviar tags',
          'settings.sync.tagsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}',
          'settings.sync.tagsSyncMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Modo de sincronização de tags',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Preservar tipo: Se a tag existir com um tipo de tag no outro dispositivo e não neste, ela será ignorada',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Sobrescrever: Todas as tags serão adicionadas; se uma tag e o tipo de tag existirem no outro dispositivo, serão sobrescritos',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preservar tipo',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Sobescrever',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testar conexão',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ??
                'Envia uma solicitação de teste para outro dispositivo.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ??
                'Exibe uma notificação em caso de sucesso ou falha.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Iniciar sincronização',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Os campos Porta e IP não podem ficar vazios!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Você não selecionou nada para sincronizar!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Estatísticas deste dispositivo:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Inicie o servidor para receber dados. Evite Wi-Fi público por segurança',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Interfaces de rede disponíveis',
          'settings.sync.selectedInterfaceIP' => ({
            required String ip,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP da interface selecionada: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Porta do servidor',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(o padrão será \'8080\' se estiver vazio)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Iniciar servidor receptor',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Sobre',
          'settings.about.appDescription' => TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ?? 'LoliSnatcher é de código aberto e licenciado com GPLv3. O código-fonte está disponível no GitHub. Por favor, reporte qualquer problema ou pedido de funcionalidade na seção "issues" no repositório.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher no Github',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contato',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-mail copiado!',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                'Agradecimentos especiais ao Showers-U por nos permitir usar sua arte no logo do aplicativo. Confira o trabalho deles no Pixiv',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Desenvolvedores',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Tradutores',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Lançamentos',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'A versão mais recente e o histórico completo de alterações podem ser encontrados na página de Releases do GitHub:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licensas',
          'settings.checkForUpdates.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Verificar se há atualizações',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Atualização disponível!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Novidades',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Notas da atualização',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Erro ao verificar atualizações!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Você já possui a versão mais recente',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Ver registro de alterações',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Versão atual',
          'settings.checkForUpdates.changelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Registro de alterações',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Ver na Play Store',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Ver lançamentos',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Logs',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Compartilhar logs',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Compartilhar logs com um aplicativo externo?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                'VISO]: Os logs podem conter informações sensíveis, compartilhe com cuidado!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Ajuda',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Depuração',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Modo de depuração ativado!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Modo de depuração desativado!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'O modo de depuração já está ativado!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Exibir gráfico de desempenho',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Exibir gráfico de FPS',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Exibir estatísticas da imagem',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Exibir estatísticas do vídeo',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Desfocar imagens + silenciar vídeos [Apenas DEV]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Ativar rolagem por arraste em listas [Apenas Desktop]',
          'settings.debug.animationSpeed' => ({
            required double speed,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Velocidade das animações (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Gerenciador de tags',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Res.: ${width}x${height}',
          'settings.debug.pixelRatio' => ({
            required String ratio,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Proporção de pixels: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Registrador de logs',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Limpar todos os cookies',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Limpar armazenamento seguro',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Obter string da sessão',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Definir string de sessão',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'String da sessão',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sessão restaurada a partir da string',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Registrador de logs',
          'settings.logging.captureLogcat' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Capturar logcat do Android',
          'settings.logging.captureLogcatDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
                'Gravar mensagens de aviso e erro do processo Android deste aplicativo',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Abrir o webview',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'para fazer login ou obter cookies',
          'settings.dirPicker.directoryName' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Nome do diretório',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Selecionar um diretório',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Deseja fechar o seletor sem escolher um diretório?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Não',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Sim',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Erro!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Falha ao criar o diretório',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'O diretório não possui permissão de escrita!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Nova pasta',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Criar',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Versão',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Comentários',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nenhum comentário',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                'Este booru não tem comentários ou não há API para eles',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Seletor de páginas',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Página #',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Atraso entre carregamentos (em ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Atraso em ms',
          'pageChanger.currentPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Página atual #${number}',
          'pageChanger.possibleMaxPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Página máxima possível #~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Busca em andamento!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Ir para a página',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Buscar até a página',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Parar busca',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Campo vazio!',
          'tagsFiltersDialogs.addNewFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Adicionar novo filtro de ${type}]',
          'tagsFiltersDialogs.newTagFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Novo filtro de tag: ${type}',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Novo filtro',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Editar filtro',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Adicionar tag',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Nome',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tipo',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'adicionar',
          'tagsManager.staleAfter' => ({
            required String staleText,
          }) => TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Obsoleto após: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Uma aba adicionada',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Adicionar aba',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copiar',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Marcar como obsoleto',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Redefinir obsoletos',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Tornar inexpirável',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Excluir ${count} tag',
                  few: 'Excluir ${count} tags',
                  many: 'Excluir ${count} tags',
                  other: 'Excluir ${count} tags',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Excluir tags',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Limpar seleção',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Toque para autenticar',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DESBLOQUEIO DEV',
          'lockscreen.testingMessage' => TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ?? '[EM TESTES]: Toque aqui se não conseguir desbloquear o aplicativo pelos meios normais. Relate ao desenvolvedor com detalhes sobre o seu dispositivo.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Deseja parar a sincronização?',
          'loliSync.stopServerQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Deseja parar o servidor?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Sem conexão',
          'loliSync.waitingForConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Aguardando conexão…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Iniciando o servidor…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Manter a tela acesa',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Servidor de sincronização encerrado',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Erro no teste: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' => ({
            required String error,
          }) => TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Erro no teste: ${error}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'A requisição de teste recebeu uma resposta positiva',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Deve haver uma mensagem de "Teste" no outro dispositivo',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Pesquisa por imagem',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Comentários',
          'tagView.showNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Exibir notas (${count})',
          'tagView.hideNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Ocultar notas (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Carregar notas',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Esta tag já está na busca atual:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Adicionada à atual lista de pesquisa',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nova aba adicionada',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL do post',
          'tagView.uploader' => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Postado',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detalhes',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Nome do arquivo',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Extensão',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Resolução',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Tamanho',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Classificação',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Pontuação',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nenhuma tag encontrada',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copiar',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Remover da Pesquisa',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Adicionar à pesquisa',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Adicionada a barra de pesquisa',
          'tagView.excludeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Excluir da busca',
          'tagView.exclusionAddedToSearchBar' =>
            TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Exclusão adicionada à barra de busca:',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Adicionar aos marcados',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Adicionar aos Ocultos',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Remover dos Marcados',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Remover dos Ocultos',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Editar tag',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Fonte',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Prévia',
          'tagView.selectBooruToLoad' =>
            TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Selecione um booru para carregar',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Carregando prévia…',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Falha ao carregar prévia',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Toque para tentar novamente',
          'tagView.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL do arquivo copiada para a área de transferência',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Prévia de tags',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Estado atual',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Histórico',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Falha ao carregar a página de prévia',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Tentar novamente',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Links detectados:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Abas relacionadas',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Abas apenas com esta tag',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'Abas apenas com esta tag, mas em outro booru',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Abas contendo esta tag',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Tags fixadas',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Fixar tag',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Desfixar tag',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Fixar',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Desfixar',
          'pinnedTags.pinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Fixar "${tag}" no acesso rápido?',
          'pinnedTags.unpinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Remover "${tag}" das tags fixadas?',
          'pinnedTags.onlyForBooru' => ({
            required String name,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Apenas para ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Rótulos (opcional)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ??
                'Digite e toque no botão "Adicionar" para incluir uma etiqueta',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Selecionar etiqueta existente',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag fixada',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Fixado para ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' => ({
            required String labels,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Fixado globalmente${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag desfixada',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Todas',
          'pinnedTags.reorderPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Reordenar tags fixadas',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Salvando…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Reordenar',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Adicionar tag manualmente',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nenhuma tag corresponde à sua busca',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Nenhuma tag fixada ainda',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Editar etiquetas',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Rótulos',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Adicionar tag fixada',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Busca da tag',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nome_da_tag',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
                'Você pode inserir qualquer termo de busca, incluindo tags com espaços',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Buscar tags',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Não foi possível carregar as sugestões. Toque para tentar novamente${msg}',
          'searchBar.noSuggestionsFound' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nenhuma sugestão encontrada',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Sugestões de tags indisponíveis para este booru',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ??
                '«${tag}» copiado para área de transferência',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefixo',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Excluir (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatags',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metatags livres',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Metatags livres não contam no limite de busca de tags',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Livre',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Único',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Intervalo',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popular',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Selecionar data',
          'searchBar.selectDatesRange' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Selecionar intervalo de datas',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Histórico',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Selecione o booru para o webview',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Bloquear app',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'O arquivo já existe',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Falha ao baixar',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Cancelado pelo usuário',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Salvar mesmo assim',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Pular',
          'mobileHome.retryAll' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Tentar todos novamente (${count})',
          _ => null,
        } ??
        switch (path) {
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Itens existentes, com falha ou cancelados',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Limpar todos os itens que podem ser retentados',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Downloader',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Adicionar outros boorus',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Configurações',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Salvar',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nenhum item selecionado',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nenhum item',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nenhum item selecionado',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Fechar',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nenhuma configuração de booru encontrada',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Adicionar novo Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Ajuda',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Configurações',
          'mediaPreviews.onboardingTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Configure sua primeira fonte',
          'mediaPreviews.onboardingSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
                'Adicione uma configuração de booru ou restaure um backup para começar a navegar',
          'mediaPreviews.addBooruAction' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Adicionar novo booru',
          'mediaPreviews.addBooruActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
                'Conecte um site adicionando sua URL e configurações de busca',
          'mediaPreviews.restoreBackupAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Restaurar ou gerenciar backups',
          'mediaPreviews.restoreBackupActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
                'Recupere configurações, boorus, abas e dados salvos',
          'mediaPreviews.openSettingsAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Abrir configurações',
          'mediaPreviews.openSettingsActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
                'Ajuste o comportamento do aplicativo antes de configurar as fontes',
          'mediaPreviews.helpSectionTitle' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Precisa de ajuda?',
          'mediaPreviews.booruSourcesArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
                'Como adicionar uma configuração de booru e como elas funcionam',
          'mediaPreviews.booruSourcesArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
                'Instruções para usuários que estão criando sua primeira configuração de booru',
          'mediaPreviews.backupRestoreArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Restaurando dados de um backup',
          'mediaPreviews.backupRestoreArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
                'Instruções para usuários que estão migrando de um app/versão anterior',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restaurando sessão anterior…',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL do arquivo copiada para a área de transferência!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Imagens',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Toque/Toque longo: alternar modo imersivo',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Toque duplo: ajustar à tela / tamanho original / redefinir zoom',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Não é possível iniciar a apresentação de slides',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Você chegou ao último item carregado',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pausar',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Começar',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Desfavoritar',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deselecionar',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Recarregar com escala',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Carregar qualidade de amostra',
          'viewer.appBar.loadHighQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Carregar em alta qualidade',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Remover status de baixado',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Definir status de baixado',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Baixar',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forçado)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Enviar para o Hydrus',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Qual URL você deseja enviar para o Hydrus?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL do post',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL do arquivo',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'O Hydrus não está configurado!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Compartilhar arquivo',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Este arquivo já está sendo baixado para compartilhamento. Deseja cancelar?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Já existe um arquivo sendo baixado para compartilhamento. Deseja cancelar o atual e compartilhar o novo?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Atual:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Novo:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Compartilhar novo',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abortar',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Erro!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Ocorreu um erro ao salvar o arquivo antes de compartilhar',
          'viewer.appBar.whatToShare' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'O que você deseja compartilhar?',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL do post com tags',
          'viewer.appBar.fileURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL do arquivo com tags',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Arquivo',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Arquivo com tags',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Selecionar tags',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Nota',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notas',
          'viewer.notes.coordinates' => ({
            required int posX,
            required int posY,
          }) => TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Selecionar um booru',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Item do booru copiado para a área de transferência',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Baixar?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Sem URL do post!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Carregando arquivo…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Isso pode levar algum tempo, aguarde…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Fonte',
                  few: 'Fontes',
                  many: 'Fontes',
                  other: 'Fontes',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Baixar',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favorito',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Compartilhar',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Selecionar',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Abrir no navegador',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Apresentação de slides',
          'galleryButtons.reloadNoScale' => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Alternar escala',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Alternar qualidade',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Player externo',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Buscar por imagem',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Renderizando…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Carregando e renderizando do cache…',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Carregando do cache…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Carregando buffer…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Carregando…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Carregar mesmo assim',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Reiniciar carregamento',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Parar carregamento',
          'media.loading.startedSecondsAgo' => ({
            required int seconds,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Começou há ${seconds}s',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Interrompido pelo usuário',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Erro ao carregar',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'O arquivo é muito grande',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Oculto por filtros:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Erro de vídeo',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Arquivo tem 0 bytes',
          'media.loading.fileSize' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Tamanho do arquivo: ${size}',
          'media.loading.sizeLimit' => ({
            required String limit,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limite: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Problemas frequentes de reprodução? Tente alterar [Configurações > Vídeo > Backend do player de vídeo]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Vídeos desativados ou sem suporte',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Abrir vídeo no player externo',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Abrir vídeo no navegador',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Falha ao carregar dados do item',
          'media.video.loadingItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Carregando dados do item...',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Tentar novamente',
          'media.video.openFileInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Abrir arquivo no navegador',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Abrir post no navegador',
          'media.video.currentlyChecking' =>
            TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Verificando no momento:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Formato de arquivo desconhecido (.${fileExt}), toque aqui para abrir no navegador',
          'imageStats.live' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Live: ${count}',
          'imageStats.pending' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Pendente: ${count}',
          'imageStats.total' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Total: ${count}',
          'imageStats.size' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Tamanho: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Máx: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nenhum resultado',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
                'Altere o termo de busca ou toque para tentar novamente',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Você chegou ao fim',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Páginas carregadas: ${pageNum}\nToque aqui para recarregar a última página',
          'preview.error.loadingPage' => ({
            required int pageNum,
          }) => TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Carregando página #${pageNum}…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  seconds,
                  one: 'Iniciado há ${seconds} segundo',
                  few: 'Iniciado há ${seconds} segundos',
                  many: 'Iniciado há ${seconds} segundos',
                  other: 'Iniciado há ${seconds} segundos',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Toque para tentar novamente se a requisição parecer travada ou estiver demorando muito',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Erro ao carregar a página #${pageNum}',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Toque aqui para tentar novamente',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Erro, nenhum resultado carregado',
          'preview.error.tapToRetry' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Toque aqui para tentar novamente',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Personagem',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Direitos autorais',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Espécie',
          'tagType.lore' => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nenhum/Geral',
          _ => null,
        };
  }
}
