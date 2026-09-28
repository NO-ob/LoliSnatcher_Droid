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
  late final _Translations$tagsFiltersDialogs$pt_BR tagsFiltersDialogs = _Translations$tagsFiltersDialogs$pt_BR._(_root);
  @override
  late final _Translations$tagsManager$pt_BR tagsManager = _Translations$tagsManager$pt_BR._(_root);
  @override
  late final _Translations$tagView$pt_BR tagView = _Translations$tagView$pt_BR._(_root);
  @override
  late final _Translations$pinnedTags$pt_BR pinnedTags = _Translations$pinnedTags$pt_BR._(_root);
  @override
  late final _Translations$desktopHome$pt_BR desktopHome = _Translations$desktopHome$pt_BR._(_root);
  @override
  late final _Translations$mediaPreviews$pt_BR mediaPreviews = _Translations$mediaPreviews$pt_BR._(_root);
  @override
  late final _Translations$viewer$pt_BR viewer = _Translations$viewer$pt_BR._(_root);
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
        one: '${count} novas abas adicionadas',
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
}

// Path: webview
class _Translations$webview$pt_BR extends Translations$webview$en {
  _Translations$webview$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
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
  late final _Translations$settings$database$pt_BR database = _Translations$settings$database$pt_BR._(_root);
  @override
  late final _Translations$settings$privacy$pt_BR privacy = _Translations$settings$privacy$pt_BR._(_root);
  @override
  late final _Translations$settings$cache$pt_BR cache = _Translations$settings$cache$pt_BR._(_root);
  @override
  late final _Translations$settings$about$pt_BR about = _Translations$settings$about$pt_BR._(_root);
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$pt_BR extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Adicionar novo filtro de ${type}]';
}

// Path: tagsManager
class _Translations$tagsManager$pt_BR extends Translations$tagsManager$en {
  _Translations$tagsManager$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Adicionar tag';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'adicionar';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Uma aba adicionada';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Adicionar aba';
}

// Path: tagView
class _Translations$tagView$pt_BR extends Translations$tagView$en {
  _Translations$tagView$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Adicionada à atual lista de pesquisa';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nova aba adicionada';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Adicionada a barra de pesquisa';
}

// Path: pinnedTags
class _Translations$pinnedTags$pt_BR extends Translations$pinnedTags$en {
  _Translations$pinnedTags$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Adicionar tag fixada';
}

// Path: desktopHome
class _Translations$desktopHome$pt_BR extends Translations$desktopHome$en {
  _Translations$desktopHome$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Adicionar outros boorus';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$pt_BR extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Adicionar novo Booru';
}

// Path: viewer
class _Translations$viewer$pt_BR extends Translations$viewer$en {
  _Translations$viewer$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$appBar$pt_BR appBar = _Translations$viewer$appBar$pt_BR._(_root);
}

// Path: tagType
class _Translations$tagType$pt_BR extends Translations$tagType$en {
  _Translations$tagType$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista';
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
}

// Path: settings.booru
class _Translations$settings$booru$pt_BR extends Translations$settings$booru$en {
  _Translations$settings$booru$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Adicionar configuração de Booru';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus adicionados';
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
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Aviso]: Não defina o Modo de Interface para Desktop em um celular, pois isso pode danificar o aplicativo e você poderá ter que apagar todas as suas configurações, incluindo as configurações do Booru.';
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
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Pelo menos 4 botões desta lista estarão sempre visíveis na barra de ferramentas.';
  @override
  late final _Translations$settings$viewer$shareActionValues$pt_BR shareActionValues = _Translations$settings$viewer$shareActionValues$pt_BR._(_root);
}

// Path: settings.database
class _Translations$settings$database$pt_BR extends Translations$settings$database$en {
  _Translations$settings$database$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'É necessário reiniciar o aplicativo!';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Pode ser necessário reiniciar o app!';
}

// Path: settings.privacy
class _Translations$settings$privacy$pt_BR extends Translations$settings$privacy$en {
  _Translations$settings$privacy$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Proteger app';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Proteger app manualmente ou depois de um tempo inativo. Requer PIN ou biometria';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome de exibição do aplicativo';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? 'Mude como o nome do app aparece nos seus apps';
}

// Path: settings.cache
class _Translations$settings$cache$pt_BR extends Translations$settings$cache$en {
  _Translations$settings$cache$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Pode ser necessário reiniciar o app!';
}

// Path: settings.about
class _Translations$settings$about$pt_BR extends Translations$settings$about$en {
  _Translations$settings$about$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher é de código aberto e licenciado com GPLv3. O código-fonte está disponível no GitHub. Por favor, reporte qualquer problema ou pedido de funcionalidade na seção "issues" no repositório.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher no Github';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$pt_BR extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abortar';
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

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$pt_BR extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

  final TranslationsPtBr _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Perguntar';
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
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Por favor, insira um valor',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Por favor, insira um valor válido',
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
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Por favor, insira um valor maior ou igual a 0',
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
      'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloqueio temporário',
      'authentication.somethingWentWrong' =>
        ({required String error}) =>
            TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
            'Ocorreu um erro durante a autenticação: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'A última aba foi removida',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Redefinindo para as tags padrão',
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
              one: '${count} novas abas adicionadas',
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
      'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'Ou seja, modo Multibooru',
      'multibooru.labelSecondaryBoorusToInclude' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Boorus adicionais para incluir',
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Erro ao importar para o Hydrus',
      'hydrus.apiPermissionsRequired' =>
        TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
            'Talvez as permissões da API não estejam corretas. Você pode editá-las em \'Revisar Serviços\'',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Adicionar tags ao arquivo',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Adicionar URLs',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Aba',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Adicionar boorus nas configurações',
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
      'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Embaralhar abas',
      'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Abas embaralhadas aleatoriamente',
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
      'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Consulta de busca vazia',
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
      'tabs.move.moveTo' => ({
        required String formattedNumber,
      }) => TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Mover para #${formattedNumber}',
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
      'history.unknownBooru' => ({
        required String name,
        required String type,
      }) => TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Booru desconhecido (${name}-${type})',
      'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Abrir',
      'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Abrir em uma nova aba',
      'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remover dos favoritos',
      'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Definir como Favorito',
      'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copiar',
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
      'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Adicionar configuração de Booru',
      'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus adicionados',
      'settings.booru.importBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importar configuração de Booru da área de transferência',
      'settings.booru.onlyLSURLsSupported' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Apenas URLs do loli.snatcher são suportadas',
      'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Apagar configuração de Booru',
      'settings.booru.deleteBooruError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Ocorreu um erro ao apagar a configuração do Booru!',
      'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Configuração do Booru apagada',
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
      'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor',
      'settings.booruEditor.testBooruFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'O teste do Booru falhou',
      'settings.booruEditor.testBooruFailedMsg' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? 'Os parâmetros de configuração podem estar incorretos, o Booru não permite acesso por API, a solicitação não retornou dados ou houve um erro de rede.',
      'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Salvar Booru',
      'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Executando teste...',
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
      'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL do Favicon',
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
      'settings.interface.appUIMode' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Modo de interface do usuário do app',
      'settings.interface.appUIModeWarningTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Modo de interface do usuário do app',
      'settings.interface.appUIModeWarning' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
            'Usar o modo Desktop? Pode causar problemas em dispositivos móveis. [INTERFACE DESCONTINUADA]',
      'settings.interface.appUIModeHelpMobile' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Interface dispositivos móveis',
      'settings.interface.appUIModeHelpWarning' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ?? '[Aviso]: Não defina o Modo de Interface para Desktop em um celular, pois isso pode danificar o aplicativo e você poderá ter que apagar todas as suas configurações, incluindo as configurações do Booru.',
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
      'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniaturas em GIF',
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
      'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Usar cores dinâmicas',
      'settings.theme.android12PlusOnly' => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Apenas Android 12+',
      'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema',
      'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Cor primária',
      'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Cor secundária',
      'settings.theme.enableDrawerMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Ativar mascote do menu lateral',
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
        TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Posição da barra de ferramentas do visualizador',
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
      'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
            'Pelo menos 4 botões desta lista estarão sempre visíveis na barra de ferramentas.',
      'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Perguntar',
      'settings.database.appRestartRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'É necessário reiniciar o aplicativo!',
      'settings.database.appRestartMayBeRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Pode ser necessário reiniciar o app!',
      'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Proteger app',
      'settings.privacy.appLockMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
            'Proteger app manualmente ou depois de um tempo inativo. Requer PIN ou biometria',
      'settings.privacy.appDisplayName' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome de exibição do aplicativo',
      'settings.privacy.appDisplayNameDescription' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? 'Mude como o nome do app aparece nos seus apps',
      'settings.cache.appRestartRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Pode ser necessário reiniciar o app!',
      'settings.about.appDescription' => TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ?? 'LoliSnatcher é de código aberto e licenciado com GPLv3. O código-fonte está disponível no GitHub. Por favor, reporte qualquer problema ou pedido de funcionalidade na seção "issues" no repositório.',
      'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher no Github',
      'tagsFiltersDialogs.addNewFilter' => ({
        required String type,
      }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Adicionar novo filtro de ${type}]',
      'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Adicionar tag',
      'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'adicionar',
      'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Uma aba adicionada',
      'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Adicionar aba',
      'tagView.addedToCurrentSearch' =>
        TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Adicionada à atual lista de pesquisa',
      'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nova aba adicionada',
      'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Adicionada a barra de pesquisa',
      'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Adicionar tag fixada',
      'desktopHome.addBoorusInSettings' =>
        TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Adicionar outros boorus',
      'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Adicionar novo Booru',
      'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abortar',
      'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista',
      _ => null,
    };
  }
}
