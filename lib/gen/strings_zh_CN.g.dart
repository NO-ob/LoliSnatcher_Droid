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
class TranslationsZhCn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsZhCn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.zhCn,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <zh-CN>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsZhCn _root = this; // ignore: unused_field

  @override
  TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'zh-CN';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '简体中文';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '萝莉猎手';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '错误';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '错误！';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '成功';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '成功！';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '取消';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? '返回';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '稍后';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '关闭';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '好的';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '是的';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '不';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '请稍等一会…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '显示';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '隐藏';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '启用';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '禁用';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '添加';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? '排除';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '编辑';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '移除';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '保存';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '删除';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '确认';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '重试';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '清除';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '复制';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '已复制';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '已复制到剪贴板';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '未找到任何内容';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '粘贴';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '复制错误';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '前往设置';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '这可能需要一些时间…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '退出应用？';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '关闭应用';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '无效的链接！';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '剪贴板为空！';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '打开链接失败';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API 密钥';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '用户ID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '登录';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '密码';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '暂停';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '恢复';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '访问我们的 Discord 服务器';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '项目';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '选择';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '选择全部';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '重置';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '打开';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '打开新标签页';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移动';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '随机排序';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '排序';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '前往';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '搜索';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '过滤';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '或者（~）';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '页';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '页#';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '标签';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? '类型';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '名称';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '地址';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '用户名称';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? '收藏夹';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? '下载';
  @override
  String get secondsShort => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? '秒';
  @override
  String get minutesShort => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? '分';
  @override
  String get hoursShort => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? '时';
  @override
  String get daysShort => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? '天';
  @override
  String get leaveThisPageQuestion => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? '要离开此页面吗？';
  @override
  String get pageWillCloseAutomatically => TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? '此页面即将自动关闭';
  @override
  String get stay => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? '留下';
  @override
  String get leaveNow => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? '立刻离开';
  @override
  late final _Translations$validationErrors$zh_CN validationErrors = _Translations$validationErrors$zh_CN._(_root);
  @override
  late final _Translations$init$zh_CN init = _Translations$init$zh_CN._(_root);
  @override
  late final _Translations$permissions$zh_CN permissions = _Translations$permissions$zh_CN._(_root);
  @override
  late final _Translations$authentication$zh_CN authentication = _Translations$authentication$zh_CN._(_root);
  @override
  late final _Translations$searchHandler$zh_CN searchHandler = _Translations$searchHandler$zh_CN._(_root);
  @override
  late final _Translations$snatcher$zh_CN snatcher = _Translations$snatcher$zh_CN._(_root);
  @override
  late final _Translations$multibooru$zh_CN multibooru = _Translations$multibooru$zh_CN._(_root);
  @override
  late final _Translations$hydrus$zh_CN hydrus = _Translations$hydrus$zh_CN._(_root);
  @override
  late final _Translations$tabs$zh_CN tabs = _Translations$tabs$zh_CN._(_root);
  @override
  late final _Translations$history$zh_CN history = _Translations$history$zh_CN._(_root);
  @override
  late final _Translations$webview$zh_CN webview = _Translations$webview$zh_CN._(_root);
  @override
  late final _Translations$settings$zh_CN settings = _Translations$settings$zh_CN._(_root);
  @override
  late final _Translations$comments$zh_CN comments = _Translations$comments$zh_CN._(_root);
  @override
  late final _Translations$pageChanger$zh_CN pageChanger = _Translations$pageChanger$zh_CN._(_root);
  @override
  late final _Translations$tagsFiltersDialogs$zh_CN tagsFiltersDialogs = _Translations$tagsFiltersDialogs$zh_CN._(_root);
  @override
  late final _Translations$tagsManager$zh_CN tagsManager = _Translations$tagsManager$zh_CN._(_root);
  @override
  late final _Translations$lockscreen$zh_CN lockscreen = _Translations$lockscreen$zh_CN._(_root);
  @override
  late final _Translations$loliSync$zh_CN loliSync = _Translations$loliSync$zh_CN._(_root);
  @override
  late final _Translations$imageSearch$zh_CN imageSearch = _Translations$imageSearch$zh_CN._(_root);
  @override
  late final _Translations$tagView$zh_CN tagView = _Translations$tagView$zh_CN._(_root);
  @override
  late final _Translations$pinnedTags$zh_CN pinnedTags = _Translations$pinnedTags$zh_CN._(_root);
  @override
  late final _Translations$searchBar$zh_CN searchBar = _Translations$searchBar$zh_CN._(_root);
  @override
  late final _Translations$mobileHome$zh_CN mobileHome = _Translations$mobileHome$zh_CN._(_root);
  @override
  late final _Translations$desktopHome$zh_CN desktopHome = _Translations$desktopHome$zh_CN._(_root);
  @override
  late final _Translations$galleryView$zh_CN galleryView = _Translations$galleryView$zh_CN._(_root);
  @override
  late final _Translations$mediaPreviews$zh_CN mediaPreviews = _Translations$mediaPreviews$zh_CN._(_root);
  @override
  late final _Translations$viewer$zh_CN viewer = _Translations$viewer$zh_CN._(_root);
  @override
  late final _Translations$common$zh_CN common = _Translations$common$zh_CN._(_root);
  @override
  late final _Translations$gallery$zh_CN gallery = _Translations$gallery$zh_CN._(_root);
  @override
  late final _Translations$galleryButtons$zh_CN galleryButtons = _Translations$galleryButtons$zh_CN._(_root);
  @override
  late final _Translations$media$zh_CN media = _Translations$media$zh_CN._(_root);
  @override
  late final _Translations$imageStats$zh_CN imageStats = _Translations$imageStats$zh_CN._(_root);
  @override
  late final _Translations$preview$zh_CN preview = _Translations$preview$zh_CN._(_root);
  @override
  late final _Translations$tagType$zh_CN tagType = _Translations$tagType$zh_CN._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$zh_CN extends Translations$validationErrors$en {
  _Translations$validationErrors$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '请输入一个值';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '请输入有效值';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '请输入一个数字';
  @override
  String get invalidNumericValue => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '请输入一个有效的数字值';
  @override
  String tooSmall({required double min}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '请输入大于 ${min} 的值';
  @override
  String tooBig({required double max}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '请输入小于 ${max} 的值';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '请输入一个介于 ${min} 和 ${max} 之间的值';
  @override
  String get greaterThanOrEqualZero => TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '请输入一个大于或等于0的数值';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '请输入小于4的值';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '请输入一个大于100的值';
  @override
  String get moreThan4ColumnsWarning => TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '使用超过4列可能会影响性能';
  @override
  String get moreThan8ColumnsWarning => TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '使用超过8列可能会影响性能';
}

// Path: init
class _Translations$init$zh_CN extends Translations$init$en {
  _Translations$init$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '初始化错误！';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '正在设置代理…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '正在加载数据库…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '正在加载boorus…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '正在加载标签…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '正在恢复标签…';
}

// Path: permissions
class _Translations$permissions$zh_CN extends Translations$permissions$en {
  _Translations$permissions$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '无法访问自定义存储目录';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? '请再次设置存储目录以授予应用访问权限';
  @override
  String currentPath({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '当前路径：${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '设置目录';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? '此平台不可用';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '重置目录';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ?? '重置后，文件将保存到默认目录';
}

// Path: authentication
class _Translations$authentication$zh_CN extends Translations$authentication$en {
  _Translations$authentication$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '请进行身份验证以使用该应用';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '未检测到生物识别硬件';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '临时锁定';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '身份认证过程中出错：${error}';
}

// Path: searchHandler
class _Translations$searchHandler$zh_CN extends Translations$searchHandler$en {
  _Translations$searchHandler$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '已删除最后一个标签页';
  @override
  String get resettingSearchToDefaultTags => TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '重置为默认标签';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '评级已更正';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '在 ${booruType} 上，[rating:safe] 现在被替换为 [rating:general] 和 [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ?? '评级已自动修正。请在以后的搜索中使用正确的评级';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '标签页已恢复';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '从上次会话中恢复了 ${count} 个标签页',
        few: '从上次会话中恢复了 ${count} 个标签页',
        many: '从上次会话中恢复了 ${count} 个标签页',
        other: '从上次会话中恢复了 ${count} 个标签页',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '一些恢复的标签页中有未知的booru或损坏的字符。';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '它们被设置为默认值或被忽略。';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '损坏的标签页列表：';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '标签页已合并';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '已添加 ${count} 个新标签页',
        few: '添加了 ${count} 个新标签页',
        many: '添加了 ${count} 个新标签页',
        other: '添加了 ${count} 个新标签页',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '标签页已替换';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '接收了 ${count} 个标签页',
        few: '接收了 ${count} 个标签页',
        many: '接收了 ${count} 个标签页',
        other: '接收了 ${count} 个标签页',
      );
}

// Path: snatcher
class _Translations$snatcher$zh_CN extends Translations$snatcher$en {
  _Translations$snatcher$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '下载器';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '下载记录';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '输入标签';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '数量';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '要下载的文件数量';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '间隔（毫秒）';
  @override
  String get delayBetweenEachDownload => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '每次下载之间的间隔时间';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '开始下载';
  @override
  String get itemWasAlreadySnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '此项目之前已下载过';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '项目下载失败';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '下载被取消';
  @override
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '开始下载下一项…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '项目已下载';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '已下载：${count} 个项目',
        few: '已下载：${count} 个项目',
        many: '已下载：${count} 个项目',
        other: '已下载：${count} 个项目',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '${count} 个文件之前已下载过',
        few: '${count} 个文件之前已下载过',
        many: '${count} 个文件之前已下载过',
        other: '${count} 个文件之前已下载过',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '${count} 个文件下载失败',
        few: '${count} 个文件下载失败',
        many: '${count} 个文件下载失败',
        other: '${count} 个文件下载失败',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '已取消 ${count} 个文件下载',
        few: '已取消 ${count} 个文件下载',
        many: '已取消 ${count} 个文件下载',
        other: '已取消 ${count} 个文件下载',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '正在下载图片';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '不要关闭应用！';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '添加项目到下载队列';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '已添加 ${count} 个项目到下载队列',
        few: '已添加 ${count} 个项目到下载队列',
        many: '已添加 ${count} 个项目到下载队列',
        other: '已添加 ${count} 个项目到下载队列',
      );
}

// Path: multibooru
class _Translations$multibooru$zh_CN extends Translations$multibooru$en {
  _Translations$multibooru$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '多站';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '多Booru站模式';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '需要有至少2个已配置好的Booru';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '选择额外的booru：';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '又名多Booru模式';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '要包含的次要Booru';
}

// Path: hydrus
class _Translations$hydrus$zh_CN extends Translations$hydrus$en {
  _Translations$hydrus$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? '导入Hydrus时出现了错误';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ?? '您可能没有授予正确的API权限，可以在Review Services中编辑';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '给文件添加标签';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? '添加链接';
}

// Path: tabs
class _Translations$tabs$zh_CN extends Translations$tabs$en {
  _Translations$tabs$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '标签页';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '在设置中添加Booru';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '选择一个Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '次要Booru';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '新建标签页';
  @override
  String get selectABooruOrLeaveEmpty => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '选择一个Booru或留空';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '添加位置';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '上一个标签页';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '下一个标签页';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '列表末尾';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '使用的查询';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '默认';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '当前';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '自定义';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '自定义查询';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[空白]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '添加次要Booru';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '保留次要Booru';
  @override
  String get startFromCustomPageNumber => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '从指定页数开始';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '切换到新标签页';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '添加';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '标签页管理';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '选择模式';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '标签页排序';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '帮助';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '删除标签页';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '随机排序标签页';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '已随机排序标签页';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '已保存标签页顺序';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '滚动到当前标签页';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '滚动到顶部';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '滚动到底部';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '按Booru,状态,重复过滤…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? '滚动：';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '排序：';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '默认标签页顺序';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '按字母排序';
  @override
  String get sortAlphabeticallyReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '按字母排序（逆向）';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '按Booru名称排序';
  @override
  String get sortByBooruNameReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '按Booru名称排序（逆向）';
  @override
  String get longPressSortToSave => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '长按排序按钮来保存当前的顺序';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '选择：';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '切换选择模式';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? '在页面底部： ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '选择/反选所有标签页';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '删除已选标签页';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? '长按一个标签页来移动它';
  @override
  String get numbersInBottomRight => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? '标签页右下角数字的含义：';
  @override
  String get firstNumberTabIndex => TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '第一个数字 - 默认顺序下该标签页的序号';
  @override
  String get secondNumberTabIndex => TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ?? '第二个数字 - 当前排序下标签页的序号，在有过滤/排序规则时出现';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '特殊过滤：';
  @override
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '《已加载》 -  显示有已加载项目的标签页';
  @override
  String get notLoadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«未加载» - 显示未加载或项目为空的标签页';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '未加载的标签页名称为斜体';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? '找不到标签页';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? '复制';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '移动';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '移除';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? '随机排序';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '排序';
  @override
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? '是否要随机排序标签页？';
  @override
  String get saveTabsInCurrentOrder => TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? '是否要保存当前的标签页顺序？';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? '按Booru排序';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? '按名称排序';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '（反向）';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '确认要删除 ${count} 个标签页吗？',
        few: '确认要删除 ${count} 个标签页吗？',
        many: '确认要删除 ${count} 个标签页吗？',
        other: '确认要删除 ${count} 个标签页吗？',
      );
  @override
  late final _Translations$tabs$filters$zh_CN filters = _Translations$tabs$filters$zh_CN._(_root);
  @override
  late final _Translations$tabs$move$zh_CN move = _Translations$tabs$move$zh_CN._(_root);
}

// Path: history
class _Translations$history$zh_CN extends Translations$history$en {
  _Translations$history$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '搜索历史';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '搜索历史是空的';
  @override
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '已禁用搜索历史';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? '在设置中启用数据库以记录搜索历史';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '上次的搜索： ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '上次的搜索： ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '未知的Booru类型！';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '未知的Booru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '打开';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '在新标签页中打开';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? '从收藏中移除';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? '添加收藏';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? '复制';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '删除';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '删除历史记录';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '确定要删除 ${count} 个项目吗？',
        few: '确定要删除 ${count} 个项目吗？',
        many: '确定要删除 ${count} 个项目吗？',
        other: '确定要删除 ${count} 个项目吗？',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '清除选择';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '删除 ${count} 个项目',
        few: '删除 ${count} 个项目',
        many: '删除 ${count} 个项目',
        other: '删除 ${count} 个项目',
      );
}

// Path: webview
class _Translations$webview$zh_CN extends Translations$webview$en {
  _Translations$webview$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? '网页模式';
  @override
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? '此设备上不支持';
  @override
  String get captcha => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? '验证码';
  @override
  String get captchaCheckDescription => TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ?? '检测到可能有验证码，请通过验证码后返回';
  @override
  String get captchaCompleted => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? '已通过验证码';
  @override
  late final _Translations$webview$navigation$zh_CN navigation = _Translations$webview$navigation$zh_CN._(_root);
}

// Path: settings
class _Translations$settings$zh_CN extends Translations$settings$en {
  _Translations$settings$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '设置';
  @override
  late final _Translations$settings$language$zh_CN language = _Translations$settings$language$zh_CN._(_root);
  @override
  late final _Translations$settings$booru$zh_CN booru = _Translations$settings$booru$zh_CN._(_root);
  @override
  late final _Translations$settings$booruEditor$zh_CN booruEditor = _Translations$settings$booruEditor$zh_CN._(_root);
  @override
  late final _Translations$settings$interface$zh_CN interface = _Translations$settings$interface$zh_CN._(_root);
  @override
  late final _Translations$settings$theme$zh_CN theme = _Translations$settings$theme$zh_CN._(_root);
  @override
  late final _Translations$settings$viewer$zh_CN viewer = _Translations$settings$viewer$zh_CN._(_root);
  @override
  late final _Translations$settings$video$zh_CN video = _Translations$settings$video$zh_CN._(_root);
  @override
  late final _Translations$settings$downloads$zh_CN downloads = _Translations$settings$downloads$zh_CN._(_root);
  @override
  late final _Translations$settings$database$zh_CN database = _Translations$settings$database$zh_CN._(_root);
  @override
  late final _Translations$settings$backupAndRestore$zh_CN backupAndRestore = _Translations$settings$backupAndRestore$zh_CN._(_root);
  @override
  late final _Translations$settings$network$zh_CN network = _Translations$settings$network$zh_CN._(_root);
  @override
  late final _Translations$settings$privacy$zh_CN privacy = _Translations$settings$privacy$zh_CN._(_root);
  @override
  late final _Translations$settings$performance$zh_CN performance = _Translations$settings$performance$zh_CN._(_root);
  @override
  late final _Translations$settings$cache$zh_CN cache = _Translations$settings$cache$zh_CN._(_root);
  @override
  late final _Translations$settings$itemFilters$zh_CN itemFilters = _Translations$settings$itemFilters$zh_CN._(_root);
  @override
  late final _Translations$settings$sync$zh_CN sync = _Translations$settings$sync$zh_CN._(_root);
  @override
  late final _Translations$settings$about$zh_CN about = _Translations$settings$about$zh_CN._(_root);
  @override
  late final _Translations$settings$checkForUpdates$zh_CN checkForUpdates = _Translations$settings$checkForUpdates$zh_CN._(_root);
  @override
  late final _Translations$settings$logs$zh_CN logs = _Translations$settings$logs$zh_CN._(_root);
  @override
  late final _Translations$settings$help$zh_CN help = _Translations$settings$help$zh_CN._(_root);
  @override
  late final _Translations$settings$debug$zh_CN debug = _Translations$settings$debug$zh_CN._(_root);
  @override
  late final _Translations$settings$logging$zh_CN logging = _Translations$settings$logging$zh_CN._(_root);
  @override
  late final _Translations$settings$webview$zh_CN webview = _Translations$settings$webview$zh_CN._(_root);
  @override
  late final _Translations$settings$dirPicker$zh_CN dirPicker = _Translations$settings$dirPicker$zh_CN._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '版本';
}

// Path: comments
class _Translations$comments$zh_CN extends Translations$comments$en {
  _Translations$comments$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? '评论';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? '没有评论';
  @override
  String get noBooruAPIForComments => TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? '此Booru站点不支持评论或没有对应的API';
}

// Path: pageChanger
class _Translations$pageChanger$zh_CN extends Translations$pageChanger$en {
  _Translations$pageChanger$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? '翻页器';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? '页数';
  @override
  String get delayBetweenLoadings => TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '加载间隔（毫秒）';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '毫秒';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '当前页#${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '可能的最高页数 #~${number}';
  @override
  String get searchCurrentlyRunning => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '有搜索正在运行!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '跳转至页数';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '一直搜到页数';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '停止搜索';
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$zh_CN extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '输入为空！';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[添加了新的 ${type} 过滤器]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '新的 ${type} 标签过滤器';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '新过滤器';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? '编辑过滤器';
}

// Path: tagsManager
class _Translations$tagsManager$zh_CN extends Translations$tagsManager$en {
  _Translations$tagsManager$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? '标签';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? '添加标签';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '名称';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? '类型';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '添加';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '在 ${staleText} 后过期';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? '已添加标签页';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? '添加标签页';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? '复制';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? '设置为过期';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '重置过期时间';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? '设置为永不过期';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '删除 ${count} 个标签',
        few: '删除 ${count} 个标签',
        many: '删除 ${count} 个标签',
        other: '删除 ${count} 个标签',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? '删除标签';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '清除选择';
}

// Path: lockscreen
class _Translations$lockscreen$zh_CN extends Translations$lockscreen$en {
  _Translations$lockscreen$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? '点击认证';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK';
  @override
  String get testingMessage => TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ?? '[仅供测试]：若通常方式解锁都失败请点此处。并将您设备的详细情况报告给开发者。';
}

// Path: loliSync
class _Translations$loliSync$zh_CN extends Translations$loliSync$en {
  _Translations$loliSync$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';
  @override
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '要停止同步吗？';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? '要停止服务器吗？';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '无连接';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '等待连接…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? '正在启动服务器…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? '屏幕常亮';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? '已结束LoliSync服务器';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      '测试失败: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? '测试失败: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? '测试请求返回了积极的回应';
  @override
  String get testSuccessMessage => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '另一台设备上应该有一条\'Test\'信息';
}

// Path: imageSearch
class _Translations$imageSearch$zh_CN extends Translations$imageSearch$en {
  _Translations$imageSearch$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '图像搜索';
}

// Path: tagView
class _Translations$tagView$zh_CN extends Translations$tagView$en {
  _Translations$tagView$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? '标签';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? '评论';
  @override
  String showNotes({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? '显示笔记 (${count})';
  @override
  String hideNotes({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? '隐藏笔记 (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? '加载笔记';
  @override
  String get thisTagAlreadyInSearch => TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? '当前搜索中已包含此标签：';
  @override
  String get addedToCurrentSearch => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '已添加至当前搜索：';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '已添加至新标签页：';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '帖子链接';
  @override
  String get uploader => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? '上传者';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '发布时间';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '详细信息';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? '文件名';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? '链接';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '扩展名';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '分辨率';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? '尺寸';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? '分级';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '评分';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? '未找到标签';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? '复制';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '从搜索中移除';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '添加到搜索';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '已添加到搜索框：';
  @override
  String get excludeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? '从搜索中排除';
  @override
  String get exclusionAddedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? '已添加排除项至搜索框：';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? '添加到已标记';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? '添加到隐藏';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? '从已标记中移除';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? '从隐藏中移除';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? '编辑标签';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? '来源';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? '预览';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '选择要加载的Booru';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? '正在加载预览…';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? '加载预览失败';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? '点击重试';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? '已复制文件链接至剪贴板';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? '标签预览';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '当前状态';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '历史记录';
  @override
  String get failedToLoadPreviewPage => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? '加载预览页失败';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '重试';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? '检测到链接：';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? '相关的标签页';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? '只有此标签的标签页';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? '只有此标签的不同站点的标签页';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? '包含此标签的标签页';
}

// Path: pinnedTags
class _Translations$pinnedTags$zh_CN extends Translations$pinnedTags$en {
  _Translations$pinnedTags$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? '固定的标签';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? '固定标签';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? '取消固定标签';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? '固定';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? '取消固定';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '将 «${tag}» 固定到快速访问吗？';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '将 «${tag}» 从快速访问移除吗？';
  @override
  String onlyForBooru({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? '仅用于 ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? '标注（可选）';
  @override
  String get typeAndPressAdd => TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? '输入后点击加号添加';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? '搜索已有标注';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? '已固定标签';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? '已固定在 ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? '已全局固定${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? '已取消固定标签';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? '所有';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? '重新排序固定的标签';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? '保存中…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? '重新排序';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? '手动添加标签';
  @override
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? '找不到您搜索的标签';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? '还没有固定的标签';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? '编辑标注';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? '标注';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? '添加固定的标签';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? '标签搜索';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name';
  @override
  String get rawQueryHelp => TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? '可以搜索任何关键词，包括有空格的标签';
}

// Path: searchBar
class _Translations$searchBar$zh_CN extends Translations$searchBar$en {
  _Translations$searchBar$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? '搜索标签';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? '无法加载搜索建议。点击重试${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '没有搜索建议';
  @override
  String get tagSuggestionsNotAvailable => TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? '此Booru站点不支持搜索建议';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '复制了 «${tag}» 到剪贴板';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? '前缀';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '排除 (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? '元标签';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? '免费的元标签';
  @override
  String get freeMetatagsDescription => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? '免费的元标签不计入标签搜索限制';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? '免费';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '单日';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '范围';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '人气';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '选择日期';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '选择日期范围';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '历史记录';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class _Translations$mobileHome$zh_CN extends Translations$mobileHome$en {
  _Translations$mobileHome$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? '选择要在网页中打开的Booru';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? '锁定应用';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? '文件已存在';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? '下载失败';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? '被用户取消';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? '仍然保存';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? '跳过';
  @override
  String retryAll({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? '全部重试 (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '已存在，失败或取消的项目';
  @override
  String get clearAllRetryableItems => TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? '清除所有可重试的项目';
}

// Path: desktopHome
class _Translations$desktopHome$zh_CN extends Translations$desktopHome$en {
  _Translations$desktopHome$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? '下载器';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '在设置中添加Booru';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '设置';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '保存';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? '未选择项目';
}

// Path: galleryView
class _Translations$galleryView$zh_CN extends Translations$galleryView$en {
  _Translations$galleryView$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? '没有项目';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? '未选择项目';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '关闭';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$zh_CN extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? '未找到Booru配置';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? '添加新Booru';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? '帮助';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '设置';
  @override
  String get restoringPreviousSession => TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '正在恢复到之前的会话…';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? '已复制文件链接到剪贴板！';
}

// Path: viewer
class _Translations$viewer$zh_CN extends Translations$viewer$en {
  _Translations$viewer$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$tutorial$zh_CN tutorial = _Translations$viewer$tutorial$zh_CN._(_root);
  @override
  late final _Translations$viewer$appBar$zh_CN appBar = _Translations$viewer$appBar$zh_CN._(_root);
  @override
  late final _Translations$viewer$notes$zh_CN notes = _Translations$viewer$notes$zh_CN._(_root);
}

// Path: common
class _Translations$common$zh_CN extends Translations$common$en {
  _Translations$common$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? '选择一个Booru';
  @override
  String get booruItemCopiedToClipboard => TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru项目已复制到剪贴板';
}

// Path: gallery
class _Translations$gallery$zh_CN extends Translations$gallery$en {
  _Translations$gallery$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? '下载吗？';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '没有帖子链接！';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? '正在加载文件';
  @override
  String get loadingFileMessage => TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? '可能需要一些时间，请稍等';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '来源',
        few: '来源',
        many: '来源',
        other: '来源',
      );
}

// Path: galleryButtons
class _Translations$galleryButtons$zh_CN extends Translations$galleryButtons$en {
  _Translations$galleryButtons$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? '下载';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? '收藏';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? '信息';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? '分享';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? '选择';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? '在浏览器打开';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? '播放幻灯片';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? '切换缩放';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? '切换质量';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? '外部播放器';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? '图片搜索';
}

// Path: media
class _Translations$media$zh_CN extends Translations$media$en {
  _Translations$media$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$loading$zh_CN loading = _Translations$media$loading$zh_CN._(_root);
  @override
  late final _Translations$media$video$zh_CN video = _Translations$media$video$zh_CN._(_root);
}

// Path: imageStats
class _Translations$imageStats$zh_CN extends Translations$imageStats$en {
  _Translations$imageStats$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? '就绪：${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '等待: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '总共: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? '内存: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '最大: ${max}';
}

// Path: preview
class _Translations$preview$zh_CN extends Translations$preview$en {
  _Translations$preview$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$zh_CN error = _Translations$preview$error$zh_CN._(_root);
}

// Path: tagType
class _Translations$tagType$zh_CN extends Translations$tagType$en {
  _Translations$tagType$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? '艺术家';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? '角色';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? '版权';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? '元数据';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? '物种';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? '无/通常的';
}

// Path: tabs.filters
class _Translations$tabs$filters$zh_CN extends Translations$tabs$filters$en {
  _Translations$tabs$filters$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? '已加载';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? '标签类型';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? '多站';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '重复项';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '检查同一Booru下的重复项目';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '只显示无搜索的标签页';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? '标签页过滤';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? '所有';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '未加载';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '启用';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '禁用';
  @override
  String get willAlsoEnableSorting => TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '会同时启用排序';
  @override
  String get tagTypeFilterHelp => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? '仅显示包含所选标签的标签页';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? '任意';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '应用';
}

// Path: tabs.move
class _Translations$tabs$move$zh_CN extends Translations$tabs$move$en {
  _Translations$tabs$move$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '移动到顶部';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '移动到底部';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? '标签页编号';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '无效的标签页编号';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '无效的输入';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '超出范围';
  @override
  String get pleaseEnterValidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '请输入一个有效的标签页编号';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '移动至 #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? '预览：';
}

// Path: webview.navigation
class _Translations$webview$navigation$zh_CN extends Translations$webview$navigation$en {
  _Translations$webview$navigation$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? '输入链接';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? '输入自定义链接';
  @override
  String navigateTo({required String url}) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '前往 ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? '列出cookies';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? '清除cookies';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? '轻轻的Cookies走了，正如它轻轻的来。';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? '获取网站图标';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? '未找到网站图标';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? '主机：';
  @override
  String get textAboveSelectable => TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '（上面的文字是可以选择的）';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? '复制链接';
  @override
  String get copiedUrlToClipboard => TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? '已复制链接至剪贴板';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? '网站图标';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '历史记录';
  @override
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '当前已是最后页';
  @override
  String get noForwardHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '当前已是最前页';
}

// Path: settings.language
class _Translations$settings$language$zh_CN extends Translations$settings$language$en {
  _Translations$settings$language$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '语言';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? '跟随系统';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '帮助我们翻译';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      '访问 <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>GitHub</a> 查看详情，或点击下面的图片前往POEditor';
}

// Path: settings.booru
class _Translations$settings$booru$zh_CN extends Translations$settings$booru$en {
  _Translations$settings$booru$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & 搜索';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '默认标签';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '每页加载数量';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '一些Booru站会忽略这个设置';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '添加Booru配置';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '分享Booru配置';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      '以链接的方式分享配置 ${booruName} .\n\n要包括登录信息/API密钥吗？';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      '复制 ${booruName} 的配置链接到剪贴板.\n\n要包括登录信息/API密钥吗？';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? '分享Booru';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      '在Android12以及更高版本中自动打开Booru配置链接：\n1) 点击下面的按钮打开系统的默认链接设置\n2) 点击《添加链接》并选择所有选项';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? '已添加的Booru';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? '编辑Booru配置';
  @override
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? '从剪贴板中导入Booru配置';
  @override
  String get onlyLSURLsSupported => TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? '仅支持 loli.snatcher 的链接';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? '删除Booru配置';
  @override
  String get deleteBooruError => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? '删除Booru配置时出现了错误！';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '已删除Booru配置';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ?? '选择的Booru在保存后会设为默认。\n\n默认Booru在下拉菜单中第一个出现';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? '是否更换默认的Booru？';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? '更换成： ';
  @override
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '点 [否] 维持当前设置: ';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '点 [是] 更换成: ';
  @override
  String get booruConfigLinkCopied => TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '已将Booru配置链接复制到剪贴板';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? '未选择Booru！';
  @override
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? '无法删除此Booru！';
  @override
  String get removeRelatedTabsFirst => TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '请先删除相关的标签页';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$zh_CN extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru编辑器';
  @override
  String get testBooruFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru测试失败';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? '配置参数不正确、Booru不允许API访问、返回为空或网络错误。';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? '保存Booru';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? '正在测试…';
  @override
  String get booruConfigExistsError => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? '已存在此Booru的配置';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? '存在同名的Booru配置';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? '存在相同链接的Booru配置';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? '此Booru配置不会被添加';
  @override
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '已保存Booru配置';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ?? '刷新此站点的标签页以使更改生效！';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? '无法验证Hydrus的API访问权限';
  @override
  String get accessKeyRequestedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? '已申请访问密钥';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ?? '在Hydrus中点击允许，然后再回来点击\'测试Booru\'。';
  @override
  String get accessKeyFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? '申请访问密钥失败';
  @override
  String get accessKeyFailedMsg => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? '在Hydrus中，您是否已经打开申请页面？';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      '获得Hydrus密钥需要您在Hydrus客户端中打开页面。Services > Review services > Client API > Add > From API request';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? '获取Hydrus API密钥';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru名称';
  @override
  String get booruNameRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? '必须填写Booru名称！';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru链接';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? '必须填写Booru链接！';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru类型';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '网站图标链接';
  @override
  String get booruFaviconPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(留空自动填写)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? '默认标签';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? '对此Booru的默认搜索';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? '一些Booru需要填写以下条目';
  @override
  String get booruConfigShouldSave => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? '确认保存Booru配置';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      '已选/检测到的Booru类型：${booruType}';
}

// Path: settings.interface
class _Translations$settings$interface$zh_CN extends Translations$settings$interface$en {
  _Translations$settings$interface$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? '界面';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? '应用界面模式';
  @override
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? '应用界面模式';
  @override
  String get appUIModeWarning => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ?? '要使用桌面模式吗？可能会在移动设备上出现问题。已弃用！';
  @override
  String get appUIModeHelpMobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- 移动设备 - 通常的移动设备界面';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ?? '- 桌面模式 - Ahoviewer 风格的界面 [已弃用，需要重做]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[警告]: 不要在手机上把界面模式设置成桌面模式，可能会导致应用异常，使你不得不清空所有设置，包括Booru配置。';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '惯用手';
  @override
  String get handSideHelp => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? '将界面元素的位置调整到相应的方向';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? '在图片预览界面显示搜索框';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '在搜索中将输入框移至顶部';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '搜索时显示快捷操作面板';
  @override
  String get searchViewInputAutofocus => TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '搜索框自动获得焦点';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '禁用振动';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? '即使禁用了，某些操作可能依然会振动';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? '预测性返回手势';
  @override
  String get previewColumnsPortrait => TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? '预览列数（竖屏）';
  @override
  String get previewColumnsLandscape => TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? '预览列数（横屏）';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? '预览质量';
  @override
  String get previewQualityHelp => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? '改变预览窗格中图片的分辨率';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ?? ' -预览- 中等画质，在等待图片加载时应用会先显示缩略图';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' -缩略图- 低画质';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ?? '[注意]: 预览画质可能会影响性能，尤其是在列数过多的情况下';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? '预览显示方式';
  @override
  String get previewDisplayFallback => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? '备用的显示方式';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ?? '当交错选项不可用时，会改用此选项';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '禁用图片缩放';
  @override
  String get dontScaleImagesSubtitle => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? '可能会降低性能';
  @override
  String get dontScaleImagesWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '警告';
  @override
  String get dontScaleImagesWarning => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? '确定要禁用图片缩放吗？';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ?? '这样会影响性能，尤其是在旧的设备上';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF缩略图';
  @override
  String get gifThumbnailsRequires => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '需要启用《禁用图片缩放》';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? '滚动预览按钮的位置';
  @override
  String get mouseWheelScrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? '鼠标滚轮滚动倍率';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? '滚动倍率';
  @override
  late final _Translations$settings$interface$previewQualityValues$zh_CN previewQualityValues =
      _Translations$settings$interface$previewQualityValues$zh_CN._(_root);
  @override
  late final _Translations$settings$interface$previewDisplayModeValues$zh_CN previewDisplayModeValues =
      _Translations$settings$interface$previewDisplayModeValues$zh_CN._(_root);
  @override
  late final _Translations$settings$interface$appModeValues$zh_CN appModeValues = _Translations$settings$interface$appModeValues$zh_CN._(_root);
  @override
  late final _Translations$settings$interface$handSideValues$zh_CN handSideValues = _Translations$settings$interface$handSideValues$zh_CN._(_root);
}

// Path: settings.theme
class _Translations$settings$theme$zh_CN extends Translations$settings$theme$en {
  _Translations$settings$theme$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? '主题';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? '主题模式';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '黑色背景';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? '使用动态颜色';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? '仅适用于Android12及以上';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? '主题';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? '主要颜色';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? '次要颜色';
  @override
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? '侧边栏吉祥物';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? '自定义吉祥物';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? '移除自定义吉祥物';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '当前吉祥物路径';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? '跟随系统';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? '亮色';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? '暗色';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? '粉色';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? '紫色';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? '蓝色';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '青色';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? '红色';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? '绿色';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? '万圣节';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? '自定义';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '选择颜色';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '已选颜色';
  @override
  String get selectedColorAndShades => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '已选定的颜色和阴影';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? '字体';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? '系统默认';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? '查看更多字体';
  @override
  String get fontPreviewText => TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? '这里是字体预览 苟利国家生死以 ABCDEFG';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? '自定义字体';
  @override
  String get customFontSubtitle => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? '输入字体在Google Font上的名称';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? '字体名称';
  @override
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? '在 fonts.google.com 查找字体';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? '找不到此字体';
}

// Path: settings.viewer
class _Translations$settings$viewer$zh_CN extends Translations$settings$viewer$en {
  _Translations$settings$viewer$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? '查看器';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? '预加载数量';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? '预加载大小限制';
  @override
  String get preloadSizeLimitSubtitle => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '单位为GB，0为不限制';
  @override
  String get preloadHeightLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? '预加载高度限制';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? '单位是像素，0为不限制';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '图像质量';
  @override
  String get viewerScrollDirection => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? '查看器滚动方向';
  @override
  String get viewerToolbarPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? '工具栏位置';
  @override
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? '缩放按钮位置';
  @override
  String get changePageButtonsPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? '翻页按钮位置';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? '打开查看器时隐藏工具栏';
  @override
  String get expandDetailsByDefault => TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? '自动展开详情';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '自动隐藏翻译笔记';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '允许旋转';
  @override
  String get enableRotationSubtitle => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? '双击重置旋转';
  @override
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? '工具栏按钮顺序';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? '按钮顺序';
  @override
  String get longPressToChangeItemOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '长按改变顺序。';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ?? '在工具栏中至少要有4个按钮保持可见。';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ?? '其他按钮会被收纳在展开(三点)菜单中。';
  @override
  String get longPressToMoveItems => TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '长按移动项目';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '仅限视频';
  @override
  String get thisButtonCannotBeDisabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? '不可以隐藏这个按钮';
  @override
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? '默认分享行为';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '分享行为';
  @override
  String get shareActionsAsk => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- 询问 - 始终询问分享什么';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- 帖子链接';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ?? '- 文件链接 - 分享原文件的直链（可能有一些网站不支持）';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- 带标签的 帖子链接/文件链接/文件 - 分享链接/文件和你选定的标签';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ?? '- 文件 - 分享文件本身，可能需要一些时间加载，加载进度会显示在分享按钮上';
  @override
  String get shareActionsHydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - 将帖子的链接导入至Hydrus';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[注意]：如果缓存中有这个文件，就会从缓存中分享。如果没有就要再次从网络中加载。';
  @override
  String get shareActionsTip => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ?? '[提示]：长按分享按钮可以打开分享选项菜单。';
  @override
  String get useVolumeButtonsForScrolling => TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '用音量键滚动';
  @override
  String get volumeButtonsScrolling => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '音量键滚动';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ?? '在预览界面和查看器中使用音量键滚动';
  @override
  String get volumeButtonsVolumeDown => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - 音量减 - 下一项';
  @override
  String get volumeButtonsVolumeUp => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - 音量加 - 上一项';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? '在查看器中：';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' -工具栏显示时- 音量键控制音量';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' -工具栏隐藏时- 音量键控制翻页';
  @override
  String get volumeButtonsScrollSpeed => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? '音量键滚动速度';
  @override
  String get slideshowDurationInMs => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? '幻灯片时间（毫秒）';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? '幻灯片';
  @override
  String get slideshowWIPNote => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[开发中] 视频/GIF：仅手动翻页';
  @override
  String get preventDeviceFromSleeping => TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? '阻止自动锁屏';
  @override
  String get viewerOpenCloseAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? '查看器打开/关闭动画';
  @override
  String get viewerPageChangeAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? '查看器翻页动画';
  @override
  String get usingDefaultAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? '使用默认动画';
  @override
  String get usingCustomAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? '使用自定义动画';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '加载时康娜动图';
  @override
  late final _Translations$settings$viewer$imageQualityValues$zh_CN imageQualityValues = _Translations$settings$viewer$imageQualityValues$zh_CN._(
    _root,
  );
  @override
  late final _Translations$settings$viewer$scrollDirectionValues$zh_CN scrollDirectionValues =
      _Translations$settings$viewer$scrollDirectionValues$zh_CN._(_root);
  @override
  late final _Translations$settings$viewer$toolbarPositionValues$zh_CN toolbarPositionValues =
      _Translations$settings$viewer$toolbarPositionValues$zh_CN._(_root);
  @override
  late final _Translations$settings$viewer$buttonPositionValues$zh_CN buttonPositionValues =
      _Translations$settings$viewer$buttonPositionValues$zh_CN._(_root);
  @override
  late final _Translations$settings$viewer$shareActionValues$zh_CN shareActionValues = _Translations$settings$viewer$shareActionValues$zh_CN._(_root);
}

// Path: settings.video
class _Translations$settings$video$zh_CN extends Translations$settings$video$en {
  _Translations$settings$video$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '视频';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '不播放视频';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ?? '针对低端设备播放视频崩溃的问题。提供在外部播放器或浏览器中播放的选项。';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '自动播放视频';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '播放时静音';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[实验性]';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? '视频播放后端';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? '默认';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ?? '基于 exoplayer. 设备兼容性最好，在播放4K时、某些视频编码或旧设备上可能会有问题';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ?? '基于 libmpv， 包含进阶选项，或许有助于解决一些视频编码/设备上的问题\n[可能会崩溃]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ?? '基于 libmdk,  在一些视频编码/设备上可能有更好的性能\n[可能会崩溃]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ?? '如果出现视频播放异常或者解码器错误，可以试一试将\'MPV\'设置调整到不同的选项：';
  @override
  String get mpvUseHardwareAcceleration => TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV：使用硬件加速';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV：视频输出';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV：硬解模式';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? '视频缓存模式';
  @override
  late final _Translations$settings$video$cacheModes$zh_CN cacheModes = _Translations$settings$video$cacheModes$zh_CN._(_root);
  @override
  late final _Translations$settings$video$cacheModeValues$zh_CN cacheModeValues = _Translations$settings$video$cacheModeValues$zh_CN._(_root);
  @override
  late final _Translations$settings$video$videoBackendModeValues$zh_CN videoBackendModeValues =
      _Translations$settings$video$videoBackendModeValues$zh_CN._(_root);
}

// Path: settings.downloads
class _Translations$settings$downloads$zh_CN extends Translations$settings$downloads$en {
  _Translations$settings$downloads$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue => TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? '从队列中的下一个项目开始';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ?? '下载文件需要授予存储权限';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? '未选择项目';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? '队列中没有项目';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? '批';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '下载已选项';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? '从已选项中清除下载状态';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '收藏已选项';
  @override
  String get unfavouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '取消收藏已选项';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '清除已选';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? '正在升级数据…';
}

// Path: settings.database
class _Translations$settings$database$zh_CN extends Translations$settings$database$en {
  _Translations$settings$database$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? '数据库';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? '正在索引数据库';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? '正在清除索引';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? '启用数据库';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? '启用索引';
  @override
  String get enableSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '启用搜索记录';
  @override
  String get enableTagTypeFetching => TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? '启用标签类型获取';
  @override
  String get sankakuTypeToUpdate => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '需要更新的Sankaku类型';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '搜索查询';
  @override
  String get searchQueryOptional => TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '（可选，可能会导致过程变慢）';
  @override
  String get cantLeavePageNow => TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '现在不可以离开页面！';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ?? '正在升级Sankaku数据，请等待完成或者在页面底部手动取消';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? '请稍等！';
  @override
  String get indexesBeingChanged => TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? '正在变更索引';
  @override
  String get databaseInfo => TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? '用于保存收藏和记录下载';
  @override
  String get databaseInfoSnatch => TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? '不会重新下载已下载过的项目';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ?? '加速数据库中的搜索，但是会增加存储占用（可高达2倍）。\n\n索引时请勿离开页面或退出应用。';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? '创建索引[调试]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? '清除索引[调试]';
  @override
  String get searchHistoryInfo => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? '需要启用数据库。';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? '会保存上 ${limit} 次搜索';
  @override
  String get searchHistoryTapInfo => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? '点击记录可进行操作（删除，收藏…）';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ?? '收藏的搜索关键词会被置顶，不计入总数量限制。';
  @override
  String get tagTypeFetchingInfo => TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? '从支持的Booru中获取标签类型';
  @override
  String get tagTypeFetchingWarning => TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? '可能会触发访问限速';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? '删除数据库';
  @override
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? '确认删除数据库吗？';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? '数据库已删除！';
  @override
  String get appRestartRequired => TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? '需要重启应用！';
  @override
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? '清除已下载记录';
  @override
  String get clearAllSnatchedConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? '确认要清除已下载的记录吗？';
  @override
  String get snatchedItemsCleared => TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? '下载记录已清除';
  @override
  String get appRestartMayBeRequired => TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? '可能需要重启应用！';
  @override
  String get clearFavouritedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? '清除收藏的项目';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? '确认要清除收藏的项目吗？';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? '已清除收藏';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '清除搜索记录';
  @override
  String get clearSearchHistoryConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '确认清除搜索记录吗？';
  @override
  String get searchHistoryCleared => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '已清除搜索记录';
  @override
  String get sankakuFavouritesUpdate => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? '更新Sankaku收藏';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? '已开始更新Sankaku收藏';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ?? '正在为您收藏中的Sankaku项目获取新的图片链接';
  @override
  String get sankakuDontLeavePage => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ?? '请不要在进度完成或停止前离开此页面';
  @override
  String get noSankakuConfigFound => TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? '未找到Sankaku配置！';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku收藏更新完成';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '已开始清除失败条目';
  @override
  String get failedItemsPurgeInfo => TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ?? '更新失败的项目将会从数据库中移除';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? '更新Sankaku链接';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '正在更新 ${count} 个项目：';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '剩余：${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '已完成：${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '失败/已跳过：${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      '如果您看到\'失败\'的数量一直在增长，请稍后再尝试，这可能是触发了速率限制或您的IP被Sankaku屏蔽。';
  @override
  String get skipCurrentItem => TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '点这里跳过当前项目';
  @override
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? '在看起来卡住时使用';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? '点这里停止';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '清除失败的条目（${count} 个）';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '重试失败的条目（${count} 个）';
}

// Path: settings.backupAndRestore
class _Translations$settings$backupAndRestore$zh_CN extends Translations$settings$backupAndRestore$en {
  _Translations$settings$backupAndRestore$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? '备份&恢复';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '检测到重名的文件！';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      '文件 ${fileName} 已存在。是否要覆盖它？如果选择了否，将取消当前的备份。';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      '此功能仅限Android，在电脑版本里，您可以直接复制粘贴应用的数据文件到系统相应的位置中';
  @override
  String get selectBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? '选择备份目录';
  @override
  String get failedToGetBackupPath => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '获取备份目录失败';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ?? '备份目录为：${backupPath}';
  @override
  String get noBackupDirSelected => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? '未选择备份目录';
  @override
  String get restoreInfoMsg => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? '文件必须位于根目录下';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '备份设置';
  @override
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '恢复设置';
  @override
  String get settingsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '设置已备份至settings.json';
  @override
  String get settingsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '已从备份恢复设置';
  @override
  String get backupSettingsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '备份设置失败';
  @override
  String get restoreSettingsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '恢复设置失败';
  @override
  String get resetBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? '重置备份目录';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '备份Booru (图站)';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '恢复Booru';
  @override
  String get boorusBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru已备份至boorus.json';
  @override
  String get boorusRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '已从备份中恢复Booru';
  @override
  String get backupBoorusError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '备份Booru失败';
  @override
  String get restoreBoorusError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '恢复Booru失败';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '备份数据库';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '恢复数据库';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ?? '根据数据库大小，可能会需要一段时间，备份成功时将重启应用';
  @override
  String get databaseBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? '数据库已备份至store.db';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ?? '已从备份中恢复数据库！应用将在几秒后重启！';
  @override
  String get backupDatabaseError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '备份数据库失败';
  @override
  String get restoreDatabaseError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '恢复数据库失败';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? '找不到数据库或数据库不可读！';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '备份标签';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '恢复标签';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ?? '如果保存的标签很多，将会需要一段时间。如果您已恢复过数据库，不必再使用本功能，标签包含在数据库中';
  @override
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '标签已备份至tags.json';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '已从备份中恢复标签';
  @override
  String get backupTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '备份标签失败';
  @override
  String get restoreTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '恢复标签失败';
  @override
  String get tagsFileNotFound => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? '未找到标签文件或文件不可读！';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ?? '如果等了很久，可以点击下面的隐藏，操作将在后台继续';
  @override
  String get backupFileNotFound => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? '未找到备份文件或文件不可读！';
  @override
  String get backupDirNoAccess => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? '无权访问备份目录！';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '备份已取消';
}

// Path: settings.network
class _Translations$settings$network$zh_CN extends Translations$settings$network$en {
  _Translations$settings$network$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '网络';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? '允许自签名的SSL证书';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? '代理';
  @override
  String get proxySubtitle => TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ?? '流式传输的视频不会走代理，如有需要请切换到缓存模式';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? '自定义User-Agent';
  @override
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? '自定义User-Agent';
  @override
  String get keepEmptyForDefault => TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? '留空以使用默认值';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? '默认值：${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? '用于大多数Booru请求和网页浏览';
  @override
  String get valueSavedAfterLeaving => TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? '在退出页面时保存';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ?? '点这里设置为Chrome的User-Agent（只推荐在网站屏蔽非浏览器User-Agent时使用）';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie清理器';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ?? '选择一个要清理Cookie的Booru，或留空清理所有的';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} 的Cookies:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '已删除Cookie «${cookieName}»';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? '清除Cookies';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? '清除${booruName}的Cookies';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ?? '已清除${booruName} 的Cookies';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? '已清除所有Cookies';
}

// Path: settings.privacy
class _Translations$settings$privacy$zh_CN extends Translations$settings$privacy$en {
  _Translations$settings$privacy$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? '隐私';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? '应用锁';
  @override
  String get appLockMsg => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ?? '手动或一段时间后锁定应用。需要PIN/生物验证';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? '自动锁定计时';
  @override
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '单位是秒，设置成0不自动锁定';
  @override
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? '离开应用时模糊界面';
  @override
  String get bluronLeaveMsg => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? '由于系统限制，可能在某些设备上无效';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? '无痕键盘';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ?? '阻止输入法记录输入历史。\n大部分输入框都生效';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? '应用显示名称';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? '改变应用在桌面上显示的名称';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? '已修改应用名称';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ?? '新的应用名称在重启应用后生效。一部分桌面可能要等一段时间或者系统重启后才会改变。';
  @override
  String get appAliasChangeFailed => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? '改变应用名称失败。请再试一次。';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? '立即重启';
}

// Path: settings.performance
class _Translations$settings$performance$zh_CN extends Translations$settings$performance$en {
  _Translations$settings$performance$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? '性能';
  @override
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '低性能模式';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ?? '推荐在旧设备和低内存机型上开启';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '低性能模式';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ?? '- 禁用详细的加载进度信息';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- 禁用高消耗元素（模糊效果、动画透明度、部分动画…）';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ?? '为以下选项套用最优设置（您可以在稍后单独自行更改）：';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '自动播放视频';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '禁止播放视频';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ?? '针对低端设备播放视频崩溃的问题。提供在外部播放器或浏览器中播放的选项。';
}

// Path: settings.cache
class _Translations$settings$cache$zh_CN extends Translations$settings$cache$en {
  _Translations$settings$cache$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '下载&缓存';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? '下载质量';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? '下载间隔（毫秒）';
  @override
  String get pleaseEnterAValidTimeout => TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '请输入一个有效的时间值';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '请输入大于10ms的值';
  @override
  String get showDownloadNotifications => TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? '显示下载通知';
  @override
  String get snatchItemsOnFavouriting => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? '收藏时下载该项目';
  @override
  String get favouriteItemsOnSnatching => TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? '下载时收藏该项目';
  @override
  String get writeImageDataOnSave => TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '下载时保存图像信息到同名JSON文件';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? '需要自定义目录';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? '设置存储目录';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '当前：${path}';
  @override
  String get resetStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? '重置存储目录';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? '缓存预览图';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? '缓存媒体';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? '视频缓存模式';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? '视频缓存模式';
  @override
  String get videoCacheModeStream => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ?? '- 流式 - 不缓存，边加载边播放';
  @override
  String get videoCacheModeCache => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ?? '- 缓存 - 将视频保存到设备上，下载完成才播放';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ?? '- 流式+缓存 - 两者的结合，目前会导致视频被加载两次';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ?? '[注意]：只有在\'缓存媒体\'启用时，视频才会被缓存。';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ?? '[警告]：在桌面模式下某些网站不支持流式加载。';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? '缓存保留时间：';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? '缓存体积限制（GB）';
  @override
  String get maximumTotalCacheSize => TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '总缓存上限';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? '缓存统计：';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '加载中…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '空的';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} 个文件';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1个文件';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '总计';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? '网站图标';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? '缩略图';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? '预览图';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? '媒体';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? '网页缓存';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? '已清除缓存';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '已清除${type}缓存';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? '清除所有缓存';
  @override
  String get clearedCacheCompletely => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? '已完成缓存清除';
  @override
  String get appRestartRequired => TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? '可能要重启应用！';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? '出错了！';
  @override
  String get notAvailableForPlatform => TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '目前不支持此平台';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$zh_CN extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? '过滤';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? '隐藏';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? '标记';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? '重复的过滤器';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ?? '\'${tag}\' 已存在与 ${type} 列表中';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? '未找到过滤器';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? '未添加过滤器';
  @override
  String get removeHidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? '当符合隐藏过滤器时完全隐藏该项目';
  @override
  String get removeMarked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? '当符合标记过滤器时完全隐藏该项目';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? '隐藏已收藏的项目';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? '隐藏已下载的项目';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? '隐藏AI生成的项目';
}

// Path: settings.sync
class _Translations$settings$sync$zh_CN extends Translations$settings$sync$en {
  _Translations$settings$sync$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sync';
  @override
  String get dbError => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? '使用Sync必须启用数据库';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? '错误！';
  @override
  String get pleaseEnterIPAndPort => TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? '请输入IP地址和端口。';
  @override
  String get selectWhatYouWantToDo => TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '选择你想做的事';
  @override
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '发送数据到另一台设备';
  @override
  String get receiveDataFromDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '从其他设备接受数据';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ?? '在另一台设备上启动服务器，输入它的IP/端口，然后点击开始同步';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP地址';
  @override
  String get ipAddressPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? '主机IP地址（如192.168.1.1）';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? '端口';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? '主机端口（如7777）';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? '发送收藏';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? '收藏数： ${count}';
  @override
  String get sendFavouritesLegacy => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? '发送收藏（旧版）';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '从 #… 同步收藏';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ?? '允许设置同步的起始位置，适用于您之前已经同步了所有的收藏，现在只想同步最新项目的情况';
  @override
  String get syncFavsFromHelpText2 => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? '如需从头同步请留空';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ?? '举例：您有X个收藏，将此选项设置为100，会同步从#100到X的项目';
  @override
  String get syncFavsFromHelpText4 => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? '收藏顺序：从最旧 (0) 到最新 (X)';
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? '发送下载记录';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? '已下载：${count}';
  @override
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '从#…开始同步下载';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ?? '允许设置同步的起始位置，适用于您之前已经同步了所有的下载记录，现在只想同步最新项目的情况';
  @override
  String get syncSnatchedFromHelpText2 => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ?? '如需从头同步请留空';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ?? '举例：您有X条下载记录，将此选项设置为100，会同步从#100到X的项目';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? '下载记录顺序：从最旧 (0) 到最新 (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '发送设置';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? '发送Booru配置';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '配置数量：${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? '发送标签页';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? '标签页数量：${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? '标签页同步模式';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? '合并：将此设备上的标签页合并到另一台设备上，已存在的和包含未知Booru的标签页将被忽略';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ?? '替换：将另一台设备上的所有标签页完全替换为这台设备上的标签页';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '合并';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '替换';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? '发送标签';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? '标签数：${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? '标签同步模式';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ?? '保留类型：如果标签类型已存在于其他设备上，但在此设备上不存在，则会跳过该标签';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ?? '覆盖：将会添加所有的标签，另一设备上已存在的标签和标签类型将被覆盖';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? '保留类型';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '覆盖';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '测试连接';
  @override
  String get testConnectionHelpText1 => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? '向另一台设备发送测试请求。';
  @override
  String get testConnectionHelpText2 => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? '成功/失败时会显示通知。';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? '开始同步';
  @override
  String get portAndIPCannotBeEmpty => TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? '端口和IP不能为空！';
  @override
  String get nothingSelectedToSync => TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '没有选择要同步的项目！';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? '此设备上的统计：';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ?? '启用一个接受数据的服务器。为了安全请不要在公共WiFi中使用';
  @override
  String get availableNetworkInterfaces => TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '可用的网络接口';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '已选择的接口IP: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? '服务器端口';
  @override
  String get serverPortPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '（如果留空会默认设置为8080）';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? '启动接收端服务器';
}

// Path: settings.about
class _Translations$settings$about$zh_CN extends Translations$settings$about$en {
  _Translations$settings$about$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? '关于';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher（萝莉猎手） 为开源软件，采用 GPLv3 许可协议，源代码可在 GitHub 上获取。如有任何问题或功能请求，请在代码仓库的 issues 区域提交。';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher的GitHub页面';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? '联系方式';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '已复制电子邮件地址到剪贴板';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ?? '非常感谢Showers-U允许我们使用其作品作为应用图标。欢迎前往Pixiv关注作者';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '开发者';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? '翻译者';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? '发布页';
  @override
  String get releasesMsg => TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ?? '最新版本和完整的更新说明在GitHub发布页上：';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? '许可证';
}

// Path: settings.checkForUpdates
class _Translations$settings$checkForUpdates$zh_CN extends Translations$settings$checkForUpdates$en {
  _Translations$settings$checkForUpdates$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? '检查更新';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? '有更新！';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? '新版本介绍';
  @override
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? '更新说明';
  @override
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? '检查更新失败！';
  @override
  String get youHaveLatestVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '您已是最新版';
  @override
  String get viewLatestChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '查看最新的更新说明';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '当前版本';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '更新说明';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? '访问Play商店';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '访问发布页';
}

// Path: settings.logs
class _Translations$settings$logs$zh_CN extends Translations$settings$logs$en {
  _Translations$settings$logs$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? '日志';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? '分享日志';
  @override
  String get shareLogsWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? '分享日志到外部应用吗？';
  @override
  String get shareLogsWarningMsg => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ?? '[注意]：日志可能包含敏感信息，请谨慎分享！';
}

// Path: settings.help
class _Translations$settings$help$zh_CN extends Translations$settings$help$en {
  _Translations$settings$help$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? '帮助';
}

// Path: settings.debug
class _Translations$settings$debug$zh_CN extends Translations$settings$debug$en {
  _Translations$settings$debug$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? '调试';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? '调试模式已启用！';
  @override
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? '调试模式已关闭！';
  @override
  String get alreadyEnabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? '调试模式已经启用了！';
  @override
  String get showPerformanceGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? '显示性能图表';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? '显示FPS图表';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '显示图片统计';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '显示视频统计';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '模糊图片+静音视频 [开发者专用]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ?? '在列表中启用拖动 [仅限桌面模式]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? '动画速度 （${speed}）';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? '标签管理器';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? '分辨率：${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? '像素比率: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? '日志记录';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? '删除所有Cookies';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? '清除加密存储';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? '获取session字符串';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? '设置session字符串';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Session字符串';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? '从字符串中恢复了session';
}

// Path: settings.logging
class _Translations$settings$logging$zh_CN extends Translations$settings$logging$en {
  _Translations$settings$logging$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? '日志记录';
}

// Path: settings.webview
class _Translations$settings$webview$zh_CN extends Translations$settings$webview$en {
  _Translations$settings$webview$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? '打开网页浏览';
  @override
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? '用于登录或获取cookies';
}

// Path: settings.dirPicker
class _Translations$settings$dirPicker$zh_CN extends Translations$settings$dirPicker$en {
  _Translations$settings$dirPicker$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? '目录名称';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? '选择一个目录';
  @override
  String get closeWithoutChoosing => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? '未选择目录，确定要关闭选择器吗？';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? '否';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? '是';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? '错误！';
  @override
  String get failedToCreateDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? '新建文件夹失败';
  @override
  String get directoryNotWritable => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? '目录不可写！';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '新文件夹';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '创建';
}

// Path: viewer.tutorial
class _Translations$viewer$tutorial$zh_CN extends Translations$viewer$tutorial$en {
  _Translations$viewer$tutorial$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '图像';
  @override
  String get tapLongTapToggleImmersive => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? '点击/长按：切换沉浸模式';
  @override
  String get doubleTapFitScreen => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? '双击：适应屏幕/原始大小/重置缩放';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$zh_CN extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? '无法开始幻灯片';
  @override
  String get reachedLastLoadedItem => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '已到达最后一个已加载的项目';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '暂停';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '开始';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? '取消收藏';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '取消选择';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? '在缩放下重新加载';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? '加载预览质量';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '加载高质量';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? '移除下载状态';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? '设置下载状态';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? '下载';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '（强制）';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus分享';
  @override
  String get whichUrlToShareToHydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? '你想分享哪一个链接到Hydrus？';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '帖子链接';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? '文件链接';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? '尚未配置Hydrus!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? '分享文件';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ?? '要分享的文件已经开始下载了，要取消吗？';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ?? '已经有要分享的文件正在下载了，是否取消当前的下载并分享新文件？';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '当前的：';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '新的：';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '分享新文件';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? '取消';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? '错误！';
  @override
  String get savingFileError => TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? '在下载需要分享的文件时出现了错误';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '您想要分享什么？';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '带标签的帖子链接';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? '带标签的文件链接';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? '文件';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? '带标签的文件';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? '选择的标签';
}

// Path: viewer.notes
class _Translations$viewer$notes$zh_CN extends Translations$viewer$notes$en {
  _Translations$viewer$notes$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? '笔记';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? '笔记';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _Translations$media$loading$zh_CN extends Translations$media$loading$en {
  _Translations$media$loading$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? '渲染中…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? '正在从缓存中加载和渲染…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? '正在从缓存中加载…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? '正在缓冲…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '正在加载…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? '仍然加载';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '重新加载';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '停止加载';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '开始于 ${seconds} 秒前';
  @override
  late final _Translations$media$loading$stopReasons$zh_CN stopReasons = _Translations$media$loading$stopReasons$zh_CN._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? '文件大小为零';
  @override
  String fileSize({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? '文件大小：${size}';
  @override
  String sizeLimit({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? '限制：${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ?? '总是遇到播放问题？试着调一下[设置>视频>播放后端]';
}

// Path: media.video
class _Translations$media$video$zh_CN extends Translations$media$video$en {
  _Translations$media$video$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '视频播放已禁用或不支持';
  @override
  String get openVideoInExternalPlayer => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '在外部播放器中打开视频';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '在浏览器中打开视频';
  @override
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? '加载项目数据失败';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? '正在加载项目数据…';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '重试';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? '在浏览器中打开文件';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '在浏览器中打开帖子';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '当前正检查：';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ?? '未知的文件格式 (.${fileExt})，点此在浏览器中打开';
}

// Path: preview.error
class _Translations$preview$error$zh_CN extends Translations$preview$error$en {
  _Translations$preview$error$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '无结果';
  @override
  String get noResultsSubtitle => TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? '改变搜索关键词或点击重试';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '已经翻到最后啦';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ?? '已加载页数: ${pageNum}\n点此重新加载最后一页';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? '正在加载第 ${pageNum} 页…';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        seconds,
        one: '在 ${seconds} 秒前开始',
        few: '在 ${seconds} 秒前开始',
        many: '在 ${seconds} 秒前开始',
        other: '在 ${seconds} 秒前开始',
      );
  @override
  String get tapToRetryIfStuck => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? '如果感觉卡住了或者太慢可以点击重试';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? '加载第 ${pageNum} 页时出错';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? '点此重试';
  @override
  String get errorNoResultsLoaded => TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? '错误，没有加载结果';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? '点此重试';
}

// Path: settings.interface.previewQualityValues
class _Translations$settings$interface$previewQualityValues$zh_CN extends Translations$settings$interface$previewQualityValues$en {
  _Translations$settings$interface$previewQualityValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? '缩略图';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? '预览';
}

// Path: settings.interface.previewDisplayModeValues
class _Translations$settings$interface$previewDisplayModeValues$zh_CN extends Translations$settings$interface$previewDisplayModeValues$en {
  _Translations$settings$interface$previewDisplayModeValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? '方形';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? '长方形';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? '交错的';
}

// Path: settings.interface.appModeValues
class _Translations$settings$interface$appModeValues$zh_CN extends Translations$settings$interface$appModeValues$en {
  _Translations$settings$interface$appModeValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? '桌面模式';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? '移动模式';
}

// Path: settings.interface.handSideValues
class _Translations$settings$interface$handSideValues$zh_CN extends Translations$settings$interface$handSideValues$en {
  _Translations$settings$interface$handSideValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? '左手';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? '右手';
}

// Path: settings.viewer.imageQualityValues
class _Translations$settings$viewer$imageQualityValues$zh_CN extends Translations$settings$viewer$imageQualityValues$en {
  _Translations$settings$viewer$imageQualityValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? '预览';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? '原图';
}

// Path: settings.viewer.scrollDirectionValues
class _Translations$settings$viewer$scrollDirectionValues$zh_CN extends Translations$settings$viewer$scrollDirectionValues$en {
  _Translations$settings$viewer$scrollDirectionValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? '横向';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? '竖向';
}

// Path: settings.viewer.toolbarPositionValues
class _Translations$settings$viewer$toolbarPositionValues$zh_CN extends Translations$settings$viewer$toolbarPositionValues$en {
  _Translations$settings$viewer$toolbarPositionValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? '顶部';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? '底部';
}

// Path: settings.viewer.buttonPositionValues
class _Translations$settings$viewer$buttonPositionValues$zh_CN extends Translations$settings$viewer$buttonPositionValues$en {
  _Translations$settings$viewer$buttonPositionValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? '隐藏';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? '左';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? '右';
}

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$zh_CN extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? '询问';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? '帖子链接';
  @override
  String get postUrlWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? '带标签的帖子链接';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? '文件链接';
  @override
  String get fileUrlWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? '带标签的文件链接';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? '文件';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? '带标签的文件';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _Translations$settings$video$cacheModes$zh_CN extends Translations$settings$video$cacheModes$en {
  _Translations$settings$video$cacheModes$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? '视频缓存模式';
  @override
  String get streamMode => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ?? '- 流式 - 不缓存，边加载边播放';
  @override
  String get cacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ?? '- 缓存 - 将视频保存到设备上，下载完成才播放';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ?? '- 流式+缓存 - 两者的结合，目前会导致视频被加载两次';
  @override
  String get cacheNote => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ?? '[注意]：只有在\'缓存媒体\'启用时，视频才会被缓存。';
  @override
  String get desktopWarning => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ?? '[警告]：在桌面模式下某些网站不支持流式加载。';
}

// Path: settings.video.cacheModeValues
class _Translations$settings$video$cacheModeValues$zh_CN extends Translations$settings$video$cacheModeValues$en {
  _Translations$settings$video$cacheModeValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? '流式';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? '缓存';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? '流式+缓存';
}

// Path: settings.video.videoBackendModeValues
class _Translations$settings$video$videoBackendModeValues$zh_CN extends Translations$settings$video$videoBackendModeValues$en {
  _Translations$settings$video$videoBackendModeValues$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? '默认';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _Translations$media$loading$stopReasons$zh_CN extends Translations$media$loading$stopReasons$en {
  _Translations$media$loading$stopReasons$zh_CN._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? '被用户停止';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? '加载错误';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? '文件过大';
  @override
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? '被过滤器隐藏：';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? '视频错误';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'zh-CN',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '简体中文',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '萝莉猎手',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '错误',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '错误！',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '成功',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '成功！',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '取消',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? '返回',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '稍后',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '关闭',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '好的',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '是的',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '不',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '请稍等一会…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '显示',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '隐藏',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '启用',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '禁用',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '添加',
          'exclude' => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? '排除',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '编辑',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '移除',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '保存',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '删除',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '确认',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '重试',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '清除',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '复制',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '已复制',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '已复制到剪贴板',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '未找到任何内容',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '粘贴',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '复制错误',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '前往设置',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '这可能需要一些时间…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '退出应用？',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '关闭应用',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '无效的链接！',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '剪贴板为空！',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '打开链接失败',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API 密钥',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '用户ID',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '登录',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '密码',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '暂停',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '恢复',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '访问我们的 Discord 服务器',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '项目',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '选择',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '选择全部',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '重置',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '打开',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '打开新标签页',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移动',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '随机排序',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '排序',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '前往',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '搜索',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '过滤',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '或者（~）',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '页',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '页#',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '标签',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? '类型',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '名称',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '地址',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '用户名称',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? '收藏夹',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? '下载',
          'secondsShort' => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? '秒',
          'minutesShort' => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? '分',
          'hoursShort' => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? '时',
          'daysShort' => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? '天',
          'leaveThisPageQuestion' => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? '要离开此页面吗？',
          'pageWillCloseAutomatically' => TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? '此页面即将自动关闭',
          'stay' => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? '留下',
          'leaveNow' => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? '立刻离开',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '请输入一个值',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '请输入有效值',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '请输入一个数字',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '请输入一个有效的数字值',
          'validationErrors.tooSmall' =>
            ({required double min}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '请输入大于 ${min} 的值',
          'validationErrors.tooBig' =>
            ({required double max}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '请输入小于 ${max} 的值',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '请输入一个介于 ${min} 和 ${max} 之间的值',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '请输入一个大于或等于0的数值',
          'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '请输入小于4的值',
          'validationErrors.biggerThan100' => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '请输入一个大于100的值',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '使用超过4列可能会影响性能',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '使用超过8列可能会影响性能',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '初始化错误！',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '正在设置代理…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '正在加载数据库…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '正在加载boorus…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '正在加载标签…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '正在恢复标签…',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '无法访问自定义存储目录',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? '请再次设置存储目录以授予应用访问权限',
          'permissions.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '当前路径：${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '设置目录',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? '此平台不可用',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '重置目录',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ?? '重置后，文件将保存到默认目录',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '请进行身份验证以使用该应用',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '未检测到生物识别硬件',
          'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '临时锁定',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '身份认证过程中出错：${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '已删除最后一个标签页',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '重置为默认标签',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '评级已更正',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                '在 ${booruType} 上，[rating:safe] 现在被替换为 [rating:general] 和 [rating:sensitive]',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ?? '评级已自动修正。请在以后的搜索中使用正确的评级',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '标签页已恢复',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '从上次会话中恢复了 ${count} 个标签页',
                  few: '从上次会话中恢复了 ${count} 个标签页',
                  many: '从上次会话中恢复了 ${count} 个标签页',
                  other: '从上次会话中恢复了 ${count} 个标签页',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '一些恢复的标签页中有未知的booru或损坏的字符。',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '它们被设置为默认值或被忽略。',
          'searchHandler.listOfBrokenTabs' => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '损坏的标签页列表：',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '标签页已合并',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '已添加 ${count} 个新标签页',
                  few: '添加了 ${count} 个新标签页',
                  many: '添加了 ${count} 个新标签页',
                  other: '添加了 ${count} 个新标签页',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '标签页已替换',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '接收了 ${count} 个标签页',
                  few: '接收了 ${count} 个标签页',
                  many: '接收了 ${count} 个标签页',
                  other: '接收了 ${count} 个标签页',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '下载器',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '下载记录',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '输入标签',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '数量',
          'snatcher.amountOfFilesToSnatch' => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '要下载的文件数量',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '间隔（毫秒）',
          'snatcher.delayBetweenEachDownload' => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '每次下载之间的间隔时间',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '开始下载',
          'snatcher.itemWasAlreadySnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '此项目之前已下载过',
          'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '项目下载失败',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '下载被取消',
          'snatcher.startingNextQueueItem' => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '开始下载下一项…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '项目已下载',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '已下载：${count} 个项目',
                  few: '已下载：${count} 个项目',
                  many: '已下载：${count} 个项目',
                  other: '已下载：${count} 个项目',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '${count} 个文件之前已下载过',
                  few: '${count} 个文件之前已下载过',
                  many: '${count} 个文件之前已下载过',
                  other: '${count} 个文件之前已下载过',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '${count} 个文件下载失败',
                  few: '${count} 个文件下载失败',
                  many: '${count} 个文件下载失败',
                  other: '${count} 个文件下载失败',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '已取消 ${count} 个文件下载',
                  few: '已取消 ${count} 个文件下载',
                  many: '已取消 ${count} 个文件下载',
                  other: '已取消 ${count} 个文件下载',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '正在下载图片',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '不要关闭应用！',
          'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '添加项目到下载队列',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '已添加 ${count} 个项目到下载队列',
                  few: '已添加 ${count} 个项目到下载队列',
                  many: '已添加 ${count} 个项目到下载队列',
                  other: '已添加 ${count} 个项目到下载队列',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '多站',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '多Booru站模式',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '需要有至少2个已配置好的Booru',
          'multibooru.selectSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '选择额外的booru：',
          'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '又名多Booru模式',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '要包含的次要Booru',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? '导入Hydrus时出现了错误',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ?? '您可能没有授予正确的API权限，可以在Review Services中编辑',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '给文件添加标签',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? '添加链接',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '标签页',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '在设置中添加Booru',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '选择一个Booru',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '次要Booru',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '新建标签页',
          'tabs.selectABooruOrLeaveEmpty' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '选择一个Booru或留空',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '添加位置',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '上一个标签页',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '下一个标签页',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '列表末尾',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '使用的查询',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '默认',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '当前',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '自定义',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '自定义查询',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[空白]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '添加次要Booru',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '保留次要Booru',
          'tabs.startFromCustomPageNumber' => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '从指定页数开始',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '切换到新标签页',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '添加',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '标签页管理',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '选择模式',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '标签页排序',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '帮助',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '删除标签页',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '随机排序标签页',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '已随机排序标签页',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '已保存标签页顺序',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '滚动到当前标签页',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '滚动到顶部',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '滚动到底部',
          'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '按Booru,状态,重复过滤…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? '滚动：',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '排序：',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '默认标签页顺序',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '按字母排序',
          'tabs.sortAlphabeticallyReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '按字母排序（逆向）',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '按Booru名称排序',
          'tabs.sortByBooruNameReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '按Booru名称排序（逆向）',
          'tabs.longPressSortToSave' => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '长按排序按钮来保存当前的顺序',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '选择：',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '切换选择模式',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? '在页面底部： ',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '选择/反选所有标签页',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '删除已选标签页',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? '长按一个标签页来移动它',
          'tabs.numbersInBottomRight' => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? '标签页右下角数字的含义：',
          'tabs.firstNumberTabIndex' => TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '第一个数字 - 默认顺序下该标签页的序号',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ?? '第二个数字 - 当前排序下标签页的序号，在有过滤/排序规则时出现',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '特殊过滤：',
          'tabs.loadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '《已加载》 -  显示有已加载项目的标签页',
          'tabs.notLoadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«未加载» - 显示未加载或项目为空的标签页',
          'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '未加载的标签页名称为斜体',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? '找不到标签页',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? '复制',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '移动',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '移除',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? '随机排序',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '排序',
          'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? '是否要随机排序标签页？',
          'tabs.saveTabsInCurrentOrder' => TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? '是否要保存当前的标签页顺序？',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? '按Booru排序',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? '按名称排序',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '（反向）',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '确认要删除 ${count} 个标签页吗？',
                  few: '确认要删除 ${count} 个标签页吗？',
                  many: '确认要删除 ${count} 个标签页吗？',
                  other: '确认要删除 ${count} 个标签页吗？',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? '已加载',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? '标签类型',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? '多站',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '重复项',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '检查同一Booru下的重复项目',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '只显示无搜索的标签页',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? '标签页过滤',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? '所有',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '未加载',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '启用',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '禁用',
          'tabs.filters.willAlsoEnableSorting' => TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '会同时启用排序',
          'tabs.filters.tagTypeFilterHelp' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? '仅显示包含所选标签的标签页',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? '任意',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '应用',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '移动到顶部',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '移动到底部',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? '标签页编号',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '无效的标签页编号',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '无效的输入',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '超出范围',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '请输入一个有效的标签页编号',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '移动至 #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? '预览：',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '搜索历史',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '搜索历史是空的',
          'history.searchHistoryIsDisabled' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '已禁用搜索历史',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? '在设置中启用数据库以记录搜索历史',
          'history.lastSearch' =>
            ({required String search}) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '上次的搜索： ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '上次的搜索： ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '未知的Booru类型！',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '未知的Booru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '打开',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '在新标签页中打开',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? '从收藏中移除',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? '添加收藏',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? '复制',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '删除',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '删除历史记录',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '确定要删除 ${count} 个项目吗？',
                  few: '确定要删除 ${count} 个项目吗？',
                  many: '确定要删除 ${count} 个项目吗？',
                  other: '确定要删除 ${count} 个项目吗？',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '清除选择',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '删除 ${count} 个项目',
                  few: '删除 ${count} 个项目',
                  many: '删除 ${count} 个项目',
                  other: '删除 ${count} 个项目',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? '网页模式',
          'webview.notSupportedOnDevice' => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? '此设备上不支持',
          'webview.captcha' => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? '验证码',
          'webview.captchaCheckDescription' =>
            TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ?? '检测到可能有验证码，请通过验证码后返回',
          'webview.captchaCompleted' => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? '已通过验证码',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? '输入链接',
          'webview.navigation.enterCustomUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? '输入自定义链接',
          'webview.navigation.navigateTo' =>
            ({required String url}) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '前往 ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? '列出cookies',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? '清除cookies',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? '轻轻的Cookies走了，正如它轻轻的来。',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? '获取网站图标',
          'webview.navigation.noFaviconFound' => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? '未找到网站图标',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? '主机：',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '（上面的文字是可以选择的）',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? '复制链接',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? '已复制链接至剪贴板',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? '网站图标',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '历史记录',
          'webview.navigation.noBackHistoryItem' => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '当前已是最后页',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '当前已是最前页',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '设置',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '语言',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? '跟随系统',
          'settings.language.helpUsTranslate' => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '帮助我们翻译',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                '访问 <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>GitHub</a> 查看详情，或点击下面的图片前往POEditor',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & 搜索',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '默认标签',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '每页加载数量',
          'settings.booru.itemsPerPageTip' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '一些Booru站会忽略这个设置',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '添加Booru配置',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '分享Booru配置',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                '以链接的方式分享配置 ${booruName} .\n\n要包括登录信息/API密钥吗？',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                '复制 ${booruName} 的配置链接到剪贴板.\n\n要包括登录信息/API密钥吗？',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? '分享Booru',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                '在Android12以及更高版本中自动打开Booru配置链接：\n1) 点击下面的按钮打开系统的默认链接设置\n2) 点击《添加链接》并选择所有选项',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? '已添加的Booru',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? '编辑Booru配置',
          'settings.booru.importBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? '从剪贴板中导入Booru配置',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? '仅支持 loli.snatcher 的链接',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? '删除Booru配置',
          'settings.booru.deleteBooruError' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? '删除Booru配置时出现了错误！',
          'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '已删除Booru配置',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ?? '选择的Booru在保存后会设为默认。\n\n默认Booru在下拉菜单中第一个出现',
          'settings.booru.changeDefaultBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? '是否更换默认的Booru？',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? '更换成： ',
          'settings.booru.keepCurrentBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '点 [否] 维持当前设置: ',
          'settings.booru.changeToNewBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '点 [是] 更换成: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '已将Booru配置链接复制到剪贴板',
          'settings.booru.noBooruSelected' => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? '未选择Booru！',
          'settings.booru.cantDeleteThisBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? '无法删除此Booru！',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '请先删除相关的标签页',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru编辑器',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru测试失败',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? '配置参数不正确、Booru不允许API访问、返回为空或网络错误。',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? '保存Booru',
          'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? '正在测试…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? '已存在此Booru的配置',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? '存在同名的Booru配置',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? '存在相同链接的Booru配置',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? '此Booru配置不会被添加',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '已保存Booru配置',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ?? '刷新此站点的标签页以使更改生效！',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? '无法验证Hydrus的API访问权限',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? '已申请访问密钥',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ?? '在Hydrus中点击允许，然后再回来点击\'测试Booru\'。',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? '申请访问密钥失败',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? '在Hydrus中，您是否已经打开申请页面？',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                '获得Hydrus密钥需要您在Hydrus客户端中打开页面。Services > Review services > Client API > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? '获取Hydrus API密钥',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru名称',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? '必须填写Booru名称！',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru链接',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? '必须填写Booru链接！',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru类型',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '网站图标链接',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(留空自动填写)',
          'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? '默认标签',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? '对此Booru的默认搜索',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? '一些Booru需要填写以下条目',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? '确认保存Booru配置',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                '已选/检测到的Booru类型：${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? '界面',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? '应用界面模式',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? '应用界面模式',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ?? '要使用桌面模式吗？可能会在移动设备上出现问题。已弃用！',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- 移动设备 - 通常的移动设备界面',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ?? '- 桌面模式 - Ahoviewer 风格的界面 [已弃用，需要重做]',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[警告]: 不要在手机上把界面模式设置成桌面模式，可能会导致应用异常，使你不得不清空所有设置，包括Booru配置。',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '惯用手',
          'settings.interface.handSideHelp' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? '将界面元素的位置调整到相应的方向',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? '在图片预览界面显示搜索框',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '在搜索中将输入框移至顶部',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '搜索时显示快捷操作面板',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '搜索框自动获得焦点',
          'settings.interface.disableVibration' => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '禁用振动',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? '即使禁用了，某些操作可能依然会振动',
          'settings.interface.usePredictiveBack' => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? '预测性返回手势',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? '预览列数（竖屏）',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? '预览列数（横屏）',
          'settings.interface.previewQuality' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? '预览质量',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? '改变预览窗格中图片的分辨率',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ?? ' -预览- 中等画质，在等待图片加载时应用会先显示缩略图',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' -缩略图- 低画质',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ?? '[注意]: 预览画质可能会影响性能，尤其是在列数过多的情况下',
          'settings.interface.previewDisplay' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? '预览显示方式',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? '备用的显示方式',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ?? '当交错选项不可用时，会改用此选项',
          'settings.interface.dontScaleImages' => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '禁用图片缩放',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? '可能会降低性能',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '警告',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? '确定要禁用图片缩放吗？',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ?? '这样会影响性能，尤其是在旧的设备上',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF缩略图',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '需要启用《禁用图片缩放》',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? '滚动预览按钮的位置',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? '鼠标滚轮滚动倍率',
          'settings.interface.scrollModifier' => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? '滚动倍率',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? '缩略图',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? '预览',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? '方形',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? '长方形',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? '交错的',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? '桌面模式',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? '移动模式',
          'settings.interface.handSideValues.left' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? '左手',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? '右手',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? '主题',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? '主题模式',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '黑色背景',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? '使用动态颜色',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? '仅适用于Android12及以上',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? '主题',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? '主要颜色',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? '次要颜色',
          'settings.theme.enableDrawerMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? '侧边栏吉祥物',
          'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? '自定义吉祥物',
          'settings.theme.removeCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? '移除自定义吉祥物',
          'settings.theme.currentMascotPath' => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '当前吉祥物路径',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? '跟随系统',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? '亮色',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? '暗色',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? '粉色',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? '紫色',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? '蓝色',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '青色',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? '红色',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? '绿色',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? '万圣节',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? '自定义',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '选择颜色',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '已选颜色',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '已选定的颜色和阴影',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? '字体',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? '系统默认',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? '查看更多字体',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? '这里是字体预览 苟利国家生死以 ABCDEFG',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? '自定义字体',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? '输入字体在Google Font上的名称',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? '字体名称',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? '在 fonts.google.com 查找字体',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? '找不到此字体',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? '查看器',
          'settings.viewer.preloadAmount' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? '预加载数量',
          'settings.viewer.preloadSizeLimit' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? '预加载大小限制',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '单位为GB，0为不限制',
          'settings.viewer.preloadHeightLimit' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? '预加载高度限制',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? '单位是像素，0为不限制',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '图像质量',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? '查看器滚动方向',
          'settings.viewer.viewerToolbarPosition' => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? '工具栏位置',
          'settings.viewer.zoomButtonPosition' => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? '缩放按钮位置',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? '翻页按钮位置',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? '打开查看器时隐藏工具栏',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? '自动展开详情',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '自动隐藏翻译笔记',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '允许旋转',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? '双击重置旋转',
          'settings.viewer.toolbarButtonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? '工具栏按钮顺序',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? '按钮顺序',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '长按改变顺序。',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ?? '在工具栏中至少要有4个按钮保持可见。',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ?? '其他按钮会被收纳在展开(三点)菜单中。',
          'settings.viewer.longPressToMoveItems' => TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '长按移动项目',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '仅限视频',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? '不可以隐藏这个按钮',
          'settings.viewer.defaultShareAction' => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? '默认分享行为',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '分享行为',
          'settings.viewer.shareActionsAsk' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- 询问 - 始终询问分享什么',
          'settings.viewer.shareActionsPostURL' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- 帖子链接',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ?? '- 文件链接 - 分享原文件的直链（可能有一些网站不支持）',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- 带标签的 帖子链接/文件链接/文件 - 分享链接/文件和你选定的标签',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ?? '- 文件 - 分享文件本身，可能需要一些时间加载，加载进度会显示在分享按钮上',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - 将帖子的链接导入至Hydrus',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[注意]：如果缓存中有这个文件，就会从缓存中分享。如果没有就要再次从网络中加载。',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ?? '[提示]：长按分享按钮可以打开分享选项菜单。',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '用音量键滚动',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '音量键滚动',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ?? '在预览界面和查看器中使用音量键滚动',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - 音量减 - 下一项',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - 音量加 - 上一项',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? '在查看器中：',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' -工具栏显示时- 音量键控制音量',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' -工具栏隐藏时- 音量键控制翻页',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? '音量键滚动速度',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? '幻灯片时间（毫秒）',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? '幻灯片',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[开发中] 视频/GIF：仅手动翻页',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? '阻止自动锁屏',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? '查看器打开/关闭动画',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? '查看器翻页动画',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? '使用默认动画',
          'settings.viewer.usingCustomAnimation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? '使用自定义动画',
          'settings.viewer.kannaLoadingGif' => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '加载时康娜动图',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? '预览',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? '原图',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? '横向',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? '竖向',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? '顶部',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? '底部',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? '隐藏',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? '左',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? '右',
          'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? '询问',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? '帖子链接',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? '带标签的帖子链接',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? '文件链接',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? '带标签的文件链接',
          'settings.viewer.shareActionValues.file' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? '文件',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? '带标签的文件',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '视频',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '不播放视频',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ?? '针对低端设备播放视频崩溃的问题。提供在外部播放器或浏览器中播放的选项。',
          'settings.video.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '自动播放视频',
          'settings.video.startVideosMuted' => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '播放时静音',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[实验性]',
          'settings.video.videoPlayerBackend' => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? '视频播放后端',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? '默认',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ?? '基于 exoplayer. 设备兼容性最好，在播放4K时、某些视频编码或旧设备上可能会有问题',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ?? '基于 libmpv， 包含进阶选项，或许有助于解决一些视频编码/设备上的问题\n[可能会崩溃]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ?? '基于 libmdk,  在一些视频编码/设备上可能有更好的性能\n[可能会崩溃]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ?? '如果出现视频播放异常或者解码器错误，可以试一试将\'MPV\'设置调整到不同的选项：',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV：使用硬件加速',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV：视频输出',
          _ => null,
        } ??
        switch (path) {
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV：硬解模式',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? '视频缓存模式',
          'settings.video.cacheModes.title' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? '视频缓存模式',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ?? '- 流式 - 不缓存，边加载边播放',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ?? '- 缓存 - 将视频保存到设备上，下载完成才播放',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ?? '- 流式+缓存 - 两者的结合，目前会导致视频被加载两次',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ?? '[注意]：只有在\'缓存媒体\'启用时，视频才会被缓存。',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ?? '[警告]：在桌面模式下某些网站不支持流式加载。',
          'settings.video.cacheModeValues.stream' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? '流式',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? '缓存',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? '流式+缓存',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? '默认',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? '从队列中的下一个项目开始',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ?? '下载文件需要授予存储权限',
          'settings.downloads.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? '未选择项目',
          'settings.downloads.noItemsQueued' => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? '队列中没有项目',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? '批',
          'settings.downloads.snatchSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '下载已选项',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? '从已选项中清除下载状态',
          'settings.downloads.favouriteSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '收藏已选项',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '取消收藏已选项',
          'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '清除已选',
          'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? '正在升级数据…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? '数据库',
          'settings.database.indexingDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? '正在索引数据库',
          'settings.database.droppingIndexes' => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? '正在清除索引',
          'settings.database.enableDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? '启用数据库',
          'settings.database.enableIndexing' => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? '启用索引',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '启用搜索记录',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? '启用标签类型获取',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '需要更新的Sankaku类型',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '搜索查询',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '（可选，可能会导致过程变慢）',
          'settings.database.cantLeavePageNow' => TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '现在不可以离开页面！',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ?? '正在升级Sankaku数据，请等待完成或者在页面底部手动取消',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? '请稍等！',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? '正在变更索引',
          'settings.database.databaseInfo' => TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? '用于保存收藏和记录下载',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? '不会重新下载已下载过的项目',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ?? '加速数据库中的搜索，但是会增加存储占用（可高达2倍）。\n\n索引时请勿离开页面或退出应用。',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? '创建索引[调试]',
          'settings.database.dropIndexesDebug' => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? '清除索引[调试]',
          'settings.database.searchHistoryInfo' => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? '需要启用数据库。',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? '会保存上 ${limit} 次搜索',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? '点击记录可进行操作（删除，收藏…）',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ?? '收藏的搜索关键词会被置顶，不计入总数量限制。',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? '从支持的Booru中获取标签类型',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? '可能会触发访问限速',
          'settings.database.deleteDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? '删除数据库',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? '确认删除数据库吗？',
          'settings.database.databaseDeleted' => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? '数据库已删除！',
          'settings.database.appRestartRequired' => TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? '需要重启应用！',
          'settings.database.clearSnatchedItems' => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? '清除已下载记录',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? '确认要清除已下载的记录吗？',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? '下载记录已清除',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? '可能需要重启应用！',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? '清除收藏的项目',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? '确认要清除收藏的项目吗？',
          'settings.database.favouritesCleared' => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? '已清除收藏',
          'settings.database.clearSearchHistory' => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '清除搜索记录',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '确认清除搜索记录吗？',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '已清除搜索记录',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? '更新Sankaku收藏',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? '已开始更新Sankaku收藏',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ?? '正在为您收藏中的Sankaku项目获取新的图片链接',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ?? '请不要在进度完成或停止前离开此页面',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? '未找到Sankaku配置！',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku收藏更新完成',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '已开始清除失败条目',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ?? '更新失败的项目将会从数据库中移除',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? '更新Sankaku链接',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '正在更新 ${count} 个项目：',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '剩余：${count}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '已完成：${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '失败/已跳过：${count}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                '如果您看到\'失败\'的数量一直在增长，请稍后再尝试，这可能是触发了速率限制或您的IP被Sankaku屏蔽。',
          'settings.database.skipCurrentItem' => TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '点这里跳过当前项目',
          'settings.database.useIfStuck' => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? '在看起来卡住时使用',
          'settings.database.pressToStop' => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? '点这里停止',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '清除失败的条目（${count} 个）',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '重试失败的条目（${count} 个）',
          'settings.backupAndRestore.title' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? '备份&恢复',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '检测到重名的文件！',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                '文件 ${fileName} 已存在。是否要覆盖它？如果选择了否，将取消当前的备份。',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                '此功能仅限Android，在电脑版本里，您可以直接复制粘贴应用的数据文件到系统相应的位置中',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? '选择备份目录',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '获取备份目录失败',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                '备份目录为：${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? '未选择备份目录',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? '文件必须位于根目录下',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '备份设置',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '恢复设置',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '设置已备份至settings.json',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '已从备份恢复设置',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '备份设置失败',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '恢复设置失败',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? '重置备份目录',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '备份Booru (图站)',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '恢复Booru',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru已备份至boorus.json',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '已从备份中恢复Booru',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '备份Booru失败',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '恢复Booru失败',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '备份数据库',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '恢复数据库',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ?? '根据数据库大小，可能会需要一段时间，备份成功时将重启应用',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? '数据库已备份至store.db',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ?? '已从备份中恢复数据库！应用将在几秒后重启！',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '备份数据库失败',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '恢复数据库失败',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? '找不到数据库或数据库不可读！',
          'settings.backupAndRestore.backupTags' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '备份标签',
          'settings.backupAndRestore.restoreTags' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '恢复标签',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                '如果保存的标签很多，将会需要一段时间。如果您已恢复过数据库，不必再使用本功能，标签包含在数据库中',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '标签已备份至tags.json',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '已从备份中恢复标签',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '备份标签失败',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '恢复标签失败',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? '未找到标签文件或文件不可读！',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ?? '如果等了很久，可以点击下面的隐藏，操作将在后台继续',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? '未找到备份文件或文件不可读！',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? '无权访问备份目录！',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '备份已取消',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '网络',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? '允许自签名的SSL证书',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? '代理',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ?? '流式传输的视频不会走代理，如有需要请切换到缓存模式',
          'settings.network.customUserAgent' => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? '自定义User-Agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? '自定义User-Agent',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? '留空以使用默认值',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? '默认值：${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? '用于大多数Booru请求和网页浏览',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? '在退出页面时保存',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                '点这里设置为Chrome的User-Agent（只推荐在网站屏蔽非浏览器User-Agent时使用）',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie清理器',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ?? '选择一个要清理Cookie的Booru，或留空清理所有的',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} 的Cookies:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '已删除Cookie «${cookieName}»',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? '清除Cookies',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? '清除${booruName}的Cookies',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                '已清除${booruName} 的Cookies',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? '已清除所有Cookies',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? '隐私',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? '应用锁',
          'settings.privacy.appLockMsg' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ?? '手动或一段时间后锁定应用。需要PIN/生物验证',
          'settings.privacy.autoLockAfter' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? '自动锁定计时',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '单位是秒，设置成0不自动锁定',
          'settings.privacy.bluronLeave' => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? '离开应用时模糊界面',
          'settings.privacy.bluronLeaveMsg' => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? '由于系统限制，可能在某些设备上无效',
          'settings.privacy.incognitoKeyboard' => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? '无痕键盘',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ?? '阻止输入法记录输入历史。\n大部分输入框都生效',
          'settings.privacy.appDisplayName' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? '应用显示名称',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? '改变应用在桌面上显示的名称',
          'settings.privacy.appAliasChanged' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? '已修改应用名称',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ?? '新的应用名称在重启应用后生效。一部分桌面可能要等一段时间或者系统重启后才会改变。',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? '改变应用名称失败。请再试一次。',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? '立即重启',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? '性能',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '低性能模式',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ?? '推荐在旧设备和低内存机型上开启',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '低性能模式',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ?? '- 禁用详细的加载进度信息',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- 禁用高消耗元素（模糊效果、动画透明度、部分动画…）',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ?? '为以下选项套用最优设置（您可以在稍后单独自行更改）：',
          'settings.performance.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '自动播放视频',
          'settings.performance.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '禁止播放视频',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ?? '针对低端设备播放视频崩溃的问题。提供在外部播放器或浏览器中播放的选项。',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '下载&缓存',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? '下载质量',
          'settings.cache.snatchCooldown' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? '下载间隔（毫秒）',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '请输入一个有效的时间值',
          'settings.cache.biggerThan10' => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '请输入大于10ms的值',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? '显示下载通知',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? '收藏时下载该项目',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? '下载时收藏该项目',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '下载时保存图像信息到同名JSON文件',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? '需要自定义目录',
          'settings.cache.setStorageDirectory' => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? '设置存储目录',
          'settings.cache.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '当前：${path}',
          'settings.cache.resetStorageDirectory' => TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? '重置存储目录',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? '缓存预览图',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? '缓存媒体',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? '视频缓存模式',
          'settings.cache.videoCacheModesTitle' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? '视频缓存模式',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ?? '- 流式 - 不缓存，边加载边播放',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ?? '- 缓存 - 将视频保存到设备上，下载完成才播放',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ?? '- 流式+缓存 - 两者的结合，目前会导致视频被加载两次',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ?? '[注意]：只有在\'缓存媒体\'启用时，视频才会被缓存。',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ?? '[警告]：在桌面模式下某些网站不支持流式加载。',
          'settings.cache.deleteCacheAfter' => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? '缓存保留时间：',
          'settings.cache.cacheSizeLimit' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? '缓存体积限制（GB）',
          'settings.cache.maximumTotalCacheSize' => TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '总缓存上限',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? '缓存统计：',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '加载中…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '空的',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} 个文件',
          'settings.cache.inFileSingular' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1个文件',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '总计',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? '网站图标',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? '缩略图',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? '预览图',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? '媒体',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? '网页缓存',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? '已清除缓存',
          'settings.cache.clearedCacheType' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '已清除${type}缓存',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? '清除所有缓存',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? '已完成缓存清除',
          'settings.cache.appRestartRequired' => TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? '可能要重启应用！',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? '出错了！',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '目前不支持此平台',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? '过滤',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? '隐藏',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? '标记',
          'settings.itemFilters.duplicateFilter' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? '重复的过滤器',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' 已存在与 ${type} 列表中',
          'settings.itemFilters.noFiltersFound' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? '未找到过滤器',
          'settings.itemFilters.noFiltersAdded' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? '未添加过滤器',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? '当符合隐藏过滤器时完全隐藏该项目',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? '当符合标记过滤器时完全隐藏该项目',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? '隐藏已收藏的项目',
          'settings.itemFilters.removeSnatched' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? '隐藏已下载的项目',
          'settings.itemFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? '隐藏AI生成的项目',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sync',
          'settings.sync.dbError' => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? '使用Sync必须启用数据库',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? '错误！',
          'settings.sync.pleaseEnterIPAndPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? '请输入IP地址和端口。',
          'settings.sync.selectWhatYouWantToDo' => TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '选择你想做的事',
          'settings.sync.sendDataToDevice' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '发送数据到另一台设备',
          'settings.sync.receiveDataFromDevice' => TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '从其他设备接受数据',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ?? '在另一台设备上启动服务器，输入它的IP/端口，然后点击开始同步',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP地址',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? '主机IP地址（如192.168.1.1）',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? '端口',
          'settings.sync.portPlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? '主机端口（如7777）',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? '发送收藏',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? '收藏数： ${count}',
          'settings.sync.sendFavouritesLegacy' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? '发送收藏（旧版）',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '从 #… 同步收藏',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ?? '允许设置同步的起始位置，适用于您之前已经同步了所有的收藏，现在只想同步最新项目的情况',
          'settings.sync.syncFavsFromHelpText2' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? '如需从头同步请留空',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ?? '举例：您有X个收藏，将此选项设置为100，会同步从#100到X的项目',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? '收藏顺序：从最旧 (0) 到最新 (X)',
          'settings.sync.sendSnatchedHistory' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? '发送下载记录',
          'settings.sync.snatchedCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? '已下载：${count}',
          'settings.sync.syncSnatchedFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '从#…开始同步下载',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ?? '允许设置同步的起始位置，适用于您之前已经同步了所有的下载记录，现在只想同步最新项目的情况',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ?? '如需从头同步请留空',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ?? '举例：您有X条下载记录，将此选项设置为100，会同步从#100到X的项目',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? '下载记录顺序：从最旧 (0) 到最新 (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '发送设置',
          'settings.sync.sendBooruConfigs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? '发送Booru配置',
          'settings.sync.configsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '配置数量：${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? '发送标签页',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? '标签页数量：${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? '标签页同步模式',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? '合并：将此设备上的标签页合并到另一台设备上，已存在的和包含未知Booru的标签页将被忽略',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ?? '替换：将另一台设备上的所有标签页完全替换为这台设备上的标签页',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '合并',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '替换',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? '发送标签',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? '标签数：${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? '标签同步模式',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ?? '保留类型：如果标签类型已存在于其他设备上，但在此设备上不存在，则会跳过该标签',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ?? '覆盖：将会添加所有的标签，另一设备上已存在的标签和标签类型将被覆盖',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? '保留类型',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '覆盖',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '测试连接',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? '向另一台设备发送测试请求。',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? '成功/失败时会显示通知。',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? '开始同步',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? '端口和IP不能为空！',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '没有选择要同步的项目！',
          'settings.sync.statsOfThisDevice' => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? '此设备上的统计：',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ?? '启用一个接受数据的服务器。为了安全请不要在公共WiFi中使用',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '可用的网络接口',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) => TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '已选择的接口IP: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? '服务器端口',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '（如果留空会默认设置为8080）',
          'settings.sync.startReceiverServer' => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? '启动接收端服务器',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? '关于',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                'LoliSnatcher（萝莉猎手） 为开源软件，采用 GPLv3 许可协议，源代码可在 GitHub 上获取。如有任何问题或功能请求，请在代码仓库的 issues 区域提交。',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher的GitHub页面',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? '联系方式',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '已复制电子邮件地址到剪贴板',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ?? '非常感谢Showers-U允许我们使用其作品作为应用图标。欢迎前往Pixiv关注作者',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '开发者',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? '翻译者',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? '发布页',
          'settings.about.releasesMsg' => TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ?? '最新版本和完整的更新说明在GitHub发布页上：',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? '许可证',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? '检查更新',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? '有更新！',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? '新版本介绍',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? '更新说明',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? '检查更新失败！',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '您已是最新版',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '查看最新的更新说明',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '当前版本',
          'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '更新说明',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? '访问Play商店',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '访问发布页',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? '日志',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? '分享日志',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? '分享日志到外部应用吗？',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ?? '[注意]：日志可能包含敏感信息，请谨慎分享！',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? '帮助',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? '调试',
          'settings.debug.enabledSnackbarMsg' => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? '调试模式已启用！',
          'settings.debug.disabledSnackbarMsg' => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? '调试模式已关闭！',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? '调试模式已经启用了！',
          'settings.debug.showPerformanceGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? '显示性能图表',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? '显示FPS图表',
          'settings.debug.showImageStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '显示图片统计',
          'settings.debug.showVideoStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '显示视频统计',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '模糊图片+静音视频 [开发者专用]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ?? '在列表中启用拖动 [仅限桌面模式]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? '动画速度 （${speed}）',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? '标签管理器',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? '分辨率：${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) => TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? '像素比率: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? '日志记录',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? '删除所有Cookies',
          'settings.debug.clearSecureStorage' => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? '清除加密存储',
          'settings.debug.getSessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? '获取session字符串',
          'settings.debug.setSessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? '设置session字符串',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Session字符串',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? '从字符串中恢复了session',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? '日志记录',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? '打开网页浏览',
          'settings.webview.openWebviewTip' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? '用于登录或获取cookies',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? '目录名称',
          'settings.dirPicker.selectADirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? '选择一个目录',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? '未选择目录，确定要关闭选择器吗？',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? '否',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? '是',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? '错误！',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? '新建文件夹失败',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? '目录不可写！',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '新文件夹',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '创建',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '版本',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? '评论',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? '没有评论',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? '此Booru站点不支持评论或没有对应的API',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? '翻页器',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? '页数',
          'pageChanger.delayBetweenLoadings' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '加载间隔（毫秒）',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '毫秒',
          'pageChanger.currentPage' =>
            ({required int number}) => TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '当前页#${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '可能的最高页数 #~${number}',
          'pageChanger.searchCurrentlyRunning' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '有搜索正在运行!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '跳转至页数',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '一直搜到页数',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '停止搜索',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '输入为空！',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[添加了新的 ${type} 过滤器]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '新的 ${type} 标签过滤器',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '新过滤器',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? '编辑过滤器',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? '标签',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? '添加标签',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '名称',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? '类型',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '添加',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '在 ${staleText} 后过期',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? '已添加标签页',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? '添加标签页',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? '复制',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? '设置为过期',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '重置过期时间',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? '设置为永不过期',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '删除 ${count} 个标签',
                  few: '删除 ${count} 个标签',
                  many: '删除 ${count} 个标签',
                  other: '删除 ${count} 个标签',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? '删除标签',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '清除选择',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? '点击认证',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ?? '[仅供测试]：若通常方式解锁都失败请点此处。并将您设备的详细情况报告给开发者。',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '要停止同步吗？',
          'loliSync.stopServerQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? '要停止服务器吗？',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '无连接',
          'loliSync.waitingForConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '等待连接…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? '正在启动服务器…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? '屏幕常亮',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? '已结束LoliSync服务器',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                '测试失败: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? '测试失败: ${error}',
          'loliSync.testSuccess' => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? '测试请求返回了积极的回应',
          'loliSync.testSuccessMessage' => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '另一台设备上应该有一条\'Test\'信息',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '图像搜索',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? '标签',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? '评论',
          'tagView.showNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? '显示笔记 (${count})',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? '隐藏笔记 (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? '加载笔记',
          'tagView.thisTagAlreadyInSearch' => TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? '当前搜索中已包含此标签：',
          'tagView.addedToCurrentSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '已添加至当前搜索：',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '已添加至新标签页：',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '帖子链接',
          'tagView.uploader' => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? '上传者',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '发布时间',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '详细信息',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? '文件名',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? '链接',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '扩展名',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '分辨率',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? '尺寸',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? '分级',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '评分',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? '未找到标签',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? '复制',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '从搜索中移除',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '添加到搜索',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '已添加到搜索框：',
          'tagView.excludeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? '从搜索中排除',
          'tagView.exclusionAddedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? '已添加排除项至搜索框：',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? '添加到已标记',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? '添加到隐藏',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? '从已标记中移除',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? '从隐藏中移除',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? '编辑标签',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? '来源',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? '预览',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '选择要加载的Booru',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? '正在加载预览…',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? '加载预览失败',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? '点击重试',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? '已复制文件链接至剪贴板',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? '标签预览',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '当前状态',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '历史记录',
          'tagView.failedToLoadPreviewPage' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? '加载预览页失败',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '重试',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? '检测到链接：',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? '相关的标签页',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? '只有此标签的标签页',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? '只有此标签的不同站点的标签页',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? '包含此标签的标签页',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? '固定的标签',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? '固定标签',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? '取消固定标签',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? '固定',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? '取消固定',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '将 «${tag}» 固定到快速访问吗？',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '将 «${tag}» 从快速访问移除吗？',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? '仅用于 ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? '标注（可选）',
          'pinnedTags.typeAndPressAdd' => TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? '输入后点击加号添加',
          'pinnedTags.selectExistingLabel' => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? '搜索已有标注',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? '已固定标签',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? '已固定在 ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? '已全局固定${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? '已取消固定标签',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? '所有',
          'pinnedTags.reorderPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? '重新排序固定的标签',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? '保存中…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? '重新排序',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? '手动添加标签',
          'pinnedTags.noTagsMatchSearch' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? '找不到您搜索的标签',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? '还没有固定的标签',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? '编辑标注',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? '标注',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? '添加固定的标签',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? '标签搜索',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name',
          'pinnedTags.rawQueryHelp' => TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? '可以搜索任何关键词，包括有空格的标签',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? '搜索标签',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? '无法加载搜索建议。点击重试${msg}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '没有搜索建议',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? '此Booru站点不支持搜索建议',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '复制了 «${tag}» 到剪贴板',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? '前缀',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '排除 (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? '元标签',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? '免费的元标签',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? '免费的元标签不计入标签搜索限制',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? '免费',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '单日',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '范围',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '人气',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '选择日期',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '选择日期范围',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '历史记录',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? '选择要在网页中打开的Booru',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? '锁定应用',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? '文件已存在',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? '下载失败',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? '被用户取消',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? '仍然保存',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? '跳过',
          'mobileHome.retryAll' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? '全部重试 (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '已存在，失败或取消的项目',
          'mobileHome.clearAllRetryableItems' => TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? '清除所有可重试的项目',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? '下载器',
          'desktopHome.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '在设置中添加Booru',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '设置',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '保存',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? '未选择项目',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? '没有项目',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? '未选择项目',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '关闭',
          'mediaPreviews.noBooruConfigsFound' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? '未找到Booru配置',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? '添加新Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? '帮助',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '设置',
          _ => null,
        } ??
        switch (path) {
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '正在恢复到之前的会话…',
          'mediaPreviews.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? '已复制文件链接到剪贴板！',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '图像',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? '点击/长按：切换沉浸模式',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? '双击：适应屏幕/原始大小/重置缩放',
          'viewer.appBar.cantStartSlideshow' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? '无法开始幻灯片',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '已到达最后一个已加载的项目',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '暂停',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '开始',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? '取消收藏',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '取消选择',
          'viewer.appBar.reloadWithScaling' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? '在缩放下重新加载',
          'viewer.appBar.loadSampleQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? '加载预览质量',
          'viewer.appBar.loadHighQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '加载高质量',
          'viewer.appBar.dropSnatchedStatus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? '移除下载状态',
          'viewer.appBar.setSnatchedStatus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? '设置下载状态',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? '下载',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '（强制）',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus分享',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? '你想分享哪一个链接到Hydrus？',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '帖子链接',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? '文件链接',
          'viewer.appBar.hydrusNotConfigured' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? '尚未配置Hydrus!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? '分享文件',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ?? '要分享的文件已经开始下载了，要取消吗？',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ?? '已经有要分享的文件正在下载了，是否取消当前的下载并分享新文件？',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '当前的：',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '新的：',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '分享新文件',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? '取消',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? '错误！',
          'viewer.appBar.savingFileError' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? '在下载需要分享的文件时出现了错误',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '您想要分享什么？',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '带标签的帖子链接',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? '带标签的文件链接',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? '文件',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? '带标签的文件',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? '选择的标签',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? '笔记',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? '笔记',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? '选择一个Booru',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru项目已复制到剪贴板',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? '下载吗？',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '没有帖子链接！',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? '正在加载文件',
          'gallery.loadingFileMessage' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? '可能需要一些时间，请稍等',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  count,
                  one: '来源',
                  few: '来源',
                  many: '来源',
                  other: '来源',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? '下载',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? '收藏',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? '信息',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? '分享',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? '选择',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? '在浏览器打开',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? '播放幻灯片',
          'galleryButtons.reloadNoScale' => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? '切换缩放',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? '切换质量',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? '外部播放器',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? '图片搜索',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? '渲染中…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? '正在从缓存中加载和渲染…',
          'media.loading.loadingFromCache' => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? '正在从缓存中加载…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? '正在缓冲…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '正在加载…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? '仍然加载',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '重新加载',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '停止加载',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '开始于 ${seconds} 秒前',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? '被用户停止',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? '加载错误',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? '文件过大',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? '被过滤器隐藏：',
          'media.loading.stopReasons.videoError' => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? '视频错误',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? '文件大小为零',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? '文件大小：${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? '限制：${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ?? '总是遇到播放问题？试着调一下[设置>视频>播放后端]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '视频播放已禁用或不支持',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '在外部播放器中打开视频',
          'media.video.openVideoInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '在浏览器中打开视频',
          'media.video.failedToLoadItemData' => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? '加载项目数据失败',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? '正在加载项目数据…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '重试',
          'media.video.openFileInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? '在浏览器中打开文件',
          'media.video.openPostInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '在浏览器中打开帖子',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '当前正检查：',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ?? '未知的文件格式 (.${fileExt})，点此在浏览器中打开',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? '就绪：${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '等待: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '总共: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? '内存: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '最大: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '无结果',
          'preview.error.noResultsSubtitle' => TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? '改变搜索关键词或点击重试',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '已经翻到最后啦',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ?? '已加载页数: ${pageNum}\n点此重新加载最后一页',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? '正在加载第 ${pageNum} 页…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
                  seconds,
                  one: '在 ${seconds} 秒前开始',
                  few: '在 ${seconds} 秒前开始',
                  many: '在 ${seconds} 秒前开始',
                  other: '在 ${seconds} 秒前开始',
                ),
          'preview.error.tapToRetryIfStuck' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? '如果感觉卡住了或者太慢可以点击重试',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? '加载第 ${pageNum} 页时出错',
          'preview.error.errorWithMessage' => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? '点此重试',
          'preview.error.errorNoResultsLoaded' => TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? '错误，没有加载结果',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? '点此重试',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? '艺术家',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? '角色',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? '版权',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? '元数据',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? '物种',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? '无/通常的',
          _ => null,
        };
  }
}
