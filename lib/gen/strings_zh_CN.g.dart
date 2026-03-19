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
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '请稍等一会.…';
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
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '清晰';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '复制';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '已复制';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '已复制到粘贴板';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '未找到任何内容';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '粘贴';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '复制错误';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '前往设置';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '这可能需要一些时间…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '退出应用？';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '关闭应用';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '无效 URL！';
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
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '简历';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '访问我们的 Discord 服务器';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '物品';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '选择';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '选择全部';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '重置';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '打开';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '打开新标签';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移动';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '随机播放';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '排序';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '去';
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
  late final _TranslationsValidationErrorsZhCn validationErrors = _TranslationsValidationErrorsZhCn._(_root);
  @override
  late final _TranslationsInitZhCn init = _TranslationsInitZhCn._(_root);
  @override
  late final _TranslationsPermissionsZhCn permissions = _TranslationsPermissionsZhCn._(_root);
  @override
  late final _TranslationsAuthenticationZhCn authentication = _TranslationsAuthenticationZhCn._(_root);
  @override
  late final _TranslationsSearchHandlerZhCn searchHandler = _TranslationsSearchHandlerZhCn._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsZhCn extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

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
class _TranslationsInitZhCn extends TranslationsInitEn {
  _TranslationsInitZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

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
class _TranslationsPermissionsZhCn extends TranslationsPermissionsEn {
  _TranslationsPermissionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

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
class _TranslationsAuthenticationZhCn extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

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
class _TranslationsSearchHandlerZhCn extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

  final TranslationsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '已删除最后一个标签';
  @override
  String get resettingSearchToDefaultTags => TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '重置为默认标签';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '评分已更改';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '在 ${booruType} 上，[rating:safe] 现在被替换为 [rating:general] 和 [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ?? '评分已自动修正。请在以后的搜索中使用正确的评分';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '标签已恢复';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '从上次会话恢复了 ${count} 个标签页',
        few: '从上次会话恢复了 ${count} 个标签页',
        many: '从上次会话恢复了 ${count} 个标签页',
        other: '从上次会话恢复了 ${count} 个标签页',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '一些恢复的标签有未知的booru或损坏的字符。';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '它们被设置为默认值或被忽略。';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '损坏标签列表：';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '标签已合并';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
        count,
        one: '已添加 ${count} 个新标签',
      );
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
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '请稍等一会.…',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '显示',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '隐藏',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '启用',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '禁用',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '添加',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '编辑',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '移除',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '保存',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '删除',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '确认',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '重试',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '清晰',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '复制',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '已复制',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '已复制到粘贴板',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '未找到任何内容',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '粘贴',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '复制错误',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '前往设置',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '这可能需要一些时间…',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '退出应用？',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '关闭应用',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '无效 URL！',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '剪贴板为空！',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '打开链接失败',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API 密钥',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '用户ID',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '登录',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '密码',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '暂停',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '简历',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '访问我们的 Discord 服务器',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '物品',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '选择',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '选择全部',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '重置',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '打开',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '打开新标签',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移动',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '随机播放',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '排序',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '去',
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
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '请输入一个值',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '请输入有效值',
      'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '请输入一个数字',
      'validationErrors.invalidNumericValue' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '请输入一个有效的数字值',
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
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '已删除最后一个标签',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '重置为默认标签',
      'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
      'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '评分已更改',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            '在 ${booruType} 上，[rating:safe] 现在被替换为 [rating:general] 和 [rating:sensitive]',
      'searchHandler.appFixedRatingAutomatically' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ?? '评分已自动修正。请在以后的搜索中使用正确的评分',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '标签已恢复',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
              count,
              one: '从上次会话恢复了 ${count} 个标签页',
              few: '从上次会话恢复了 ${count} 个标签页',
              many: '从上次会话恢复了 ${count} 个标签页',
              other: '从上次会话恢复了 ${count} 个标签页',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '一些恢复的标签有未知的booru或损坏的字符。',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '它们被设置为默认值或被忽略。',
      'searchHandler.listOfBrokenTabs' => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '损坏标签列表：',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '标签已合并',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(
              count,
              one: '已添加 ${count} 个新标签',
            ),
      _ => null,
    };
  }
}
