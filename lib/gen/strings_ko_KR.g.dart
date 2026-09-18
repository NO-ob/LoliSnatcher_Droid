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
class TranslationsKoKr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsKoKr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.koKr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ko-KR>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsKoKr _root = this; // ignore: unused_field

  @override
  TranslationsKoKr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKoKr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? '미국 영어';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '영어';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '오류';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '오류가 발생했습니다!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '성공';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '성공했습니다!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '취소';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '나중에';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '닫기';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '확인';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '예';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '아니오';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '잠시 기다리세요...';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '보이기';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '숨기기';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '활성화';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '비활성화';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '추가';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '수정';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '제거';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '저장';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '삭제';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '확인';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '재시도';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '복사';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '복사됨';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '클립보드로 복사하기';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '결과 없음';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '붙여넣기';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '복사 오류';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? '보루';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '설정으로 이동';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '시간이 걸릴 수 있습니다...';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '앱을 종료하시겠습니까?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '앱 종료';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '잘못된 링크입니다!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '클립보드가 비었습니다!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '링크 열기 실패';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API 키';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '사용자 ID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '로그인';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '비밀번호';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '일시정지';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '재개';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? '디스코드';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '저희의 디스코드 서버에 방문하세요';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '항목';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '선택하기';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '모두 선택하기';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '초기화';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '열기';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '새 탭에서 열기';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '이동하기';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '섞기';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '정렬하기';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '이동';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '검색';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '필터';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '혹은 (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '페이지';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '# 페이지';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '태그';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '이름';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '주소';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '사용자명';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? '즐겨찾기';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? '다운로드';
  @override
  late final _Translations$validationErrors$ko_KR validationErrors = _Translations$validationErrors$ko_KR._(_root);
  @override
  late final _Translations$init$ko_KR init = _Translations$init$ko_KR._(_root);
  @override
  late final _Translations$permissions$ko_KR permissions = _Translations$permissions$ko_KR._(_root);
  @override
  late final _Translations$authentication$ko_KR authentication = _Translations$authentication$ko_KR._(_root);
  @override
  late final _Translations$searchHandler$ko_KR searchHandler = _Translations$searchHandler$ko_KR._(_root);
  @override
  late final _Translations$snatcher$ko_KR snatcher = _Translations$snatcher$ko_KR._(_root);
  @override
  late final _Translations$multibooru$ko_KR multibooru = _Translations$multibooru$ko_KR._(_root);
  @override
  late final _Translations$hydrus$ko_KR hydrus = _Translations$hydrus$ko_KR._(_root);
  @override
  late final _Translations$tabs$ko_KR tabs = _Translations$tabs$ko_KR._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$ko_KR extends Translations$validationErrors$en {
  _Translations$validationErrors$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '값을 입력하세요';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '유효한 값을 입력하세요';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '숫자를 입력하세요';
  @override
  String get invalidNumericValue => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '유효한 수 형식의 값을 입력하세요';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '${min}보다 큰 값을 입력하세요';
  @override
  String tooBig({required double max}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '${max}보다 작은 값을 입력하세요';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '${min}과 ${max} 사이의 값을 입력하세요';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '0보다 크거나 작은 값을 입력하세요';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '4보다 작은 값을 입력하세요';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '100보다 큰 값을 입력하세요';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '세로열이 4열을 넘어가면 성능에 악영향을 미칠 수 있습니다';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '세로열이 8열을 넘어가면 성능에 악영향을 미칠 수 있습니다';
}

// Path: init
class _Translations$init$ko_KR extends Translations$init$en {
  _Translations$init$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '초기화 오류!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '프록시를 설정하는 중…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '데이터베이스를 불러오는 중…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '보루 사이트 불러오는 중…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '태그 불러오는 중…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '탭 복구하는 중…';
}

// Path: permissions
class _Translations$permissions$ko_KR extends Translations$permissions$en {
  _Translations$permissions$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '커스텀 저장 디렉토리에 접근할 수 없습니다';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? '저장할 디렉토리를 다시 설정하고 앱이 접근할 수 있도록 허용하세요';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '현재 경로: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '디렉토리 설정하기';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? '이 플랫폼에서 지원하지 않음';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '디렉토리 초기화하기';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ?? '초기화 후에는 파일이 기본 디렉토리에 저장됩니다';
}

// Path: authentication
class _Translations$authentication$ko_KR extends Translations$authentication$en {
  _Translations$authentication$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '앱을 사용하려면 인증하세요';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '사용 가능한 생체 인식 기기가 없습니다';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '임시 폐쇄';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '인증 중 다음의 오류가 발생했습니다: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$ko_KR extends Translations$searchHandler$en {
  _Translations$searchHandler$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '마지막 탭 제거됨';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '기본 태그로 초기화';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? '농ㅋㅋ';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '${booruType}에서는 [rating:safe]가 [rating:general]과 [rating:sensitive]로 대체됩니다';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '탭 복구됨';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '이전 세션에서 ${count}개의 탭 복구됨',
        few: '이전 세션에서 ${count}개의 탭 복구됨',
        many: '이전 세션에서 ${count}개의 탭 복구됨',
        other: '이전 세션에서 ${count}개의 탭 복구됨',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '일부 복구된 탭 중 알 수 없는 보루나 깨진 글자를 가진 탭이 있습니다.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '기본값으로 설정되거나 무시되었습니다.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '깨진 탭 목록:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '탭 합쳐짐';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 새 탭 생성됨',
        few: '${count}개의 새 탭 생성됨',
        many: '${count}개의 새 탭 생성됨',
        other: '${count}개의 새 탭 생성됨',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '탭 대체됨';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 탭 받음',
        few: '${count}개의 탭 받음',
        many: '${count}개의 탭 받음',
        other: '${count}개의 탭 받음',
      );
}

// Path: snatcher
class _Translations$snatcher$ko_KR extends Translations$snatcher$en {
  _Translations$snatcher$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '스내처';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '스내칭 기록';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '태그 입력';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '양';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '스내칭할 파일 양';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '지연 시간 (밀리초 ms 단위)';
  @override
  String get delayBetweenEachDownload => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '다운로드 사이 지연 시간';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '파일 스내칭하기';
  @override
  String get itemWasAlreadySnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '이미 스내칭된 적이 있는 항목입니다';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '항목을 스내칭하는 데에 실패했습니다';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '항목 취소됨';
  @override
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '다음 대기열 항목 시작 중…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '항목 스내칭됨';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개 항목 스내칭됨',
        few: '${count}개 항목 스내칭됨',
        many: '${count}개 항목 스내칭됨',
        other: '${count}개 항목 스내칭됨',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 항목이 이미 스내칭되었습니다',
        few: '${count}개의 항목이 이미 스내칭되었습니다',
        many: '${count}개의 항목이 이미 스내칭되었습니다',
        other: '${count}개의 항목이 이미 스내칭되었습니다',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
        few: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
        many: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
        other: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 파일을 취소했습니다',
        few: '${count}개의 파일을 취소했습니다',
        many: '${count}개의 파일을 취소했습니다',
        other: '${count}개의 파일을 취소했습니다',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '이미지 스내칭하기';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '앱을 닫지 마세요!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '항목이 스내칭 대기열에 추가됨';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        one: '${count}개의 항목이 스내칭 대기열에 추가됨',
        few: '${count}개의 항목이 스내칭 대기열에 추가됨',
        many: '${count}개의 항목이 스내칭 대기열에 추가됨',
        other: '${count}개의 항목이 스내칭 대기열에 추가됨',
      );
}

// Path: multibooru
class _Translations$multibooru$ko_KR extends Translations$multibooru$en {
  _Translations$multibooru$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '멀티보루';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '멀티보루 모드';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '최소 두 개 이상의 설정된 보루가 필요합니다';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '추가 보루 고르기';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '일명 멀티보루 모드';
  @override
  String get labelSecondaryBoorusToInclude => TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '추가할 보조 보루';
}

// Path: hydrus
class _Translations$hydrus$ko_KR extends Translations$hydrus$en {
  _Translations$hydrus$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'hydrus를 불러오는 중 오류가 발생했습니다';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ?? '필요한 API 권한이 주어지지 않았을 수 있으며 서비스 검토하기에서 수정할 수 있습니다';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '파일에 태그 추가';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URL 추가';
}

// Path: tabs
class _Translations$tabs$ko_KR extends Translations$tabs$en {
  _Translations$tabs$ko_KR._(TranslationsKoKr root) : this._root = root, super.internal(root);

  final TranslationsKoKr _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '탭';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '설정에서 보루 추가';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '보루를 선택하세요';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '보조 보루';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '새 탭 추가하기';
  @override
  String get selectABooruOrLeaveEmpty => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '보루를 선택하거나 비워두기';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '위치 추가하기';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '이전 탭';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '다음 탭';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '목록 마지막';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '사용된 쿼리';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '기본값';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '현재';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '커스텀';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '커스텀 쿼리';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[비어있음]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '보조 보루 추가하기';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '보조 보루 유지하기';
  @override
  String get startFromCustomPageNumber => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '설정한 페이지에서부터 시작하기';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '새 탭으로 전환하기';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '추가';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '탭 관리자';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '모드 선택';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '탭 정렬';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '도움말';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '탭 삭제하기';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '탭 섞기';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '탭이 무작위로 섞였습니다';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '탭 순서가 저장되었습니다';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '현재 탭으로 스크롤하기';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '맨 위로 스크롤하기';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '맨 아래로 스크롤하기';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '보루, 상태, 중복 여부 등으로 필터링하기';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '정렬 방식:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '기본 탭 순서';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '알파벳 순으로 정렬';
  @override
  String get sortAlphabeticallyReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '알파벳 역순으로 정렬';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '보루 이름 알파벳순으로 정렬';
  @override
  String get sortByBooruNameReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '보루 이름 알파벳 역순으로 정렬';
  @override
  String get longPressSortToSave => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '정렬 버튼을 꾹 눌러서 현재 순서 저장하기';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '선택:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '선택 모드 토글';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '탭 전체 선택/전체 선택 해제';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '선택한 탭 삭제하기';
}

/// The flat map containing all translations for locale <ko-KR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKoKr {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? '미국 영어',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '영어',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '오류',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '오류가 발생했습니다!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '성공',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '성공했습니다!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '취소',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '나중에',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '닫기',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '확인',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '예',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '아니오',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '잠시 기다리세요...',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '보이기',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '숨기기',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '활성화',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '비활성화',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '추가',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '수정',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '제거',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '저장',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '삭제',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '확인',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '재시도',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '복사',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '복사됨',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '클립보드로 복사하기',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '결과 없음',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '붙여넣기',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '복사 오류',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? '보루',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '설정으로 이동',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '시간이 걸릴 수 있습니다...',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? '앱을 종료하시겠습니까?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '앱 종료',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '잘못된 링크입니다!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '클립보드가 비었습니다!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '링크 열기 실패',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API 키',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '사용자 ID',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '로그인',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '비밀번호',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '일시정지',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '재개',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? '디스코드',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '저희의 디스코드 서버에 방문하세요',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '항목',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '선택하기',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '모두 선택하기',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '초기화',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '열기',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '새 탭에서 열기',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '이동하기',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '섞기',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '정렬하기',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '이동',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '검색',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '필터',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '혹은 (~)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '페이지',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '# 페이지',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '태그',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '이름',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '주소',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '사용자명',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? '즐겨찾기',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? '다운로드',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '값을 입력하세요',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '유효한 값을 입력하세요',
      'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '숫자를 입력하세요',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '유효한 수 형식의 값을 입력하세요',
      'validationErrors.tooSmall' => ({
        required double min,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '${min}보다 큰 값을 입력하세요',
      'validationErrors.tooBig' => ({
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '${max}보다 작은 값을 입력하세요',
      'validationErrors.rangeError' => ({
        required double min,
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '${min}과 ${max} 사이의 값을 입력하세요',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '0보다 크거나 작은 값을 입력하세요',
      'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '4보다 작은 값을 입력하세요',
      'validationErrors.biggerThan100' => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '100보다 큰 값을 입력하세요',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '세로열이 4열을 넘어가면 성능에 악영향을 미칠 수 있습니다',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '세로열이 8열을 넘어가면 성능에 악영향을 미칠 수 있습니다',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '초기화 오류!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '프록시를 설정하는 중…',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '데이터베이스를 불러오는 중…',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '보루 사이트 불러오는 중…',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '태그 불러오는 중…',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '탭 복구하는 중…',
      'permissions.noAccessToCustomStorageDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '커스텀 저장 디렉토리에 접근할 수 없습니다',
      'permissions.pleaseSetStorageDirectoryAgain' =>
        TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? '저장할 디렉토리를 다시 설정하고 앱이 접근할 수 있도록 허용하세요',
      'permissions.currentPath' => ({
        required String path,
      }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '현재 경로: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '디렉토리 설정하기',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? '이 플랫폼에서 지원하지 않음',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '디렉토리 초기화하기',
      'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ?? '초기화 후에는 파일이 기본 디렉토리에 저장됩니다',
      'authentication.pleaseAuthenticateToUseTheApp' =>
        TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '앱을 사용하려면 인증하세요',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '사용 가능한 생체 인식 기기가 없습니다',
      'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '임시 폐쇄',
      'authentication.somethingWentWrong' => ({
        required String error,
      }) => TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '인증 중 다음의 오류가 발생했습니다: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '마지막 탭 제거됨',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '기본 태그로 초기화',
      'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? '농ㅋㅋ',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            '${booruType}에서는 [rating:safe]가 [rating:general]과 [rating:sensitive]로 대체됩니다',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '탭 복구됨',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '이전 세션에서 ${count}개의 탭 복구됨',
              few: '이전 세션에서 ${count}개의 탭 복구됨',
              many: '이전 세션에서 ${count}개의 탭 복구됨',
              other: '이전 세션에서 ${count}개의 탭 복구됨',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '일부 복구된 탭 중 알 수 없는 보루나 깨진 글자를 가진 탭이 있습니다.',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '기본값으로 설정되거나 무시되었습니다.',
      'searchHandler.listOfBrokenTabs' => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '깨진 탭 목록:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '탭 합쳐짐',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 새 탭 생성됨',
              few: '${count}개의 새 탭 생성됨',
              many: '${count}개의 새 탭 생성됨',
              other: '${count}개의 새 탭 생성됨',
            ),
      'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '탭 대체됨',
      'searchHandler.receivedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 탭 받음',
              few: '${count}개의 탭 받음',
              many: '${count}개의 탭 받음',
              other: '${count}개의 탭 받음',
            ),
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '스내처',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '스내칭 기록',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '태그 입력',
      'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '양',
      'snatcher.amountOfFilesToSnatch' => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '스내칭할 파일 양',
      'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '지연 시간 (밀리초 ms 단위)',
      'snatcher.delayBetweenEachDownload' => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '다운로드 사이 지연 시간',
      'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '파일 스내칭하기',
      'snatcher.itemWasAlreadySnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '이미 스내칭된 적이 있는 항목입니다',
      'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '항목을 스내칭하는 데에 실패했습니다',
      'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '항목 취소됨',
      'snatcher.startingNextQueueItem' => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '다음 대기열 항목 시작 중…',
      'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '항목 스내칭됨',
      'snatcher.snatchedCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개 항목 스내칭됨',
              few: '${count}개 항목 스내칭됨',
              many: '${count}개 항목 스내칭됨',
              other: '${count}개 항목 스내칭됨',
            ),
      'snatcher.filesAlreadySnatched' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 항목이 이미 스내칭되었습니다',
              few: '${count}개의 항목이 이미 스내칭되었습니다',
              many: '${count}개의 항목이 이미 스내칭되었습니다',
              other: '${count}개의 항목이 이미 스내칭되었습니다',
            ),
      'snatcher.failedToSnatchFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
              few: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
              many: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
              other: '${count}개의 파일을 스내칭하는 데에 실패했습니다',
            ),
      'snatcher.cancelledFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 파일을 취소했습니다',
              few: '${count}개의 파일을 취소했습니다',
              many: '${count}개의 파일을 취소했습니다',
              other: '${count}개의 파일을 취소했습니다',
            ),
      'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '이미지 스내칭하기',
      'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '앱을 닫지 마세요!',
      'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '항목이 스내칭 대기열에 추가됨',
      'snatcher.addedItemsToQueue' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
              count,
              one: '${count}개의 항목이 스내칭 대기열에 추가됨',
              few: '${count}개의 항목이 스내칭 대기열에 추가됨',
              many: '${count}개의 항목이 스내칭 대기열에 추가됨',
              other: '${count}개의 항목이 스내칭 대기열에 추가됨',
            ),
      'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '멀티보루',
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '멀티보루 모드',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '최소 두 개 이상의 설정된 보루가 필요합니다',
      'multibooru.selectSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '추가 보루 고르기',
      'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '일명 멀티보루 모드',
      'multibooru.labelSecondaryBoorusToInclude' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '추가할 보조 보루',
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'hydrus를 불러오는 중 오류가 발생했습니다',
      'hydrus.apiPermissionsRequired' =>
        TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ?? '필요한 API 권한이 주어지지 않았을 수 있으며 서비스 검토하기에서 수정할 수 있습니다',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '파일에 태그 추가',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URL 추가',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '탭',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '설정에서 보루 추가',
      'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '보루를 선택하세요',
      'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '보조 보루',
      'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '새 탭 추가하기',
      'tabs.selectABooruOrLeaveEmpty' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '보루를 선택하거나 비워두기',
      'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '위치 추가하기',
      'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '이전 탭',
      'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '다음 탭',
      'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '목록 마지막',
      'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '사용된 쿼리',
      'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '기본값',
      'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '현재',
      'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '커스텀',
      'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '커스텀 쿼리',
      'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[비어있음]',
      'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '보조 보루 추가하기',
      'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '보조 보루 유지하기',
      'tabs.startFromCustomPageNumber' => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '설정한 페이지에서부터 시작하기',
      'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '새 탭으로 전환하기',
      'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '추가',
      'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '탭 관리자',
      'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '모드 선택',
      'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '탭 정렬',
      'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '도움말',
      'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '탭 삭제하기',
      'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '탭 섞기',
      'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '탭이 무작위로 섞였습니다',
      'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '탭 순서가 저장되었습니다',
      'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '현재 탭으로 스크롤하기',
      'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '맨 위로 스크롤하기',
      'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '맨 아래로 스크롤하기',
      'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '보루, 상태, 중복 여부 등으로 필터링하기',
      'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '정렬 방식:',
      'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '기본 탭 순서',
      'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '알파벳 순으로 정렬',
      'tabs.sortAlphabeticallyReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '알파벳 역순으로 정렬',
      'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '보루 이름 알파벳순으로 정렬',
      'tabs.sortByBooruNameReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '보루 이름 알파벳 역순으로 정렬',
      'tabs.longPressSortToSave' => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '정렬 버튼을 꾹 눌러서 현재 순서 저장하기',
      'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '선택:',
      'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '선택 모드 토글',
      'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '탭 전체 선택/전체 선택 해제',
      'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '선택한 탭 삭제하기',
      _ => null,
    };
  }
}
