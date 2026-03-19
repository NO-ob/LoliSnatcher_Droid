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
class TranslationsTrTr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsTrTr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.trTr,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <tr-TR>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsTrTr _root = this; // ignore: unused_field

  @override
  TranslationsTrTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTrTr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'tr-TR';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Türkçe';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Hata';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Hata!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Başarılı';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Başarılı!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'İptal';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Geri';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Daha Sonra';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Kapat';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'TAMAM';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Evet';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Hayır';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Bir saniye…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Göster';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Gizle';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Etkinleştir';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Devre Dışı Bırak';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Ekle';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Düzenle';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Kaldır';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Kaydet';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Sil';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Onayla';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Tekrar dene';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Temizle';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopyala';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopyalandı';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Panoya kopyalandı';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Sonuç yok';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Yapıştır';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopyalanamadı';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ayarlara git';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Bu işlem biraz zaman alabilir…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Uygulamadan çıkılsın mı?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Uygulamayı kapat';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Geçersiz Bağlantı!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Pano boş!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Bağlantı açılamadı';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Anahtarı';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Kullanıcı ID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Giriş';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Şifre';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Duraklat';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Devam';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Discord sunucumuzu ziyaret edin';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Öge';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seç';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Tümünü seç';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Sıfırla';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Aç';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Yeni sekmede aç';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Taşı';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Karıştır';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sırala';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Git';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Ara';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtre';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Veya (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Sayfa';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Sayfa #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Etiketler';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tür';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Ad';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Kullanıcı adı';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoriler';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'İndirilen';
  @override
  late final _TranslationsValidationErrorsTrTr validationErrors = _TranslationsValidationErrorsTrTr._(_root);
  @override
  late final _TranslationsInitTrTr init = _TranslationsInitTrTr._(_root);
  @override
  late final _TranslationsPermissionsTrTr permissions = _TranslationsPermissionsTrTr._(_root);
  @override
  late final _TranslationsAuthenticationTrTr authentication = _TranslationsAuthenticationTrTr._(_root);
  @override
  late final _TranslationsSearchHandlerTrTr searchHandler = _TranslationsSearchHandlerTrTr._(_root);
  @override
  late final _TranslationsSnatcherTrTr snatcher = _TranslationsSnatcherTrTr._(_root);
  @override
  late final _TranslationsMultibooruTrTr multibooru = _TranslationsMultibooruTrTr._(_root);
  @override
  late final _TranslationsHydrusTrTr hydrus = _TranslationsHydrusTrTr._(_root);
  @override
  late final _TranslationsTabsTrTr tabs = _TranslationsTabsTrTr._(_root);
  @override
  late final _TranslationsHistoryTrTr history = _TranslationsHistoryTrTr._(_root);
  @override
  late final _TranslationsWebviewTrTr webview = _TranslationsWebviewTrTr._(_root);
  @override
  late final _TranslationsSettingsTrTr settings = _TranslationsSettingsTrTr._(_root);
  @override
  late final _TranslationsCommentsTrTr comments = _TranslationsCommentsTrTr._(_root);
  @override
  late final _TranslationsPageChangerTrTr pageChanger = _TranslationsPageChangerTrTr._(_root);
  @override
  late final _TranslationsTagsFiltersDialogsTrTr tagsFiltersDialogs = _TranslationsTagsFiltersDialogsTrTr._(_root);
  @override
  late final _TranslationsTagsManagerTrTr tagsManager = _TranslationsTagsManagerTrTr._(_root);
  @override
  late final _TranslationsLockscreenTrTr lockscreen = _TranslationsLockscreenTrTr._(_root);
  @override
  late final _TranslationsLoliSyncTrTr loliSync = _TranslationsLoliSyncTrTr._(_root);
  @override
  late final _TranslationsImageSearchTrTr imageSearch = _TranslationsImageSearchTrTr._(_root);
  @override
  late final _TranslationsTagViewTrTr tagView = _TranslationsTagViewTrTr._(_root);
  @override
  late final _TranslationsPinnedTagsTrTr pinnedTags = _TranslationsPinnedTagsTrTr._(_root);
  @override
  late final _TranslationsSearchBarTrTr searchBar = _TranslationsSearchBarTrTr._(_root);
  @override
  late final _TranslationsMobileHomeTrTr mobileHome = _TranslationsMobileHomeTrTr._(_root);
  @override
  late final _TranslationsDesktopHomeTrTr desktopHome = _TranslationsDesktopHomeTrTr._(_root);
  @override
  late final _TranslationsGalleryViewTrTr galleryView = _TranslationsGalleryViewTrTr._(_root);
  @override
  late final _TranslationsMediaPreviewsTrTr mediaPreviews = _TranslationsMediaPreviewsTrTr._(_root);
  @override
  late final _TranslationsViewerTrTr viewer = _TranslationsViewerTrTr._(_root);
  @override
  late final _TranslationsCommonTrTr common = _TranslationsCommonTrTr._(_root);
  @override
  late final _TranslationsGalleryTrTr gallery = _TranslationsGalleryTrTr._(_root);
  @override
  late final _TranslationsGalleryButtonsTrTr galleryButtons = _TranslationsGalleryButtonsTrTr._(_root);
  @override
  late final _TranslationsMediaTrTr media = _TranslationsMediaTrTr._(_root);
  @override
  late final _TranslationsImageStatsTrTr imageStats = _TranslationsImageStatsTrTr._(_root);
  @override
  late final _TranslationsPreviewTrTr preview = _TranslationsPreviewTrTr._(_root);
  @override
  late final _TranslationsTagTypeTrTr tagType = _TranslationsTagTypeTrTr._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsTrTr extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Lütfen bir değer gir';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Lütfen geçerli bir değer gir';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Lütfen bir sayı gir';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Lütfen geçerli bir sayı değeri gir';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Lütfen ${min} değerinden daha büyük bir değer gir';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Lütfen ${max} değerinden daha küçük bir değer gir';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Lütfen ${min} ve ${max} arasında bir değer gir';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Lütfen 0\'a eşit veya daha büyük bir değer gir';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Lütfen 4\'ten az olan bir değer gir';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Lütfen 100\'den büyük bir değer gir';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      '4 sütundan fazlasını kullanmak performansı etkileyebilir';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      '8 sütundan fazlasını kullanmak performansı etkileyebilir';
}

// Path: init
class _TranslationsInitTrTr extends TranslationsInitEn {
  _TranslationsInitTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Başlatma hatası!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Proxy ayarlanıyor…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Veritabanı yükleniyor…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Booru\'lar yükleniyor…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Etiketler yükleniyor…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Sekmeler geri yükleniyor…';
}

// Path: permissions
class _TranslationsPermissionsTrTr extends TranslationsPermissionsEn {
  _TranslationsPermissionsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Özel depolama dizinine erişilemiyor';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Uygulamaya erişim izni vermek için lütfen depolama dizinini tekrar ayarla';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Mevcut yol: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Dizin ayarla';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Bu platformda kullanılamıyor';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Dizini sıfırla';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Sıfırladıktan sonra dosyalar varsayılan dizine kaydedilecek';
}

// Path: authentication
class _TranslationsAuthenticationTrTr extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Uygulamayı kullanmak için kimliğini doğrula';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Biyometrik donanım bulunamadı';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Geçici olarak kilitlendi';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Kimlik doğrulanırken bir hata oluştu: ${error}';
}

// Path: searchHandler
class _TranslationsSearchHandlerTrTr extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Son sekme kaldırıldı';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Varsayılan etiketlere sıfırlanıyor';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Derecelendirmeler değiştirildi';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '${booruType} üzerinde [rating:safe] artık [rating:general] ve [rating:sensitive] ile değiştirildi';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Derecelendirme otomatik düzeltildi. Sonraki aramalarda doğru olanı kullanmayı unutma';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Sekmeler geri yüklendi';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: 'Önceki oturumdan ${count} sekme geri yüklendi',
        few: 'Önceki oturumdan ${count} sekme geri yüklendi',
        many: 'Önceki oturumdan ${count} sekme geri yüklendi',
        other: 'Önceki oturumdan ${count} sekme geri yüklendi',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Geri yüklenen bazı sekmelerde bilinmeyen booru\'lar veya bozuk karakterler vardı.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Bunlar varsayılana ayarlandı veya görmezden gelindi.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Bozuk sekmelerin listesi:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Sekmeler birleştirildi';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} yeni sekme eklendi',
        few: '${count} yeni sekme eklendi',
        many: '${count} yeni sekme eklendi',
        other: '${count} yeni sekme eklendi',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Sekmeler değiştirildi';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} sekme alındı',
        few: '${count} sekme alındı',
        many: '${count} sekme alındı',
        other: '${count} sekme alındı',
      );
}

// Path: snatcher
class _TranslationsSnatcherTrTr extends TranslationsSnatcherEn {
  _TranslationsSnatcherTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'İndirme Yöneticisi';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'İndirme geçmişi';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Etiket gir';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Miktar';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'İndirilecek dosya miktarı';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Gecikme (ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'İndirmeler arası gecikme';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Dosyaları indir';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Bu öge zaten daha önce indirilmiş';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Öge indirilemedi';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Öge iptal edildi';
  @override
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Sıradaki ögeye geçiliyor…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'İndirilen ögeler';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: 'İndirilen: ${count} öge',
        few: 'İndirilen: ${count} öge',
        many: 'İndirilen: ${count} öge',
        other: 'İndirilen: ${count} öge',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} dosya zaten indirilmiş',
        few: '${count} dosya zaten indirilmiş',
        many: '${count} dosya zaten indirilmiş',
        other: '${count} dosya zaten indirilmiş',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} dosya indirilemedi',
        few: '${count} dosya indirilemedi',
        many: '${count} dosya indirilemedi',
        other: '${count} dosya indirilemedi',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} dosya iptal edildi',
        few: '${count} dosya iptal edildi',
        many: '${count} dosya iptal edildi',
        other: '${count} dosya iptal edildi',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Görseller indiriliyor';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Uygulamayı kapatma!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Öge İndirme kuyruğuna eklendi';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} öge indirme kuyruğuna eklendi',
        few: '${count} öge indirme kuyruğuna eklendi',
        many: '${count} öge indirme kuyruğuna eklendi',
        other: '${count} öge indirme kuyruğuna eklendi',
      );
}

// Path: multibooru
class _TranslationsMultibooruTrTr extends TranslationsMultibooruEn {
  _TranslationsMultibooruTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru modu';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'En az 2 yapılandırılmış booru gerektirir';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Ek booru\'ları seç:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'diğer adıyla Multibooru modu';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dahil edilecek ikincil booru\'lar';
}

// Path: hydrus
class _TranslationsHydrusTrTr extends TranslationsHydrusEn {
  _TranslationsHydrusTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Hydrus\'a aktarılırken bir sorun oluştu';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Doğru API izinlerini vermemiş olabilirsin: Bu ayar Hizmetleri İncele (Review Services) kısmından düzenlenebilir';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dosyaya etiketleri ekle';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URL\'leri ekle';
}

// Path: tabs
class _TranslationsTabsTrTr extends TranslationsTabsEn {
  _TranslationsTabsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Sekme';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Ayarlardan booru ekle';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Bir Booru seç';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'İkincil booru\'lar';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Yeni sekme ekle';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Bir booru seç veya boş bırak';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Konum ekle';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Önceki sekme';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Sonraki sekme';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Liste sonu';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Kullanılan sorgu';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Varsayılan';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Şu anki';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Özel';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Özel sorgu';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[boş]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'İkincil booru\'ları ekle';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'İkincil booru\'ları koru';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Özel sayfa numarasından başla';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Yeni sekmeye geç';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Ekle';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Sekme Yöneticisi';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Seçim modu';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sekmeleri sırala';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Yardım';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Sekmeleri sil';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Sekmeleri karıştır';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Sekmeler rastgele karıştırıldı';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Sekme sırası kaydedildi';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Mevcut sekmeye git';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Başa git';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Sona git';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Booru, durum veya kopyalara göre filtrele…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Kaydırma:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sıralama:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Varsayılan sekme sırası';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Alfabetik sırala';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Alfabetik sırala (tersten)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Booru adına göre alf. sırala';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Booru adına göre alf. sırala (tersten)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Güncel sırayı kaydetmek için sırala butonuna basılı tut';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Seç:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Seçim modunu değiştir';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Sayfanın altında: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Tüm sekmeleri seç/bırak';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Seçili sekmeleri sil';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Taşımak için bir sekmeye basılı tut';
  @override
  String get numbersInBottomRight => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Sekmenin sağ altındaki numaralar:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'İlk sayı: varsayılan liste sırasındaki sekme dizini';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'İkinci sayı: filtreleme veya sıralama etkinken şu anki listedeki sekme dizini';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Özel filtreler:';
  @override
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Yüklendi» - ögeleri yüklenmiş sekmeleri gösterir';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«Yüklenmedi» - yüklenmemiş veya sıfır ögesi olan sekmeleri gösterir';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Yüklenmemiş sekmeler italik metne sahiptir';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Sekme bulunamadı';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopyala';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Taşı';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Kaldır';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Karıştır';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sırala';
  @override
  String get shuffleTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Sekme sırası rastgele karıştırılsın mı?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Sekmeler şu anki sıralamada kaydedilsin mi?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Booru\'ya göre';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetik';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(tersten)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} sekmeyi silmek istediğine emin misin?',
        few: '${count} sekmeyi silmek istediğine emin misin?',
        many: '${count} sekmeyi silmek istediğine emin misin?',
        other: '${count} sekmeyi silmek istediğine emin misin?',
      );
  @override
  late final _TranslationsTabsFiltersTrTr filters = _TranslationsTabsFiltersTrTr._(_root);
  @override
  late final _TranslationsTabsMoveTrTr move = _TranslationsTabsMoveTrTr._(_root);
}

// Path: history
class _TranslationsHistoryTrTr extends TranslationsHistoryEn {
  _TranslationsHistoryTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Arama geçmişi';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Arama geçmişi boş';
  @override
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Arama geçmişi devre dışı';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      'Arama geçmişi için ayarlardan veritabanını etkinleştir';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Son arama: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Son arama: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Bilinmeyen Booru türü!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Bilinmeyen booru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Aç';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Yeni sekmede aç';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Favorilerden kaldır';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Favorilere ekle';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopyala';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Sil';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Geçmiş girdilerini sil';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} ögeyi silmek istediğine emin misin?',
        few: '${count} ögeyi silmek istediğine emin misin?',
        many: '${count} ögeyi silmek istediğine emin misin?',
        other: '${count} ögeyi silmek istediğine emin misin?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Seçimi temizle';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} ögeyi sil',
        few: '${count} ögeyi sil',
        many: '${count} ögeyi sil',
        other: '${count} ögeyi sil',
      );
}

// Path: webview
class _TranslationsWebviewTrTr extends TranslationsWebviewEn {
  _TranslationsWebviewTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';
  @override
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Bu cihazda desteklenmiyor';
  @override
  late final _TranslationsWebviewNavigationTrTr navigation = _TranslationsWebviewNavigationTrTr._(_root);
}

// Path: settings
class _TranslationsSettingsTrTr extends TranslationsSettingsEn {
  _TranslationsSettingsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ayarlar';
  @override
  late final _TranslationsSettingsLanguageTrTr language = _TranslationsSettingsLanguageTrTr._(_root);
  @override
  late final _TranslationsSettingsBooruTrTr booru = _TranslationsSettingsBooruTrTr._(_root);
  @override
  late final _TranslationsSettingsBooruEditorTrTr booruEditor = _TranslationsSettingsBooruEditorTrTr._(_root);
  @override
  late final _TranslationsSettingsInterfaceTrTr interface = _TranslationsSettingsInterfaceTrTr._(_root);
  @override
  late final _TranslationsSettingsThemeTrTr theme = _TranslationsSettingsThemeTrTr._(_root);
  @override
  late final _TranslationsSettingsViewerTrTr viewer = _TranslationsSettingsViewerTrTr._(_root);
  @override
  late final _TranslationsSettingsVideoTrTr video = _TranslationsSettingsVideoTrTr._(_root);
  @override
  late final _TranslationsSettingsDownloadsTrTr downloads = _TranslationsSettingsDownloadsTrTr._(_root);
  @override
  late final _TranslationsSettingsDatabaseTrTr database = _TranslationsSettingsDatabaseTrTr._(_root);
  @override
  late final _TranslationsSettingsBackupAndRestoreTrTr backupAndRestore = _TranslationsSettingsBackupAndRestoreTrTr._(_root);
  @override
  late final _TranslationsSettingsNetworkTrTr network = _TranslationsSettingsNetworkTrTr._(_root);
  @override
  late final _TranslationsSettingsPrivacyTrTr privacy = _TranslationsSettingsPrivacyTrTr._(_root);
  @override
  late final _TranslationsSettingsPerformanceTrTr performance = _TranslationsSettingsPerformanceTrTr._(_root);
  @override
  late final _TranslationsSettingsCacheTrTr cache = _TranslationsSettingsCacheTrTr._(_root);
  @override
  late final _TranslationsSettingsItemFiltersTrTr itemFilters = _TranslationsSettingsItemFiltersTrTr._(_root);
  @override
  late final _TranslationsSettingsSyncTrTr sync = _TranslationsSettingsSyncTrTr._(_root);
  @override
  late final _TranslationsSettingsAboutTrTr about = _TranslationsSettingsAboutTrTr._(_root);
  @override
  late final _TranslationsSettingsCheckForUpdatesTrTr checkForUpdates = _TranslationsSettingsCheckForUpdatesTrTr._(_root);
  @override
  late final _TranslationsSettingsLogsTrTr logs = _TranslationsSettingsLogsTrTr._(_root);
  @override
  late final _TranslationsSettingsHelpTrTr help = _TranslationsSettingsHelpTrTr._(_root);
  @override
  late final _TranslationsSettingsDebugTrTr debug = _TranslationsSettingsDebugTrTr._(_root);
  @override
  late final _TranslationsSettingsLoggingTrTr logging = _TranslationsSettingsLoggingTrTr._(_root);
  @override
  late final _TranslationsSettingsWebviewTrTr webview = _TranslationsSettingsWebviewTrTr._(_root);
  @override
  late final _TranslationsSettingsDirPickerTrTr dirPicker = _TranslationsSettingsDirPickerTrTr._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Sürüm';
}

// Path: comments
class _TranslationsCommentsTrTr extends TranslationsCommentsEn {
  _TranslationsCommentsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Yorumlar';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Yorum yok';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
      'Bu Booru\'da yorum yok veya yorumlar için bir API bulunmuyor';
}

// Path: pageChanger
class _TranslationsPageChangerTrTr extends TranslationsPageChangerEn {
  _TranslationsPageChangerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Sayfa değiştirici';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Sayfa #';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Yüklemeler arası gecikme (ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'ms cinsinden gecikme';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Mevcut sayfa #${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Olası maks. sayfa #~${number}';
  @override
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Arama şu an devam ediyor!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Sayfaya atla';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Sayfaya kadar ara';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Aramayı durdur';
}

// Path: tagsFiltersDialogs
class _TranslationsTagsFiltersDialogsTrTr extends TranslationsTagsFiltersDialogsEn {
  _TranslationsTagsFiltersDialogsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Boş girdi!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Yeni ${type} filtresi ekle]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Yeni ${type} etiket filtresi';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Yeni filtre';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Filtreyi düzenle';
}

// Path: tagsManager
class _TranslationsTagsManagerTrTr extends TranslationsTagsManagerEn {
  _TranslationsTagsManagerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Etiketler';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Etiket ekle';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Ad';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tür';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Ekle';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Şu süreden sonra eskir: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Sekme eklendi';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Sekme ekle';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopyala';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Eskimiş olarak işaretle';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Eskimeyi sıfırla';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Eskimez yap';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: '${count} etiketi sil',
        few: '${count} etiketi sil',
        many: '${count} etiketi sil',
        other: '${count} etiketi sil',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Etiketleri sil';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Seçimi temizle';
}

// Path: lockscreen
class _TranslationsLockscreenTrTr extends TranslationsLockscreenEn {
  _TranslationsLockscreenTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Doğrulamak için dokun';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'GELİŞTİRİCİ KİLİDİNİ AÇ';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TEST]: Uygulamanın kilidini normal yollarla açamıyorsan buraya bas. Cihazınla ilgili detayları geliştiriciye bildir.';
}

// Path: loliSync
class _TranslationsLoliSyncTrTr extends TranslationsLoliSyncEn {
  _TranslationsLoliSyncTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';
  @override
  String get stopSyncingQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Senkronizasyonu durdurmak istiyor musun?';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Sunucuyu durdurmak istiyor musun?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Bağlantı yok';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Bağlantı bekleniyor…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Sunucu başlatılıyor…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Ekranı uyanık tut';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync sunucusu kapatıldı';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Test hatası: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Test hatası: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Test isteği olumlu yanıt aldı';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Diğer cihazda bir \'Test\' mesajı görünmelidir';
}

// Path: imageSearch
class _TranslationsImageSearchTrTr extends TranslationsImageSearchEn {
  _TranslationsImageSearchTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Görsel arama';
}

// Path: tagView
class _TranslationsTagViewTrTr extends TranslationsTagViewEn {
  _TranslationsTagViewTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Etiketler';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Yorumlar';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Notları göster (${count})';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Notları gizle (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Notları yükle';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Bu etiket zaten mevcut arama sorgusunda:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Mevcut arama sorgusuna eklendi:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Yeni sekme eklendi:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Gönderi URL\'si';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Paylaşılma';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detaylar';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Dosya adı';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Uzantı';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Çözünürlük';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Boyut';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Derecelendirme';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Puan';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Etiket bulunamadı';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopyala';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Aramadan kaldır';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Aramaya ekle';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Arama çubuğuna eklendi:';
  @override
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Aramaya ekle (Hariç tut)';
  @override
  String get addedToSearchBarExclude =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Arama çubuğuna eklendi (Hariç tut):';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'İşaretlenenlere ekle';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Gizlenenlere ekle';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'İşaretlenenlerden kaldır';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Gizlenenlerden kaldır';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Etiketi düzenle';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Kaynak';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Önizleme';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Yüklenecek bir booru seç';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Önizleme yükleniyor…';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Önizleme yüklenemedi';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tekrar denemek için dokun';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Dosya URL\'si panoya kopyalandı';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Etiket önizlemeleri';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Mevcut durum';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Geçmiş';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Önizleme sayfası yüklenemedi';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Tekrar dene';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Tespit edilen bağlantılar:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'İlgili sekmeler';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Sadece bu etiketi içeren sekmeler';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
      'Sadece bu etiketi içeren ama farklı booru\'daki sekmeler';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Bu etiketi kapsayan sekmeler';
}

// Path: pinnedTags
class _TranslationsPinnedTagsTrTr extends TranslationsPinnedTagsEn {
  _TranslationsPinnedTagsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Sabitlenmiş etiketler';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Etiketi sabitle';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Sabitlemeyi kaldır';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Sabitle';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Kaldır';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» hızlı erişime sabitlensin mi?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '«${tag}» sabitlenmiş etiketlerden kaldırılsın mı?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Sadece ${name} için';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Etiketler (isteğe bağlı)';
  @override
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Bir etiket dahil etmek için yaz ve Ekle butonuna bas';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Mevcut etiketi seç';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Etiket sabitlendi';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? '${name} için sabitlendi: ${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Global olarak sabitlendi: ${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Etiketin sabitlemesi kaldırıldı';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Hepsi';
  @override
  String get reorderPinnedTags =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Sabitlenmiş etiketleri yeniden sırala';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Kaydediliyor…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Yeniden sırala';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Etiketi manuel ekle';
  @override
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Aramayla eşleşen etiket yok';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Henüz sabitlenmiş etiket yok';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Etiketleri düzenle';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Etiketler';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Sabitlenmiş etiket ekle';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Etiket sorgusu';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'etiket_adi';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
      'Boşluk içeren etiketler dahil her türlü arama sorgusunu girebilirsin';
}

// Path: searchBar
class _TranslationsSearchBarTrTr extends TranslationsSearchBarEn {
  _TranslationsSearchBarTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Etiketlerde ara';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Öneriler yüklenemedi. Tekrar denemek için dokun: ${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Öneri bulunamadı';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Bu booru için etiket önerileri kullanılamıyor';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '«${tag}» panoya kopyalandı';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Önek';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Hariç tut (:)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Meta etiketler';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Sayımdan muaf meta etiketler';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
      'Sayımdan muaf meta etiketler, etiket arama sınırına dahil edilmez';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Muaf';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Tekli';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Aralık';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popüler';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Tarih seç';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Tarih aralığı seç';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Geçmiş';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class _TranslationsMobileHomeTrTr extends TranslationsMobileHomeEn {
  _TranslationsMobileHomeTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Web görünümü için booru seç';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Uygulamayı kilitle';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Dosya zaten mevcut';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'İndirme başarısız';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Kullanıcı tarafından iptal edildi';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Yine de kaydet';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Atla';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Hepsini tekrar dene (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Mevcut, başarısız veya iptal edilen ögeler';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Tüm tekrar denenebilir ögeleri temizle';
}

// Path: desktopHome
class _TranslationsDesktopHomeTrTr extends TranslationsDesktopHomeEn {
  _TranslationsDesktopHomeTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'İndirme Yöneticisi';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Ayarlardan booru ekle';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Ayarlar';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Kaydet';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Hiçbir öge seçilmedi';
}

// Path: galleryView
class _TranslationsGalleryViewTrTr extends TranslationsGalleryViewEn {
  _TranslationsGalleryViewTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Öge yok';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Hiçbir öge seçilmedi';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Kapat';
}

// Path: mediaPreviews
class _TranslationsMediaPreviewsTrTr extends TranslationsMediaPreviewsEn {
  _TranslationsMediaPreviewsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Hiçbir booru yapılandırması bulunamadı';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Yeni Booru ekle';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Yardım';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Ayarlar';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Önceki oturum geri yükleniyor…';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Dosya URL\'si panoya kopyalandı!';
}

// Path: viewer
class _TranslationsViewerTrTr extends TranslationsViewerEn {
  _TranslationsViewerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsViewerTutorialTrTr tutorial = _TranslationsViewerTutorialTrTr._(_root);
  @override
  late final _TranslationsViewerAppBarTrTr appBar = _TranslationsViewerAppBarTrTr._(_root);
  @override
  late final _TranslationsViewerNotesTrTr notes = _TranslationsViewerNotesTrTr._(_root);
}

// Path: common
class _TranslationsCommonTrTr extends TranslationsCommonEn {
  _TranslationsCommonTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Bir booru seç';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru ögesi panoya kopyalandı';
}

// Path: gallery
class _TranslationsGalleryTrTr extends TranslationsGalleryEn {
  _TranslationsGalleryTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'İndirilsin mi?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Gönderi URL\'si yok!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Dosya yükleniyor…';
  @override
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Bu biraz zaman alabilir, lütfen bekle…';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        count,
        one: 'Kaynak',
        other: 'Kaynaklar',
      );
}

// Path: galleryButtons
class _TranslationsGalleryButtonsTrTr extends TranslationsGalleryButtonsEn {
  _TranslationsGalleryButtonsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'İndir';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favori';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Bilgi';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Paylaş';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Seç';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Tarayıcıda aç';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Slayt gösterisi';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Ölçeklendirmeyi değiştir';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Kaliteyi değiştir';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Harici oynatıcı';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Görsel arama';
}

// Path: media
class _TranslationsMediaTrTr extends TranslationsMediaEn {
  _TranslationsMediaTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsMediaLoadingTrTr loading = _TranslationsMediaLoadingTrTr._(_root);
  @override
  late final _TranslationsMediaVideoTrTr video = _TranslationsMediaVideoTrTr._(_root);
}

// Path: imageStats
class _TranslationsImageStatsTrTr extends TranslationsImageStatsEn {
  _TranslationsImageStatsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktif: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Bekleyen: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Toplam: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Boyut: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Maks.: ${max}';
}

// Path: preview
class _TranslationsPreviewTrTr extends TranslationsPreviewEn {
  _TranslationsPreviewTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsPreviewErrorTrTr error = _TranslationsPreviewErrorTrTr._(_root);
}

// Path: tagType
class _TranslationsTagTypeTrTr extends TranslationsTagTypeEn {
  _TranslationsTagTypeTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Sanatçı';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Karakter';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Telif Hakkı';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Tür';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Yok (Genel)';
}

// Path: tabs.filters
class _TranslationsTabsFiltersTrTr extends TranslationsTabsFiltersEn {
  _TranslationsTabsFiltersTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Yüklendi';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Etiket türü';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Kopyalar';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Aynı Booru üzerindeki kopyaları kontrol et';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Boş arama sorgusu';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Sekme Filtreleri';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Hepsi';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Yüklenmedi';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Etkin';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Devre dışı';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Sıralamayı da etkinleştirecek';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? 'Seçili türde en az bir etiket içeren sekmeleri filtrele';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Herhangi';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Uygula';
}

// Path: tabs.move
class _TranslationsTabsMoveTrTr extends TranslationsTabsMoveEn {
  _TranslationsTabsMoveTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'En üste taşı';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'En alta taşı';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Sekme numarası';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Geçersiz sekme numarası';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Geçersiz giriş';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Aralık dışında';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Lütfen geçerli bir sekme numarası gir';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Şuraya taşı: #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Önizleme:';
}

// Path: webview.navigation
class _TranslationsWebviewNavigationTrTr extends TranslationsWebviewNavigationEn {
  _TranslationsWebviewNavigationTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Bir URL gir';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Özel URL gir';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Şu adrese git: ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Çerezleri listele';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Çerezleri temizle';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Çerezler vardı. Artık yoklar';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Favicon al';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Favicon bulunamadı';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(yukarıdaki metin seçilebilir)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URL\'yi kopyala';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL panoya kopyalandı';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Çerezler';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Geçmiş';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Geri gidilecek geçmiş ögesi yok';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'İleri gidilecek geçmiş ögesi yok';
}

// Path: settings.language
class _TranslationsSettingsLanguageTrTr extends TranslationsSettingsLanguageEn {
  _TranslationsSettingsLanguageTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Dil';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistem';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Çeviriye katkıda bulun';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Detaylar için <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> adresini ziyaret et veya POEditor\'e gitmek için aşağıdaki görsele dokun';
}

// Path: settings.booru
class _TranslationsSettingsBooruTrTr extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru\'lar ve Arama';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Varsayılan etiketler';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Sayfa başına getirilen öge sayısı';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Bazı booru\'lar bunu yok sayabilir';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru yapılandırması ekle';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booru yapılandırmasını paylaş';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      '${booruName} yapılandırmasını bağlantı olarak paylaş.\n\nGiriş bilgileri/API anahtarı dahil edilsin mi?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      '${booruName} yapılandırma bağlantısını panoya kopyala.\n\nGiriş bilgileri/API anahtarı dahil edilsin mi?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru paylaşımı';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Android 12 ve üzeri sürümlerde Booru yapılandırma bağlantılarını uygulamada otomatik olarak açmak için:\n1) Sistem uygulama bağlantısı varsayılan ayarlarını açmak için aşağıdaki butona dokun\n2) «Bağlantı ekle» kısmına dokun ve mevcut tüm seçenekleri seç';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Eklenen Booru\'lar';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Booru yapılandırmasını düzenle';
  @override
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Panodan Booru yapılandırmasını içe aktar';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Yalnızca loli.snatcher URL\'leri desteklenmektedir';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Booru yapılandırmasını sil';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Booru yapılandırması silinirken bir sorun oluştu!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru yapılandırması silindi';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Seçili booru kaydedildikten sonra varsayılan olur.\n\nVarsayılan booru açılır listelerde ilk sırada görünür';
  @override
  String get changeDefaultBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Varsayılan Booru değiştirilsin mi?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Şununla değiştir: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Mevcut olanı korumak için [Hayır] seçeneğine dokun: ';
  @override
  String get changeToNewBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Şuna geçmek için [Evet] seçeneğine dokun: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru yapılandırma bağlantısı panoya kopyalandı';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Hiçbir Booru seçilmedi!';
  @override
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Bu Booru silinemez!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Önce ilgili sekmeleri kaldır';
}

// Path: settings.booruEditor
class _TranslationsSettingsBooruEditorTrTr extends TranslationsSettingsBooruEditorEn {
  _TranslationsSettingsBooruEditorTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Düzenleyici';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru testi başarısız';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Yapılandırma parametreleri hatalı olabilir, booru API erişimine izin vermiyor olabilir, istek veri döndürmedi veya bir ağ hatası oluştu.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booru\'yu Kaydet';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Test çalıştırılıyor…';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Bu Booru yapılandırması zaten mevcut';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
      'Aynı ada sahip Booru yapılandırması zaten mevcut';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
      'Aynı URL\'ye sahip Booru yapılandırması zaten mevcut';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Bu booru yapılandırması eklenmeyecek';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru yapılandırması kaydedildi';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Değişikliklerin uygulanması için bu Booru\'ya sahip mevcut sekmelerin yeniden yüklenmesi gerekiyor!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Hydrus için API erişimi doğrulanamadı';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Erişim anahtarı istendi';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Hydrus üzerinden onay verip ardından uygula. Sonrasında \'Booru Testi\' yapabilirsin';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Erişim anahtarı alınamadı';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Hydrus\'ta istek penceresi açık mı?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Hydrus anahtarını almak için Hydrus istemcisinde istek penceresini açman gerekir: Hizmetler > Hizmetleri incele > İstemci API > Ekle > API isteğinden (Services > Review services > Client API > Add > From API request)';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus API anahtarını al';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Adı';
  @override
  String get booruNameRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Adı gerekli!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL\'si';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL\'si gerekli!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Türü';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL\'si';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Boş bırakılırsa otomatik doldurulur)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Varsayılan etiketler';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Booru için varsayılan arama';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'Aşağıdaki alanlar bazı booru\'lar için gerekli olabilir';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Bu booru yapılandırmasını kaydetmeyi onayla';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Seçilen/Tespit edilen booru türü: ${booruType}';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceTrTr extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Arayüz';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Uygulama arayüz modu';
  @override
  String get appUIModeWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Uygulama arayüz modu';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Masaüstü modu kullanılsın mı? Mobilde sorunlara neden olabilir. (ESKİDİ/DESTEKLENMİYOR).';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobil: Normal Mobil Arayüzü';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Masaüstü: Ahoviewer Tarzı Arayüz (ESKİDİ, YENİDEN DÜZENLENMELİ)';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Uyarı]: Bir telefonda Arayüz Modunu Masaüstü olarak ayarlama, uygulamayı bozabilirsin ve booru yapılandırmaları dahil tüm ayarlarını sıfırlamak zorunda kalabilirsin.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'El kullanımı';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Arayüz ögelerinin konumunu seçilen ele göre ayarlar';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Önizleme ızgarasında arama çubuğunu göster';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? 'Arama görünümünde giriş alanını üste taşı';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Arama görünümü hızlı işlem paneli';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Arama girişine otomatik odaklan';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Titreşimi devre dışı bırak';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'Devre dışı bırakılsa bile bazı işlemlerde hala titreşim olabilir';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Tahmini geri hareketi';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Önizleme sütunları (dikey)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Önizleme sütunları (yatay)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Önizleme kalitesi';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
      'Önizleme ızgarasındaki görsel çözünürlüğünü değiştirir';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Örnek: Orta çözünürlük, yüksek kalite yüklenirken uygulama yer tutucu olarak bir Küçük Resim kalitesi de yükler';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Küçük Resim: Düşük çözünürlük';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Not]: Örnek kalitesi performansı gözle görülür şekilde düşürebilir: özellikle önizleme ızgarasında çok fazla sütun varsa';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Önizleme görünümü';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Yedek önizleme görünümü';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Kademeli (Staggered) seçeneği mümkün olmadığında bu kullanılacaktır';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Görselleri ölçeklendirme';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Performansı düşürebilir';
  @override
  String get dontScaleImagesWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Uyarı';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Görsel ölçeklendirmeyi devre dışı bırakmak istediğine emin misin?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Bu durum, özellikle eski cihazlarda performansı olumsuz etkileyebilir';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF küçük resimleri';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '«Görselleri ölçeklendirme» seçeneğini gerektirir';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Önizleme kaydırma butonlarının konumu';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Fare tekerleği kaydırma çarpanı';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Kaydırma çarpanı';
  @override
  late final _TranslationsSettingsInterfacePreviewQualityValuesTrTr previewQualityValues = _TranslationsSettingsInterfacePreviewQualityValuesTrTr._(
    _root,
  );
  @override
  late final _TranslationsSettingsInterfacePreviewDisplayModeValuesTrTr previewDisplayModeValues =
      _TranslationsSettingsInterfacePreviewDisplayModeValuesTrTr._(_root);
  @override
  late final _TranslationsSettingsInterfaceAppModeValuesTrTr appModeValues = _TranslationsSettingsInterfaceAppModeValuesTrTr._(_root);
  @override
  late final _TranslationsSettingsInterfaceHandSideValuesTrTr handSideValues = _TranslationsSettingsInterfaceHandSideValuesTrTr._(_root);
}

// Path: settings.theme
class _TranslationsSettingsThemeTrTr extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Tema';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Tema modu';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Siyah arka plan';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Dinamik renk kullan';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Yalnızca Android 12+';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Temalar';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Birincil renk';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'İkincil renk';
  @override
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Menü maskotunu etkinleştir';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Özel maskot ayarla';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Özel maskotu kaldır';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Mevcut maskot dizini';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistem';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Açık';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Koyu';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pembe';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Mor';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Mavi';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Turkuaz';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Kırmızı';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Yeşil';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Cadılar Bayramı';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Özel';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Renk seç';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Seçilen renk';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Seçilen renk ve tonları';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Yazı Tipi';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Sistem varsayılanı';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Daha fazla yazı tipi görüntüle';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Pijamalı hasta yağız şoföre çabucak güvendi';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Özel yazı tipi';
  @override
  String get customFontSubtitle => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Bir Google Font adı gir';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Yazı tipi adı';
  @override
  String get customFontHint =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'fonts.google.com adresindeki fontlara göz at';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Yazı tipi bulunamadı';
}

// Path: settings.viewer
class _TranslationsSettingsViewerTrTr extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Görüntüleyici';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Ön yükleme miktarı';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Ön yükleme boyut sınırı';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'GB cinsinden, sınırsız için 0 yap';
  @override
  String get preloadHeightLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Ön yükleme yükseklik sınırı';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'Piksel cinsinden, sınırsız için 0 yap';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Görsel kalitesi';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Görüntüleyici kaydırma yönü';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Görüntüleyici araç çubuğu konumu';
  @override
  String get zoomButtonPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Yakınlaştırma butonu konumu';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Sayfa değiştirme butonları konumu';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'Görüntüleyiciyi açarken araç çubuğunu gizle';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Detayları varsayılan olarak genişlet';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Çeviri notlarını varsayılan olarak gizle';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Döndürmeyi etkinleştir';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Sıfırlamak için çift dokun';
  @override
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Araç çubuğu buton sırası';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Buton sırası';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Öge sırasını değiştirmek için basılı tut.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Bu listedeki en az 4 buton araç çubuğunda her zaman görünür olacak.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Diğer butonlar taşma (üç nokta) menüsüne gidecek.';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Ögeleri taşımak için basılı tut';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Sadece videolar için';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Bu buton devre dışı bırakılamaz';
  @override
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Varsayılan paylaşım eylemi';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Paylaşım eylemleri';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Sor: Ne paylaşılacağını her zaman sor';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Gönderi URL\'si';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- Dosya URL\'si: Doğrudan orijinal dosyanın bağlantısını paylaşır (bazı sitelerde çalışmayabilir)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Gönderi/Dosya URL\'si/Etiketli Dosya: Seçtiğin URL\'yi/dosyayı ve etiketleri paylaşır';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Dosya: Dosyanın kendisini paylaşır. Yüklenmesi biraz zaman alabilir, ilerleme durumu Paylaş butonunda gösterilecektir';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
      '- Hydrus: İçe aktarmak için gönderi URL\'sini Hydrus\'a gönderir';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Not]: Dosya önbelleğe kaydedilmişse oradan yüklenir. Aksi takdirde ağ üzerinden tekrar indirilir.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[İpucu]: Paylaş butonuna basılı tutarak Paylaşım Eylemleri menüsünü açabilirsin.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Kaydırmak için ses butonlarını kullan';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Ses butonlarıyla kaydırma';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Önizlemelerde ve görüntüleyicide kaydırmak için ses butonlarını kullan';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Ses Kısma: Sonraki öge';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Ses Açma: Önceki öge';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Görüntüleyicide:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - Araç çubuğu görünürken: Sesi kontrol eder';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Araç çubuğu gizliyken: Kaydırmayı kontrol eder';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Ses butonları kaydırma hızı';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Slayt gösterisi süresi (ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Slayt gösterisi';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
      '[Yapım Aşamasında] Videolar/GIF\'ler: Sadece manuel kaydırma';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Cihazın uyku moduna geçmesini engelle';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Görüntüleyici açılış/kapanış animasyonu';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Görüntüleyici sayfa değiştirme animasyonu';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Varsayılan animasyon kullanılıyor';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Özel animasyon kullanılıyor';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna yükleniyor GIF\'i';
  @override
  late final _TranslationsSettingsViewerImageQualityValuesTrTr imageQualityValues = _TranslationsSettingsViewerImageQualityValuesTrTr._(_root);
  @override
  late final _TranslationsSettingsViewerScrollDirectionValuesTrTr scrollDirectionValues = _TranslationsSettingsViewerScrollDirectionValuesTrTr._(
    _root,
  );
  @override
  late final _TranslationsSettingsViewerToolbarPositionValuesTrTr toolbarPositionValues = _TranslationsSettingsViewerToolbarPositionValuesTrTr._(
    _root,
  );
  @override
  late final _TranslationsSettingsViewerButtonPositionValuesTrTr buttonPositionValues = _TranslationsSettingsViewerButtonPositionValuesTrTr._(_root);
  @override
  late final _TranslationsSettingsViewerShareActionValuesTrTr shareActionValues = _TranslationsSettingsViewerShareActionValuesTrTr._(_root);
}

// Path: settings.video
class _TranslationsSettingsVideoTrTr extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Videoları devre dışı bırak';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Video yüklemeye çalışırken çöken düşük donanımlı cihazlar için kullanışlıdır. Bunun yerine videoyu harici bir oynatıcıda veya tarayıcıda izleme seçeneği sunar.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Videoları otomatik oynat';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Videoları sessiz başlat';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Deneysel]';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video oynatıcı altyapısı';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Varsayılan';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Exoplayer tabanlıdır. En iyi cihaz uyumluluğuna sahiptir ancak 4K videolarda, bazı kodeklerde veya eski cihazlarda sorun yaşatabilir';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Libmpv tabanlıdır, bazı kodek/cihaz sorunlarını çözmeye yardımcı olabilecek gelişmiş ayarlara sahiptir\n[ÇÖKMELERE NEDEN OLABİLİR]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Libmdk tabanlıdır, bazı kodekler/cihazlar için daha iyi performans sunabilir\n[ÇÖKMELERE NEDEN OLABİLİR]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Videolar düzgün çalışmazsa veya kodek hataları verirse aşağıdaki \'MPV\' ayarları için farklı değerler dene:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: Donanım hızlandırmayı kullan';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video önbellek modu';
  @override
  late final _TranslationsSettingsVideoCacheModesTrTr cacheModes = _TranslationsSettingsVideoCacheModesTrTr._(_root);
  @override
  late final _TranslationsSettingsVideoCacheModeValuesTrTr cacheModeValues = _TranslationsSettingsVideoCacheModeValuesTrTr._(_root);
  @override
  late final _TranslationsSettingsVideoVideoBackendModeValuesTrTr videoBackendModeValues = _TranslationsSettingsVideoVideoBackendModeValuesTrTr._(
    _root,
  );
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsTrTr extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Kuyruktaki sıradaki ögeden';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Dosyaları indirmek için lütfen depolama izni ver';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Hiçbir öge seçilmedi';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Kuyrukta öge yok';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Toplu işlem';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Seçilenleri indir';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
      'Seçilenlerden \'indirildi\' durumunu kaldır';
  @override
  String get favouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Seçilenleri favorilere ekle';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Seçilenleri favorilerden çıkar';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Seçilenleri temizle';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Veriler güncelleniyor…';
}

// Path: settings.database
class _TranslationsSettingsDatabaseTrTr extends TranslationsSettingsDatabaseEn {
  _TranslationsSettingsDatabaseTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Veritabanı';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Veritabanı dizine ekleniyor';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dizinler kaldırılıyor';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Veritabanını etkinleştir';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Dizinlemeyi etkinleştir';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Arama geçmişini etkinleştir';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Etiket türü çekmeyi etkinleştir';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Güncellenecek Sankaku türü';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Arama sorgusu';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(isteğe bağlı, işlemi yavaşlatabilir)';
  @override
  String get cantLeavePageNow => TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Şu an sayfadan ayrılamazsın!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Sankaku verileri güncelleniyor, bitmesini bekle veya sayfanın altından manuel olarak iptal et';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Lütfen bekle!';
  @override
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Dizinler değiştiriliyor';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Favorileri kaydeder ve İndirilen ögeleri izler';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'İndirilen ögeler yeniden indirilmez';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Veritabanı aramalarını hızlandırır ancak daha fazla disk alanı kullanır (2 kata kadar).\n\nDizin oluşturulurken sayfadan ayrılma veya uygulamayı kapatma.';
  @override
  String get createIndexesDebug =>
      TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Dizinleri Oluştur [Hata Ayıklama]';
  @override
  String get dropIndexesDebug =>
      TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Dizinleri Kaldır [Hata Ayıklama]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Veritabanının etkinleştirilmesini gerektirir.';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Son ${limit} aramayı kaydeder';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Eylemler için girişe dokun (Sil, Favorilere Ekle…)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Favoriye alınan sorgular listenin en üstüne sabitlenir ve sınıra dahil edilmez.';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Desteklenen booru\'lardan etiket türlerini çeker';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'İstek sınırı (rate limit) aşımına neden olabilir';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Veritabanını sil';
  @override
  String get deleteDatabaseConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Veritabanı silinsin mi?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Veritabanı silindi!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Uygulamanın yeniden başlatılması gerekiyor!';
  @override
  String get clearSnatchedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'İndirilen ögeleri temizle';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'İndirilen tüm ögeler temizlensin mi?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'İndirilen ögeler temizlendi';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Uygulamanın yeniden başlatılması gerekebilir!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Favoriye alınan ögeleri temizle';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Favoriye alınan tüm ögeler temizlensin mi?';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoriler temizlendi';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Arama geçmişini temizle';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Arama geçmişi temizlensin mi?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Arama geçmişi temizlendi';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku favorileri güncellemesi';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku favorileri güncellemesi başladı';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Favorilerindeki Sankaku ögeleri için yeni görsel URL\'leri çekilecek';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'İşlem tamamlanana veya durdurulana kadar bu sayfadan ayrılma';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Hiçbir Sankaku yapılandırması bulunamadı!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Sankaku favorileri güncellemesi tamamlandı';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Başarısız ögeleri temizleme işlemi başladı';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ?? 'Güncellenemeyen ögeler veritabanından kaldırılacak';
  @override
  String get updateSankakuUrls =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku URL\'lerini güncelle';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '${count} öge güncelleniyor:';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Kalan: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Tamamlanan: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Başarısız/Atlanan: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      '\'Başarısız\' sayısının sürekli arttığını görürsen durdur ve daha sonra tekrar dene: İstek sınırına ulaşmış olabilirsin veya Sankaku IP adresinden gelen istekleri engelliyor olabilir.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Şu anki ögeyi atlamak için buraya bas';
  @override
  String get useIfStuck =>
      TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Öge takılı kalmış gibi görünüyorsa kullan';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Durdurmak için buraya bas';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Başarısız ögeleri temizle (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? 'Başarısız ögeleri tekrar dene (${count})';
}

// Path: settings.backupAndRestore
class _TranslationsSettingsBackupAndRestoreTrTr extends TranslationsSettingsBackupAndRestoreEn {
  _TranslationsSettingsBackupAndRestoreTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Yedekle ve Geri Yükle';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Kopya dosya tespit edildi!';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      '${fileName} dosyası zaten mevcut. Üzerine yazmak istiyor musun? Hayır dersen yedekleme iptal edilecek.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Bu özellik yalnızca Android\'de mevcuttur. Masaüstü sürümlerinde dosyaları sistemine göre uygulamanın veri klasörüne kopyalayıp yapıştırabilirsin';
  @override
  String get selectBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Yedekleme dizinini seç';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Yedekleme yolu alınamadı';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Yedekleme yolu: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Hiçbir yedekleme dizini seçilmedi';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Dosyalar dizin kökünde olmalıdır';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Ayarları yedekle';
  @override
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Ayarları geri yükle';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Ayarlar settings.json dosyasına yedeklendi';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Ayarlar yedekten geri yüklendi';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Ayarlar yedeklenemedi';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Ayarlar geri yüklenemedi';
  @override
  String get resetBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Yedekleme dizinini sıfırla';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Booru\'ları yedekle';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Booru\'ları geri yükle';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru\'lar boorus.json dosyasına yedeklendi';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booru\'lar yedekten geri yüklendi';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Booru\'lar yedeklenemedi';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Booru\'lar geri yüklenemedi';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Veritabanını yedekle';
  @override
  String get restoreDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Veritabanını geri yükle';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Veritabanı boyutuna bağlı olarak biraz zaman alabilir: Başarılı olursa uygulama yeniden başlatılacaktır';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Veritabanı store.db dosyasına yedeklendi';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Veritabanı yedekten geri yüklendi! Uygulama birkaç saniye içinde yeniden başlatılacak!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Veritabanı yedeklenemedi';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Veritabanı geri yüklenemedi';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'Veritabanı dosyası bulunamadı veya okunamıyor!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Etiketleri yedekle';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Etiketleri geri yükle';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Çok fazla etiketin varsa biraz zaman alabilir. Eğer veritabanı geri yüklemesi yaptıysan buna gerek yoktur çünkü zaten veritabanına dahildir';
  @override
  String get tagsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Etiketler tags.json dosyasına yedeklendi';
  @override
  String get tagsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Etiketler yedekten geri yüklendi';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Etiketler yedeklenemedi';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Etiketler geri yüklenemedi';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Etiket dosyası bulunamadı veya okunamıyor!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Çok uzun sürerse aşağıdaki Gizle butonuna bas: İşlem arka planda devam edecektir';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'Yedekleme dosyası bulunamadı veya okunamıyor!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Yedekleme dizinine erişim yok!';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Yedekleme iptal edildi';
}

// Path: settings.network
class _TranslationsSettingsNetworkTrTr extends TranslationsSettingsNetworkEn {
  _TranslationsSettingsNetworkTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Ağ';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
      'Kendi imzalı SSL sertifikalarını etkinleştir';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Video akış modu için geçerli değildir, bunun yerine video önbellekleme modunu kullan';
  @override
  String get customUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Özel Kullanıcı Kimliği (User-Agent)';
  @override
  String get customUserAgentTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Özel Kullanıcı Kimliği (User-Agent)';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Varsayılan değeri kullanmak için boş bırak';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Varsayılan: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'Çoğu booru isteği ve web görünümü için kullanılır';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Sayfadan çıkışta kaydedilir';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Chrome tarayıcı Kullanıcı Kimliğini kullanmak için buraya dokun: Sadece site tarayıcı dışı kimlikleri engellediğinde önerilir';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Çerez temizleyici';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Çerezlerini temizlemek için bir booru seç veya hepsini temizlemek için boş bırak';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} için çerezler:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '«${cookieName}» çerezi silindi';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Çerezleri temizle';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? '${booruName} için çerezleri temizle';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      '${booruName} çerezleri silindi';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Tüm çerezler silindi';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyTrTr extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Gizlilik';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Uygulama kilidi';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Uygulamayı manuel olarak veya boşta kalma süresinden sonra kilitle: PIN veya biyometrik veri gerektirir';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Otomatik kilitleme süresi';
  @override
  String get autoLockAfterTip =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'Saniye cinsinden: devre dışı bırakmak için 0 yap';
  @override
  String get bluronLeave =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Uygulamadan ayrılırken ekranı bulanıklaştır';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Sistem kısıtlamaları nedeniyle bazı cihazlarda çalışmayabilir';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Gizli klavye';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Klavyenin yazma geçmişini kaydetmesini engeller.\nÇoğu metin girişi için geçerlidir';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Uygulama görünen adı';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Uygulama adının başlatıcıda nasıl görüneceğini değiştir';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Uygulama adı değiştirildi';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'Uygulama adı değişikliği uygulama yeniden başlatıldıktan sonra geçerli olacaktır. Bazı başlatıcılar için ek süre veya sistemin yeniden başlatılması gerekebilir.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'Uygulama adı değiştirilemedi: Lütfen tekrar dene.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Şimdi yeniden başlat';
}

// Path: settings.performance
class _TranslationsSettingsPerformanceTrTr extends TranslationsSettingsPerformanceEn {
  _TranslationsSettingsPerformanceTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performans';
  @override
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Düşük performans modu';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Eski ve düşük RAM\'li cihazlar için önerilir';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Düşük performans modu';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      'Ayrıntılı yükleme ilerleme bilgisini devre dışı bırakır';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      'Kaynak yoğunluklu ögeleri devre dışı bırakır (bulanıklaştırmalar: animasyonlu opaklık: bazı animasyonlar…)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Bu seçenekler için en uygun ayarları yapar (bunları daha sonra ayrı ayrı değiştirebilirsin):';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Videoları otomatik oynat';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Videoları devre dışı bırak';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Videoları yüklemeye çalışırken çöken düşük donanımlı cihazlar için kullanışlıdır: Bunun yerine videoyu harici bir oynatıcıda veya tarayıcıda izleme seçeneği sunar.';
}

// Path: settings.cache
class _TranslationsSettingsCacheTrTr extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'İndirme ve Önbelleğe Alma';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'İndirme kalitesi';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'İndirme bekleme süresi (ms)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Lütfen geçerli bir zaman aşımı değeri gir';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Lütfen 10ms\'den büyük bir değer gir';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'İndirme bildirimlerini göster';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Favorilere ekleyince ögeleri indir';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'İndirince ögeleri favorilere ekle';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Kaydederken görsel verilerini JSON\'a yaz';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Özel dizin gerektirir';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Depolama dizinini ayarla';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Mevcut: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Depolama dizinini sıfırla';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Önizlemeleri önbelleğe al';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Medyayı önbelleğe al';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video önbellek modu';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video önbellek modları';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      'Akış: Önbelleğe alma, mümkün olan en kısa sürede oynatmaya başla';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      'Önbellek: Dosyayı cihaz depolamasına kaydeder, yalnızca indirme tamamlandığında oynatır';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      'Akış+Önbellek: İkisinin karışımıdır ancak şu anda çift indirmeye yol açıyor';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Not]: Videolar yalnızca \'Medyayı Önbelleğe Al\' etkinleştirilirse önbelleğe alınır.';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Uyarı]: Masaüstünde Akış modu bazı Booru\'lar için hatalı çalışabilir.';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Şu süreden sonra önbelleği sil:';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Önbellek boyutu sınırı (GB)';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maksimum toplam önbellek boyutu';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Önbellek istatistikleri:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Yükleniyor…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Boş';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} dosya';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 dosya';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Toplam';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon\'lar';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Küçük Resimler';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Örnekler';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Medya';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Önbellek temizlendi';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} önbelleği temizlendi';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Tüm önbelleği temizle';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Önbellek tamamen temizlendi';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Uygulamanın yeniden başlatılması gerekebilir!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Hata!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Şu anda bu platform için mevcut değil';
}

// Path: settings.itemFilters
class _TranslationsSettingsItemFiltersTrTr extends TranslationsSettingsItemFiltersEn {
  _TranslationsSettingsItemFiltersTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtreler';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Gizlenenler';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'İşaretlenenler';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Kopya filtresi';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' zaten ${type} listesinde';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Filtre bulunamadı';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Hiçbir filtre eklenmedi';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Gizli filtrelerle eşleşen ögeleri tamamen gizle';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'İşaretli filtrelerle eşleşen ögeleri tamamen gizle';
  @override
  String get removeFavourited =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Favoriye alınan ögeleri kaldır';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'İndirilen ögeleri kaldır';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Yapay zeka (AI) ögelerini kaldır';
}

// Path: settings.sync
class _TranslationsSettingsSyncTrTr extends TranslationsSettingsSyncEn {
  _TranslationsSettingsSyncTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'LoliSync kullanmak için veritabanı etkinleştirilmelidir';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Hata!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Lütfen IP adresini ve portu gir.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Ne yapmak istediğini seç';
  @override
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'Başka bir cihaza veri GÖNDER';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'Başka bir cihazdan veri AL';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Diğer cihazda sunucuyu başlat, IP/port bilgilerini gir ve ardından Senkronizasyonu başlat\'a dokun';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP Adresi';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Ana Makine IP Adresi (örn. 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Ana Makine Portu (örn. 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Favorileri gönder';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoriler: ${count}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Favorileri gönder (Eski Sürüm)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Favorileri şuradan senkronize et: #…';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Senkronizasyonun nereden başlayacağını belirlemeni sağlar: tüm favorilerini daha önce senkronize ettiysen ve sadece en yeni ögeleri senkronize etmek istiyorsan kullanışlıdır';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? 'Baştan başlamak istiyorsan bu alanı boş bırak';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Örnek: X kadar favorin var, bu alanı 100 yaparsan senkronizasyon 100. ögeden başlar ve X\'e ulaşana kadar devam eder';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Favori sırası: En eskiden (0) en yeniye (X)';
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'İndirme geçmişini gönder';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'İndirilen: ${count}';
  @override
  String get syncSnatchedFrom =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'İndirilenleri şuradan senkronize et: #…';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Senkronizasyonun nereden başlayacağını belirlemeni sağlar: tüm indirme geçmişini daha önce senkronize ettiysen ve sadece en yeni ögeleri senkronize etmek istiyorsan kullanışlıdır';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ?? 'Baştan başlamak istiyorsan bu alanı boş bırak';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Örnek: X kadar favorin var, bu alanı 100 yaparsan senkronizasyon 100. ögeden başlar ve X\'e ulaşana kadar devam eder';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Favori sırası: En eskiden (0) en yeniye (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Ayarları gönder';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru yapılandırmalarını gönder';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Yapılandırmalar: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Sekmeleri gönder';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Sekmeler: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Sekme senkronizasyon modu';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Birleştir: Bu cihazdaki sekmeleri diğer cihazdakilerle birleştirir: bilinmeyen booru\'lara sahip sekmeler ve zaten mevcut olan sekmeler yok sayılır';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Değiştir: Diğer cihazdaki sekmeleri tamamen bu cihazdaki sekmelerle değiştirir';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Birleştir';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Değiştir';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Etiketleri gönder';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Etiketler: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Etiket senkronizasyon modu';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Türü koru: Eğer etiket diğer cihazda bir etiket türüyle mevcutsa ama bu cihazda mevcut değilse atlanır';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Üzerine yaz: Tüm etiketler eklenir: diğer cihazda bir etiket ve etiket türü varsa üzerine yazılır';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Türü koru';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Üzerine yaz';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Bağlantıyı test et';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Diğer cihaza test isteği gönderir.';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Başarı veya hata bildirimini gösterir.';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Senkronizasyonu başlat';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Port ve IP alanları boş bırakılamaz!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Senkronize etmek için hiçbir şey seçmedin!';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Bu cihazın istatistikleri:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Veri almak için sunucuyu başlat. Güvenlik için halka açık Wi-Fi ağlarından kaçın';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Kullanılabilir ağ arayüzleri';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Seçilen arayüz IP\'si: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Sunucu portu';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(boş bırakılırsa varsayılan \'8080\' olur)';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Alıcı sunucusunu başlat';
}

// Path: settings.about
class _TranslationsSettingsAboutTrTr extends TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Hakkında';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher açık kaynaklıdır ve GPLv3 ile lisanslanmıştır: Kaynak kodu GitHub\'da mevcuttur. Lütfen karşılaştığın sorunları veya özellik isteklerini deponun (repo) \'issues\' (sorunlar) kısmından bildir.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'GitHub\'da LoliSnatcher';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'İletişim';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-mail panoya kopyalandı';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Uygulama logosu için eserini kullanmamıza izin veren Showers-U\'ya koca bir teşekkürler: Lütfen Pixiv üzerinden ona göz atmayı unutma';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Geliştiriciler';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Yerelleştirme Uzmanları';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Sürümler';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'En güncel sürümü ve tüm sürüm notlarını GitHub Sürümler (Releases) sayfasında bulabilirsin:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Lisanslar';
}

// Path: settings.checkForUpdates
class _TranslationsSettingsCheckForUpdatesTrTr extends TranslationsSettingsCheckForUpdatesEn {
  _TranslationsSettingsCheckForUpdatesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Güncellemeleri denetle';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Güncelleme mevcut!';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Neler yeni';
  @override
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Güncelleme günlüğü';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Güncelleme denetleme hatası!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'En güncel sürümü kullanıyorsun';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'En son sürüm günlüğünü görüntüle';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Mevcut sürüm';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Sürüm Günlüğü (Changelog)';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Store\'u ziyaret et';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Sürümlere göz at';
}

// Path: settings.logs
class _TranslationsSettingsLogsTrTr extends TranslationsSettingsLogsEn {
  _TranslationsSettingsLogsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Kayıtlar';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Kayıtları paylaş';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Kayıtlar harici uygulama ile paylaşılsın mı?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[UYARI]: Kayıtlar hassas bilgiler içerebilir: Paylaşırken lütfen dikkatli ol!';
}

// Path: settings.help
class _TranslationsSettingsHelpTrTr extends TranslationsSettingsHelpEn {
  _TranslationsSettingsHelpTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Yardım';
}

// Path: settings.debug
class _TranslationsSettingsDebugTrTr extends TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Hata Ayıklama';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug modu etkinleştirildi!';
  @override
  String get disabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug modu devre dışı bırakıldı!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug modu zaten etkin!';
  @override
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Performans grafiğini göster';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPS grafiğini göster';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Görsel istatistiklerini göster';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Video istatistiklerini göster';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Görselleri bulanıklaştır + videoları sessize al [Yalnızca GELİŞTİRİCİ]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Listelerde sürükleyerek kaydırmayı etkinleştir [Yalnızca Masaüstü]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animasyon hızı (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Etiket Yöneticisi';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Çözünürlük: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Piksel oranı: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Kayıtlar';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Web görünümü (Webview)';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Tüm çerezleri sil';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Güvenli depolamayı temizle';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Oturum dizesini al';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Oturum dizesini ayarla';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Oturum dizesi';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Oturum dizeden geri yüklendi';
}

// Path: settings.logging
class _TranslationsSettingsLoggingTrTr extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Kayıtlar';
}

// Path: settings.webview
class _TranslationsSettingsWebviewTrTr extends TranslationsSettingsWebviewEn {
  _TranslationsSettingsWebviewTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Web görünümünü aç';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'oturum açmak veya çerezleri almak için';
}

// Path: settings.dirPicker
class _TranslationsSettingsDirPickerTrTr extends TranslationsSettingsDirPickerEn {
  _TranslationsSettingsDirPickerTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Dizin adı';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Bir dizin seç';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Bir dizin seçmeden seçiciyi kapatmak istiyor musun?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Hayır';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Evet';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Hata!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Dizin oluşturulamadı';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Dizin yazılabilir değil!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Yeni dizin';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Oluştur';
}

// Path: viewer.tutorial
class _TranslationsViewerTutorialTrTr extends TranslationsViewerTutorialEn {
  _TranslationsViewerTutorialTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Görseller';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Dokun/Uzun dokun: tam ekran modunu aç veya kapat';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Çift dokun: ekrana sığdır, orijinal boyut, yakınlaştırmayı sıfırla';
}

// Path: viewer.appBar
class _TranslationsViewerAppBarTrTr extends TranslationsViewerAppBarEn {
  _TranslationsViewerAppBarTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Slayt gösterisi başlatılamıyor';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Yüklenen son ögeye ulaşıldı';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Duraklat';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Başlat';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Favorilerden çıkar';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Seçimi kaldır';
  @override
  String get reloadWithScaling =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ölçeklendirme ile yeniden yükle';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Örnek kalitesinde yükle';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Yüksek kalitede yükle';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'İndirildi durumunu kaldır';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'İndirme durumunu ayarla';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'İndir';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(zorunlu)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus paylaşımı';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Hangi URL\'yi Hydrus ile paylaşmak istersin?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Gönderi URL\'si';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Dosya URL\'si';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus yapılandırılmamış!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Dosyayı paylaş';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Bu dosya paylaşım için zaten indiriliyor: iptal etmek istiyor musun?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Paylaşım için dosya zaten indiriliyor: mevcut dosyayı iptal edip yeni bir dosya mı paylaşmak istersin?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Mevcut:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Yeni:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Yenisini paylaş';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'İptal';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Hata!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Dosya paylaşılmadan önce kaydedilirken bir sorun oluştu';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Ne paylaşmak istersin?';
  @override
  String get postURLWithTags =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Etiketlerle beraber gönderi URL\'si';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Etiketlerle beraber dosya URL\'si';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Dosya';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Etiketlerle beraber dosya';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Etiketleri seç';
}

// Path: viewer.notes
class _TranslationsViewerNotesTrTr extends TranslationsViewerNotesEn {
  _TranslationsViewerNotesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Not';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notlar';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _TranslationsMediaLoadingTrTr extends TranslationsMediaLoadingEn {
  _TranslationsMediaLoadingTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'İşleniyor…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Önbellekten yükleniyor ve işleniyor…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Önbellekten yükleniyor…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Arabelleğe alınıyor (Buffering)…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Yükleniyor…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Yine de yükle';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Yüklemeyi yeniden başlat';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Yüklemeyi durdur';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '${seconds} sn önce başladı';
  @override
  late final _TranslationsMediaLoadingStopReasonsTrTr stopReasons = _TranslationsMediaLoadingStopReasonsTrTr._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Dosya sıfır bayt';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dosya boyutu: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Sık sık oynatma sorunu mu yaşıyorsun? [Ayarlar > Video > Video oynatıcı altyapısı] kısmını değiştirmeyi dene';
}

// Path: media.video
class _TranslationsMediaVideoTrTr extends TranslationsMediaVideoEn {
  _TranslationsMediaVideoTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videolar devre dışı veya desteklenmiyor';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Videoyu harici oynatıcıda aç';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Videoyu tarayıcıda aç';
  @override
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Öge verileri yüklenemedi';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Öge verileri yükleniyor…';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Tekrar dene';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Dosyayı tarayıcıda aç';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Gönderiyi tarayıcıda aç';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Şu an kontrol ediliyor:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Bilinmeyen dosya formatı (.${fileExt}): tarayıcıda açmak için buraya dokun';
}

// Path: preview.error
class _TranslationsPreviewErrorTrTr extends TranslationsPreviewErrorEn {
  _TranslationsPreviewErrorTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Sonuç yok';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Arama sorgusunu değiştir veya tekrar denemek için dokun';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Sona ulaştın';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Yüklenen sayfa sayısı: ${pageNum}\nSon sayfayı yeniden yüklemek için buraya dokun';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Sayfa #${pageNum} yükleniyor…';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
        seconds,
        one: '${seconds} saniye önce başladı',
        few: '${seconds} saniye önce başladı',
        many: '${seconds} saniye önce başladı',
        other: '${seconds} saniye önce başladı',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'İstek takılmış veya çok uzun sürmüş gibi görünüyorsa tekrar denemek için dokun';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Sayfa #${pageNum} yüklenirken hata oluştu';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tekrar denemek için buraya dokun';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Hata: hiçbir sonuç yüklenemedi';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tekrar denemek için buraya dokun';
}

// Path: settings.interface.previewQualityValues
class _TranslationsSettingsInterfacePreviewQualityValuesTrTr extends TranslationsSettingsInterfacePreviewQualityValuesEn {
  _TranslationsSettingsInterfacePreviewQualityValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Küçük Resim';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Örnek';
}

// Path: settings.interface.previewDisplayModeValues
class _TranslationsSettingsInterfacePreviewDisplayModeValuesTrTr extends TranslationsSettingsInterfacePreviewDisplayModeValuesEn {
  _TranslationsSettingsInterfacePreviewDisplayModeValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Kare';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Dikdörtgen';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Kademeli';
}

// Path: settings.interface.appModeValues
class _TranslationsSettingsInterfaceAppModeValuesTrTr extends TranslationsSettingsInterfaceAppModeValuesEn {
  _TranslationsSettingsInterfaceAppModeValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Masaüstü';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobil';
}

// Path: settings.interface.handSideValues
class _TranslationsSettingsInterfaceHandSideValuesTrTr extends TranslationsSettingsInterfaceHandSideValuesEn {
  _TranslationsSettingsInterfaceHandSideValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Sol';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Sağ';
}

// Path: settings.viewer.imageQualityValues
class _TranslationsSettingsViewerImageQualityValuesTrTr extends TranslationsSettingsViewerImageQualityValuesEn {
  _TranslationsSettingsViewerImageQualityValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Örnek';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Orijinal';
}

// Path: settings.viewer.scrollDirectionValues
class _TranslationsSettingsViewerScrollDirectionValuesTrTr extends TranslationsSettingsViewerScrollDirectionValuesEn {
  _TranslationsSettingsViewerScrollDirectionValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Yatay';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Dikey';
}

// Path: settings.viewer.toolbarPositionValues
class _TranslationsSettingsViewerToolbarPositionValuesTrTr extends TranslationsSettingsViewerToolbarPositionValuesEn {
  _TranslationsSettingsViewerToolbarPositionValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Üst';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Alt';
}

// Path: settings.viewer.buttonPositionValues
class _TranslationsSettingsViewerButtonPositionValuesTrTr extends TranslationsSettingsViewerButtonPositionValuesEn {
  _TranslationsSettingsViewerButtonPositionValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Devre dışı';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Sol';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Sağ';
}

// Path: settings.viewer.shareActionValues
class _TranslationsSettingsViewerShareActionValuesTrTr extends TranslationsSettingsViewerShareActionValuesEn {
  _TranslationsSettingsViewerShareActionValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Sor';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Gönderi URL\'si';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Etiketlerle Gönderi URL\'si';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'Dosya URL\'si';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'Etiketlerle Dosya URL\'si';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Dosya';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Etiketlerle Dosya';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _TranslationsSettingsVideoCacheModesTrTr extends TranslationsSettingsVideoCacheModesEn {
  _TranslationsSettingsVideoCacheModesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video önbellek modları';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Akış: Önbelleğe alma, mümkün olan en kısa sürede oynatmaya başla';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Önbellek: Dosyayı cihaz depolamasına kaydeder, yalnızca indirme tamamlandığında oynatır';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Akış+Önbellek: İkisinin karışımıdır ancak şu anda çift indirmeye yol açıyor';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Not]: Videolar yalnızca \'Medyayı Önbelleğe Al\' etkinleştirilirse önbelleğe alınır.';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Uyarı]: Masaüstünde Akış modu bazı Booru\'lar için hatalı çalışabilir.';
}

// Path: settings.video.cacheModeValues
class _TranslationsSettingsVideoCacheModeValuesTrTr extends TranslationsSettingsVideoCacheModeValuesEn {
  _TranslationsSettingsVideoCacheModeValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Akış';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Önbellek';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Akış+Önbellek';
}

// Path: settings.video.videoBackendModeValues
class _TranslationsSettingsVideoVideoBackendModeValuesTrTr extends TranslationsSettingsVideoVideoBackendModeValuesEn {
  _TranslationsSettingsVideoVideoBackendModeValuesTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Varsayılan';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _TranslationsMediaLoadingStopReasonsTrTr extends TranslationsMediaLoadingStopReasonsEn {
  _TranslationsMediaLoadingStopReasonsTrTr._(TranslationsTrTr root) : this._root = root, super.internal(root);

  final TranslationsTrTr _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser =>
      TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Kullanıcı tarafından durduruldu';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Yükleme hatası';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Dosya çok büyük';
  @override
  String get hiddenByFilters =>
      TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Filtreler tarafından gizlendi:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Video hatası';
}

/// The flat map containing all translations for locale <tr-TR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTrTr {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'tr-TR',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Türkçe',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Hata',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Hata!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Başarılı',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Başarılı!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'İptal',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Geri',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Daha Sonra',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Kapat',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'TAMAM',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Evet',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Hayır',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Bir saniye…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Göster',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Gizle',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Etkinleştir',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Devre Dışı Bırak',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Ekle',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Düzenle',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Kaldır',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Kaydet',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Sil',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Onayla',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Tekrar dene',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Temizle',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopyala',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopyalandı',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Panoya kopyalandı',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Sonuç yok',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Yapıştır',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopyalanamadı',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ayarlara git',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Bu işlem biraz zaman alabilir…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Uygulamadan çıkılsın mı?',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Uygulamayı kapat',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Geçersiz Bağlantı!',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Pano boş!',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Bağlantı açılamadı',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Anahtarı',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Kullanıcı ID',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Giriş',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Şifre',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Duraklat',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Devam',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Discord sunucumuzu ziyaret edin',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Öge',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seç',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Tümünü seç',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Sıfırla',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Aç',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Yeni sekmede aç',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Taşı',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Karıştır',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sırala',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Git',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Ara',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtre',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Veya (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Sayfa',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Sayfa #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Etiketler',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tür',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Ad',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Kullanıcı adı',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favoriler',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'İndirilen',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Lütfen bir değer gir',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Lütfen geçerli bir değer gir',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Lütfen bir sayı gir',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Lütfen geçerli bir sayı değeri gir',
          'validationErrors.tooSmall' =>
            ({required double min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ??
                'Lütfen ${min} değerinden daha büyük bir değer gir',
          'validationErrors.tooBig' =>
            ({required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ??
                'Lütfen ${max} değerinden daha küçük bir değer gir',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Lütfen ${min} ve ${max} arasında bir değer gir',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
                'Lütfen 0\'a eşit veya daha büyük bir değer gir',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Lütfen 4\'ten az olan bir değer gir',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Lütfen 100\'den büyük bir değer gir',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                '4 sütundan fazlasını kullanmak performansı etkileyebilir',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                '8 sütundan fazlasını kullanmak performansı etkileyebilir',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Başlatma hatası!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Proxy ayarlanıyor…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Veritabanı yükleniyor…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Booru\'lar yükleniyor…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Etiketler yükleniyor…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Sekmeler geri yükleniyor…',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Özel depolama dizinine erişilemiyor',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Uygulamaya erişim izni vermek için lütfen depolama dizinini tekrar ayarla',
          'permissions.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Mevcut yol: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Dizin ayarla',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Bu platformda kullanılamıyor',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Dizini sıfırla',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'Sıfırladıktan sonra dosyalar varsayılan dizine kaydedilecek',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
                'Uygulamayı kullanmak için kimliğini doğrula',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Biyometrik donanım bulunamadı',
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Geçici olarak kilitlendi',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Kimlik doğrulanırken bir hata oluştu: ${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Son sekme kaldırıldı',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Varsayılan etiketlere sıfırlanıyor',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Derecelendirmeler değiştirildi',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                '${booruType} üzerinde [rating:safe] artık [rating:general] ve [rating:sensitive] ile değiştirildi',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'Derecelendirme otomatik düzeltildi. Sonraki aramalarda doğru olanı kullanmayı unutma',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Sekmeler geri yüklendi',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: 'Önceki oturumdan ${count} sekme geri yüklendi',
                  few: 'Önceki oturumdan ${count} sekme geri yüklendi',
                  many: 'Önceki oturumdan ${count} sekme geri yüklendi',
                  other: 'Önceki oturumdan ${count} sekme geri yüklendi',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Geri yüklenen bazı sekmelerde bilinmeyen booru\'lar veya bozuk karakterler vardı.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
                'Bunlar varsayılana ayarlandı veya görmezden gelindi.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Bozuk sekmelerin listesi:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Sekmeler birleştirildi',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} yeni sekme eklendi',
                  few: '${count} yeni sekme eklendi',
                  many: '${count} yeni sekme eklendi',
                  other: '${count} yeni sekme eklendi',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Sekmeler değiştirildi',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} sekme alındı',
                  few: '${count} sekme alındı',
                  many: '${count} sekme alındı',
                  other: '${count} sekme alındı',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'İndirme Yöneticisi',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'İndirme geçmişi',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Etiket gir',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Miktar',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'İndirilecek dosya miktarı',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Gecikme (ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'İndirmeler arası gecikme',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Dosyaları indir',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Bu öge zaten daha önce indirilmiş',
          'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Öge indirilemedi',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Öge iptal edildi',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Sıradaki ögeye geçiliyor…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'İndirilen ögeler',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: 'İndirilen: ${count} öge',
                  few: 'İndirilen: ${count} öge',
                  many: 'İndirilen: ${count} öge',
                  other: 'İndirilen: ${count} öge',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} dosya zaten indirilmiş',
                  few: '${count} dosya zaten indirilmiş',
                  many: '${count} dosya zaten indirilmiş',
                  other: '${count} dosya zaten indirilmiş',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} dosya indirilemedi',
                  few: '${count} dosya indirilemedi',
                  many: '${count} dosya indirilemedi',
                  other: '${count} dosya indirilemedi',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} dosya iptal edildi',
                  few: '${count} dosya iptal edildi',
                  many: '${count} dosya iptal edildi',
                  other: '${count} dosya iptal edildi',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Görseller indiriliyor',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Uygulamayı kapatma!',
          'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Öge İndirme kuyruğuna eklendi',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} öge indirme kuyruğuna eklendi',
                  few: '${count} öge indirme kuyruğuna eklendi',
                  many: '${count} öge indirme kuyruğuna eklendi',
                  other: '${count} öge indirme kuyruğuna eklendi',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru modu',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
                'En az 2 yapılandırılmış booru gerektirir',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Ek booru\'ları seç:',
          'multibooru.akaMultibooruMode' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'diğer adıyla Multibooru modu',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dahil edilecek ikincil booru\'lar',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Hydrus\'a aktarılırken bir sorun oluştu',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Doğru API izinlerini vermemiş olabilirsin: Bu ayar Hizmetleri İncele (Review Services) kısmından düzenlenebilir',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dosyaya etiketleri ekle',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URL\'leri ekle',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Sekme',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Ayarlardan booru ekle',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Bir Booru seç',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'İkincil booru\'lar',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Yeni sekme ekle',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Bir booru seç veya boş bırak',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Konum ekle',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Önceki sekme',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Sonraki sekme',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Liste sonu',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Kullanılan sorgu',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Varsayılan',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Şu anki',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Özel',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Özel sorgu',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[boş]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'İkincil booru\'ları ekle',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'İkincil booru\'ları koru',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Özel sayfa numarasından başla',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Yeni sekmeye geç',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Ekle',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Sekme Yöneticisi',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Seçim modu',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sekmeleri sırala',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Yardım',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Sekmeleri sil',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Sekmeleri karıştır',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Sekmeler rastgele karıştırıldı',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Sekme sırası kaydedildi',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Mevcut sekmeye git',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Başa git',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Sona git',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Booru, durum veya kopyalara göre filtrele…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Kaydırma:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sıralama:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Varsayılan sekme sırası',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Alfabetik sırala',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Alfabetik sırala (tersten)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Booru adına göre alf. sırala',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Booru adına göre alf. sırala (tersten)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Güncel sırayı kaydetmek için sırala butonuna basılı tut',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Seç:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Seçim modunu değiştir',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Sayfanın altında: ',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Tüm sekmeleri seç/bırak',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Seçili sekmeleri sil',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Taşımak için bir sekmeye basılı tut',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Sekmenin sağ altındaki numaralar:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'İlk sayı: varsayılan liste sırasındaki sekme dizini',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'İkinci sayı: filtreleme veya sıralama etkinken şu anki listedeki sekme dizini',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Özel filtreler:',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Yüklendi» - ögeleri yüklenmiş sekmeleri gösterir',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '«Yüklenmedi» - yüklenmemiş veya sıfır ögesi olan sekmeleri gösterir',
          'tabs.notLoadedItalic' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Yüklenmemiş sekmeler italik metne sahiptir',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Sekme bulunamadı',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopyala',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Taşı',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Kaldır',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Karıştır',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sırala',
          'tabs.shuffleTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Sekme sırası rastgele karıştırılsın mı?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Sekmeler şu anki sıralamada kaydedilsin mi?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Booru\'ya göre',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetik',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(tersten)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} sekmeyi silmek istediğine emin misin?',
                  few: '${count} sekmeyi silmek istediğine emin misin?',
                  many: '${count} sekmeyi silmek istediğine emin misin?',
                  other: '${count} sekmeyi silmek istediğine emin misin?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Yüklendi',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Etiket türü',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Kopyalar',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Aynı Booru üzerindeki kopyaları kontrol et',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Boş arama sorgusu',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Sekme Filtreleri',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Hepsi',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Yüklenmedi',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Etkin',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Devre dışı',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Sıralamayı da etkinleştirecek',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Seçili türde en az bir etiket içeren sekmeleri filtrele',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Herhangi',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Uygula',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'En üste taşı',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'En alta taşı',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Sekme numarası',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Geçersiz sekme numarası',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Geçersiz giriş',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Aralık dışında',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Lütfen geçerli bir sekme numarası gir',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ??
                'Şuraya taşı: #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Önizleme:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Arama geçmişi',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Arama geçmişi boş',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Arama geçmişi devre dışı',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                'Arama geçmişi için ayarlardan veritabanını etkinleştir',
          'history.lastSearch' =>
            ({required String search}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Son arama: ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Son arama: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Bilinmeyen Booru türü!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ??
                'Bilinmeyen booru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Aç',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Yeni sekmede aç',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Favorilerden kaldır',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Favorilere ekle',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopyala',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Sil',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Geçmiş girdilerini sil',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} ögeyi silmek istediğine emin misin?',
                  few: '${count} ögeyi silmek istediğine emin misin?',
                  many: '${count} ögeyi silmek istediğine emin misin?',
                  other: '${count} ögeyi silmek istediğine emin misin?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Seçimi temizle',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} ögeyi sil',
                  few: '${count} ögeyi sil',
                  many: '${count} ögeyi sil',
                  other: '${count} ögeyi sil',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Bu cihazda desteklenmiyor',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Bir URL gir',
          'webview.navigation.enterCustomUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Özel URL gir',
          'webview.navigation.navigateTo' =>
            ({required String url}) =>
                TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Şu adrese git: ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Çerezleri listele',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Çerezleri temizle',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Çerezler vardı. Artık yoklar',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Favicon al',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Favicon bulunamadı',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(yukarıdaki metin seçilebilir)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URL\'yi kopyala',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL panoya kopyalandı',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Çerezler',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Geçmiş',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Geri gidilecek geçmiş ögesi yok',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'İleri gidilecek geçmiş ögesi yok',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ayarlar',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Dil',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistem',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Çeviriye katkıda bulun',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                'Detaylar için <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> adresini ziyaret et veya POEditor\'e gitmek için aşağıdaki görsele dokun',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru\'lar ve Arama',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Varsayılan etiketler',
          'settings.booru.itemsPerPage' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Sayfa başına getirilen öge sayısı',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Bazı booru\'lar bunu yok sayabilir',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru yapılandırması ekle',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booru yapılandırmasını paylaş',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                '${booruName} yapılandırmasını bağlantı olarak paylaş.\n\nGiriş bilgileri/API anahtarı dahil edilsin mi?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                '${booruName} yapılandırma bağlantısını panoya kopyala.\n\nGiriş bilgileri/API anahtarı dahil edilsin mi?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru paylaşımı',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                'Android 12 ve üzeri sürümlerde Booru yapılandırma bağlantılarını uygulamada otomatik olarak açmak için:\n1) Sistem uygulama bağlantısı varsayılan ayarlarını açmak için aşağıdaki butona dokun\n2) «Bağlantı ekle» kısmına dokun ve mevcut tüm seçenekleri seç',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Eklenen Booru\'lar',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Booru yapılandırmasını düzenle',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Panodan Booru yapılandırmasını içe aktar',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ??
                'Yalnızca loli.snatcher URL\'leri desteklenmektedir',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Booru yapılandırmasını sil',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Booru yapılandırması silinirken bir sorun oluştu!',
          'settings.booru.booruDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru yapılandırması silindi',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Seçili booru kaydedildikten sonra varsayılan olur.\n\nVarsayılan booru açılır listelerde ilk sırada görünür',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Varsayılan Booru değiştirilsin mi?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Şununla değiştir: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Mevcut olanı korumak için [Hayır] seçeneğine dokun: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Şuna geçmek için [Evet] seçeneğine dokun: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru yapılandırma bağlantısı panoya kopyalandı',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Hiçbir Booru seçilmedi!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Bu Booru silinemez!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Önce ilgili sekmeleri kaldır',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Düzenleyici',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru testi başarısız',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                'Yapılandırma parametreleri hatalı olabilir, booru API erişimine izin vermiyor olabilir, istek veri döndürmedi veya bir ağ hatası oluştu.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booru\'yu Kaydet',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Test çalıştırılıyor…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Bu Booru yapılandırması zaten mevcut',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Aynı ada sahip Booru yapılandırması zaten mevcut',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Aynı URL\'ye sahip Booru yapılandırması zaten mevcut',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Bu booru yapılandırması eklenmeyecek',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru yapılandırması kaydedildi',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'Değişikliklerin uygulanması için bu Booru\'ya sahip mevcut sekmelerin yeniden yüklenmesi gerekiyor!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Hydrus için API erişimi doğrulanamadı',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Erişim anahtarı istendi',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Hydrus üzerinden onay verip ardından uygula. Sonrasında \'Booru Testi\' yapabilirsin',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Erişim anahtarı alınamadı',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Hydrus\'ta istek penceresi açık mı?',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                'Hydrus anahtarını almak için Hydrus istemcisinde istek penceresini açman gerekir: Hizmetler > Hizmetleri incele > İstemci API > Ekle > API isteğinden (Services > Review services > Client API > Add > From API request)',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus API anahtarını al',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Adı',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Adı gerekli!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL\'si',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL\'si gerekli!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Türü',
          'settings.booruEditor.booruFavicon' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL\'si',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Boş bırakılırsa otomatik doldurulur)',
          'settings.booruEditor.booruDefTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Varsayılan etiketler',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Booru için varsayılan arama',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Aşağıdaki alanlar bazı booru\'lar için gerekli olabilir',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
                'Bu booru yapılandırmasını kaydetmeyi onayla',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Seçilen/Tespit edilen booru türü: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Arayüz',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Uygulama arayüz modu',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Uygulama arayüz modu',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Masaüstü modu kullanılsın mı? Mobilde sorunlara neden olabilir. (ESKİDİ/DESTEKLENMİYOR).',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobil: Normal Mobil Arayüzü',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Masaüstü: Ahoviewer Tarzı Arayüz (ESKİDİ, YENİDEN DÜZENLENMELİ)',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[Uyarı]: Bir telefonda Arayüz Modunu Masaüstü olarak ayarlama, uygulamayı bozabilirsin ve booru yapılandırmaları dahil tüm ayarlarını sıfırlamak zorunda kalabilirsin.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'El kullanımı',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Arayüz ögelerinin konumunu seçilen ele göre ayarlar',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Önizleme ızgarasında arama çubuğunu göster',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Arama görünümünde giriş alanını üste taşı',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Arama görünümü hızlı işlem paneli',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Arama girişine otomatik odaklan',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Titreşimi devre dışı bırak',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Devre dışı bırakılsa bile bazı işlemlerde hala titreşim olabilir',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Tahmini geri hareketi',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Önizleme sütunları (dikey)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Önizleme sütunları (yatay)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Önizleme kalitesi',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
                'Önizleme ızgarasındaki görsel çözünürlüğünü değiştirir',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Örnek: Orta çözünürlük, yüksek kalite yüklenirken uygulama yer tutucu olarak bir Küçük Resim kalitesi de yükler',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Küçük Resim: Düşük çözünürlük',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[Not]: Örnek kalitesi performansı gözle görülür şekilde düşürebilir: özellikle önizleme ızgarasında çok fazla sütun varsa',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Önizleme görünümü',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Yedek önizleme görünümü',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Kademeli (Staggered) seçeneği mümkün olmadığında bu kullanılacaktır',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Görselleri ölçeklendirme',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Performansı düşürebilir',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Uyarı',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Görsel ölçeklendirmeyi devre dışı bırakmak istediğine emin misin?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Bu durum, özellikle eski cihazlarda performansı olumsuz etkileyebilir',
          'settings.interface.gifThumbnails' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF küçük resimleri',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ??
                '«Görselleri ölçeklendirme» seçeneğini gerektirir',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ??
                'Önizleme kaydırma butonlarının konumu',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Fare tekerleği kaydırma çarpanı',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Kaydırma çarpanı',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Küçük Resim',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Örnek',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Kare',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Dikdörtgen',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Kademeli',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Masaüstü',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobil',
          'settings.interface.handSideValues.left' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Sol',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Sağ',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Tema',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Tema modu',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Siyah arka plan',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Dinamik renk kullan',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Yalnızca Android 12+',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Temalar',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Birincil renk',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'İkincil renk',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Menü maskotunu etkinleştir',
          'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Özel maskot ayarla',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Özel maskotu kaldır',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Mevcut maskot dizini',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistem',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Açık',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Koyu',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pembe',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Mor',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Mavi',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Turkuaz',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Kırmızı',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Yeşil',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Cadılar Bayramı',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Özel',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Renk seç',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Seçilen renk',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Seçilen renk ve tonları',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Yazı Tipi',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Sistem varsayılanı',
          'settings.theme.viewMoreFonts' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Daha fazla yazı tipi görüntüle',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Pijamalı hasta yağız şoföre çabucak güvendi',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Özel yazı tipi',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Bir Google Font adı gir',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Yazı tipi adı',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'fonts.google.com adresindeki fontlara göz at',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Yazı tipi bulunamadı',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Görüntüleyici',
          'settings.viewer.preloadAmount' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Ön yükleme miktarı',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Ön yükleme boyut sınırı',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'GB cinsinden, sınırsız için 0 yap',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Ön yükleme yükseklik sınırı',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'Piksel cinsinden, sınırsız için 0 yap',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Görsel kalitesi',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Görüntüleyici kaydırma yönü',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Görüntüleyici araç çubuğu konumu',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Yakınlaştırma butonu konumu',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Sayfa değiştirme butonları konumu',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Görüntüleyiciyi açarken araç çubuğunu gizle',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Detayları varsayılan olarak genişlet',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ??
                'Çeviri notlarını varsayılan olarak gizle',
          'settings.viewer.enableRotation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Döndürmeyi etkinleştir',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Sıfırlamak için çift dokun',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Araç çubuğu buton sırası',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Buton sırası',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Öge sırasını değiştirmek için basılı tut.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Bu listedeki en az 4 buton araç çubuğunda her zaman görünür olacak.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Diğer butonlar taşma (üç nokta) menüsüne gidecek.',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Ögeleri taşımak için basılı tut',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Sadece videolar için',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Bu buton devre dışı bırakılamaz',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Varsayılan paylaşım eylemi',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Paylaşım eylemleri',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Sor: Ne paylaşılacağını her zaman sor',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Gönderi URL\'si',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- Dosya URL\'si: Doğrudan orijinal dosyanın bağlantısını paylaşır (bazı sitelerde çalışmayabilir)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- Gönderi/Dosya URL\'si/Etiketli Dosya: Seçtiğin URL\'yi/dosyayı ve etiketleri paylaşır',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- Dosya: Dosyanın kendisini paylaşır. Yüklenmesi biraz zaman alabilir, ilerleme durumu Paylaş butonunda gösterilecektir',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus: İçe aktarmak için gönderi URL\'sini Hydrus\'a gönderir',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Not]: Dosya önbelleğe kaydedilmişse oradan yüklenir. Aksi takdirde ağ üzerinden tekrar indirilir.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[İpucu]: Paylaş butonuna basılı tutarak Paylaşım Eylemleri menüsünü açabilirsin.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Kaydırmak için ses butonlarını kullan',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Ses butonlarıyla kaydırma',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Önizlemelerde ve görüntüleyicide kaydırmak için ses butonlarını kullan',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Ses Kısma: Sonraki öge',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Ses Açma: Önceki öge',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Görüntüleyicide:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Araç çubuğu görünürken: Sesi kontrol eder',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Araç çubuğu gizliyken: Kaydırmayı kontrol eder',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Ses butonları kaydırma hızı',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Slayt gösterisi süresi (ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Slayt gösterisi',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
                '[Yapım Aşamasında] Videolar/GIF\'ler: Sadece manuel kaydırma',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Cihazın uyku moduna geçmesini engelle',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Görüntüleyici açılış/kapanış animasyonu',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Görüntüleyici sayfa değiştirme animasyonu',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Varsayılan animasyon kullanılıyor',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Özel animasyon kullanılıyor',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna yükleniyor GIF\'i',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Örnek',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Orijinal',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Yatay',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Dikey',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Üst',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Alt',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Devre dışı',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Sol',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Sağ',
          'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Sor',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Gönderi URL\'si',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Etiketlerle Gönderi URL\'si',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'Dosya URL\'si',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'Etiketlerle Dosya URL\'si',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Dosya',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Etiketlerle Dosya',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
          'settings.video.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Videoları devre dışı bırak',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                'Video yüklemeye çalışırken çöken düşük donanımlı cihazlar için kullanışlıdır. Bunun yerine videoyu harici bir oynatıcıda veya tarayıcıda izleme seçeneği sunar.',
          'settings.video.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Videoları otomatik oynat',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Videoları sessiz başlat',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Deneysel]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video oynatıcı altyapısı',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Varsayılan',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                'Exoplayer tabanlıdır. En iyi cihaz uyumluluğuna sahiptir ancak 4K videolarda, bazı kodeklerde veya eski cihazlarda sorun yaşatabilir',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                'Libmpv tabanlıdır, bazı kodek/cihaz sorunlarını çözmeye yardımcı olabilecek gelişmiş ayarlara sahiptir\n[ÇÖKMELERE NEDEN OLABİLİR]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Libmdk tabanlıdır, bazı kodekler/cihazlar için daha iyi performans sunabilir\n[ÇÖKMELERE NEDEN OLABİLİR]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Videolar düzgün çalışmazsa veya kodek hataları verirse aşağıdaki \'MPV\' ayarları için farklı değerler dene:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: Donanım hızlandırmayı kullan',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video önbellek modu',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video önbellek modları',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Akış: Önbelleğe alma, mümkün olan en kısa sürede oynatmaya başla',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Önbellek: Dosyayı cihaz depolamasına kaydeder, yalnızca indirme tamamlandığında oynatır',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Akış+Önbellek: İkisinin karışımıdır ancak şu anda çift indirmeye yol açıyor',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Not]: Videolar yalnızca \'Medyayı Önbelleğe Al\' etkinleştirilirse önbelleğe alınır.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Uyarı]: Masaüstünde Akış modu bazı Booru\'lar için hatalı çalışabilir.',
          'settings.video.cacheModeValues.stream' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Akış',
          'settings.video.cacheModeValues.cache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Önbellek',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Akış+Önbellek',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Varsayılan',
          _ => null,
        } ??
        switch (path) {
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Kuyruktaki sıradaki ögeden',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Dosyaları indirmek için lütfen depolama izni ver',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Hiçbir öge seçilmedi',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Kuyrukta öge yok',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Toplu işlem',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Seçilenleri indir',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Seçilenlerden \'indirildi\' durumunu kaldır',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Seçilenleri favorilere ekle',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Seçilenleri favorilerden çıkar',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Seçilenleri temizle',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Veriler güncelleniyor…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Veritabanı',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Veritabanı dizine ekleniyor',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dizinler kaldırılıyor',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Veritabanını etkinleştir',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Dizinlemeyi etkinleştir',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Arama geçmişini etkinleştir',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Etiket türü çekmeyi etkinleştir',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Güncellenecek Sankaku türü',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Arama sorgusu',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(isteğe bağlı, işlemi yavaşlatabilir)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Şu an sayfadan ayrılamazsın!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Sankaku verileri güncelleniyor, bitmesini bekle veya sayfanın altından manuel olarak iptal et',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Lütfen bekle!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Dizinler değiştiriliyor',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Favorileri kaydeder ve İndirilen ögeleri izler',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'İndirilen ögeler yeniden indirilmez',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                'Veritabanı aramalarını hızlandırır ancak daha fazla disk alanı kullanır (2 kata kadar).\n\nDizin oluşturulurken sayfadan ayrılma veya uygulamayı kapatma.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Dizinleri Oluştur [Hata Ayıklama]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Dizinleri Kaldır [Hata Ayıklama]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Veritabanının etkinleştirilmesini gerektirir.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Son ${limit} aramayı kaydeder',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                'Eylemler için girişe dokun (Sil, Favorilere Ekle…)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Favoriye alınan sorgular listenin en üstüne sabitlenir ve sınıra dahil edilmez.',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ??
                'Desteklenen booru\'lardan etiket türlerini çeker',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ??
                'İstek sınırı (rate limit) aşımına neden olabilir',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Veritabanını sil',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Veritabanı silinsin mi?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Veritabanı silindi!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Uygulamanın yeniden başlatılması gerekiyor!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'İndirilen ögeleri temizle',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'İndirilen tüm ögeler temizlensin mi?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'İndirilen ögeler temizlendi',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
                'Uygulamanın yeniden başlatılması gerekebilir!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Favoriye alınan ögeleri temizle',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ??
                'Favoriye alınan tüm ögeler temizlensin mi?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favoriler temizlendi',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Arama geçmişini temizle',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Arama geçmişi temizlensin mi?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Arama geçmişi temizlendi',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku favorileri güncellemesi',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Sankaku favorileri güncellemesi başladı',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Favorilerindeki Sankaku ögeleri için yeni görsel URL\'leri çekilecek',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'İşlem tamamlanana veya durdurulana kadar bu sayfadan ayrılma',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Hiçbir Sankaku yapılandırması bulunamadı!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Sankaku favorileri güncellemesi tamamlandı',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ??
                'Başarısız ögeleri temizleme işlemi başladı',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Güncellenemeyen ögeler veritabanından kaldırılacak',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku URL\'lerini güncelle',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '${count} öge güncelleniyor:',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Kalan: ${count}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Tamamlanan: ${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Başarısız/Atlanan: ${count}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                '\'Başarısız\' sayısının sürekli arttığını görürsen durdur ve daha sonra tekrar dene: İstek sınırına ulaşmış olabilirsin veya Sankaku IP adresinden gelen istekleri engelliyor olabilir.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Şu anki ögeyi atlamak için buraya bas',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Öge takılı kalmış gibi görünüyorsa kullan',
          'settings.database.pressToStop' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Durdurmak için buraya bas',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Başarısız ögeleri temizle (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Başarısız ögeleri tekrar dene (${count})',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Yedekle ve Geri Yükle',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Kopya dosya tespit edildi!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                '${fileName} dosyası zaten mevcut. Üzerine yazmak istiyor musun? Hayır dersen yedekleme iptal edilecek.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                'Bu özellik yalnızca Android\'de mevcuttur. Masaüstü sürümlerinde dosyaları sistemine göre uygulamanın veri klasörüne kopyalayıp yapıştırabilirsin',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Yedekleme dizinini seç',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Yedekleme yolu alınamadı',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Yedekleme yolu: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Hiçbir yedekleme dizini seçilmedi',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Dosyalar dizin kökünde olmalıdır',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Ayarları yedekle',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Ayarları geri yükle',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ??
                'Ayarlar settings.json dosyasına yedeklendi',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Ayarlar yedekten geri yüklendi',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Ayarlar yedeklenemedi',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Ayarlar geri yüklenemedi',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Yedekleme dizinini sıfırla',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Booru\'ları yedekle',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Booru\'ları geri yükle',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru\'lar boorus.json dosyasına yedeklendi',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booru\'lar yedekten geri yüklendi',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Booru\'lar yedeklenemedi',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Booru\'lar geri yüklenemedi',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Veritabanını yedekle',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Veritabanını geri yükle',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'Veritabanı boyutuna bağlı olarak biraz zaman alabilir: Başarılı olursa uygulama yeniden başlatılacaktır',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Veritabanı store.db dosyasına yedeklendi',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Veritabanı yedekten geri yüklendi! Uygulama birkaç saniye içinde yeniden başlatılacak!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Veritabanı yedeklenemedi',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Veritabanı geri yüklenemedi',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'Veritabanı dosyası bulunamadı veya okunamıyor!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Etiketleri yedekle',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Etiketleri geri yükle',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                'Çok fazla etiketin varsa biraz zaman alabilir. Eğer veritabanı geri yüklemesi yaptıysan buna gerek yoktur çünkü zaten veritabanına dahildir',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Etiketler tags.json dosyasına yedeklendi',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Etiketler yedekten geri yüklendi',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Etiketler yedeklenemedi',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Etiketler geri yüklenemedi',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
                'Etiket dosyası bulunamadı veya okunamıyor!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Çok uzun sürerse aşağıdaki Gizle butonuna bas: İşlem arka planda devam edecektir',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'Yedekleme dosyası bulunamadı veya okunamıyor!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Yedekleme dizinine erişim yok!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Yedekleme iptal edildi',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Ağ',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                'Kendi imzalı SSL sertifikalarını etkinleştir',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Video akış modu için geçerli değildir, bunun yerine video önbellekleme modunu kullan',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Özel Kullanıcı Kimliği (User-Agent)',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Özel Kullanıcı Kimliği (User-Agent)',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Varsayılan değeri kullanmak için boş bırak',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Varsayılan: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Çoğu booru isteği ve web görünümü için kullanılır',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Sayfadan çıkışta kaydedilir',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Chrome tarayıcı Kullanıcı Kimliğini kullanmak için buraya dokun: Sadece site tarayıcı dışı kimlikleri engellediğinde önerilir',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Çerez temizleyici',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Çerezlerini temizlemek için bir booru seç veya hepsini temizlemek için boş bırak',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} için çerezler:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                '«${cookieName}» çerezi silindi',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Çerezleri temizle',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                '${booruName} için çerezleri temizle',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                '${booruName} çerezleri silindi',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Tüm çerezler silindi',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Gizlilik',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Uygulama kilidi',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Uygulamayı manuel olarak veya boşta kalma süresinden sonra kilitle: PIN veya biyometrik veri gerektirir',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Otomatik kilitleme süresi',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'Saniye cinsinden: devre dışı bırakmak için 0 yap',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Uygulamadan ayrılırken ekranı bulanıklaştır',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Sistem kısıtlamaları nedeniyle bazı cihazlarda çalışmayabilir',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Gizli klavye',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Klavyenin yazma geçmişini kaydetmesini engeller.\nÇoğu metin girişi için geçerlidir',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Uygulama görünen adı',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Uygulama adının başlatıcıda nasıl görüneceğini değiştir',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Uygulama adı değiştirildi',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
                'Uygulama adı değişikliği uygulama yeniden başlatıldıktan sonra geçerli olacaktır. Bazı başlatıcılar için ek süre veya sistemin yeniden başlatılması gerekebilir.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Uygulama adı değiştirilemedi: Lütfen tekrar dene.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Şimdi yeniden başlat',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performans',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Düşük performans modu',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Eski ve düşük RAM\'li cihazlar için önerilir',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Düşük performans modu',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                'Ayrıntılı yükleme ilerleme bilgisini devre dışı bırakır',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                'Kaynak yoğunluklu ögeleri devre dışı bırakır (bulanıklaştırmalar: animasyonlu opaklık: bazı animasyonlar…)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Bu seçenekler için en uygun ayarları yapar (bunları daha sonra ayrı ayrı değiştirebilirsin):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Videoları otomatik oynat',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Videoları devre dışı bırak',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                'Videoları yüklemeye çalışırken çöken düşük donanımlı cihazlar için kullanışlıdır: Bunun yerine videoyu harici bir oynatıcıda veya tarayıcıda izleme seçeneği sunar.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'İndirme ve Önbelleğe Alma',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'İndirme kalitesi',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'İndirme bekleme süresi (ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Lütfen geçerli bir zaman aşımı değeri gir',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Lütfen 10ms\'den büyük bir değer gir',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'İndirme bildirimlerini göster',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Favorilere ekleyince ögeleri indir',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'İndirince ögeleri favorilere ekle',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Kaydederken görsel verilerini JSON\'a yaz',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Özel dizin gerektirir',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Depolama dizinini ayarla',
          'settings.cache.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Mevcut: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Depolama dizinini sıfırla',
          'settings.cache.cachePreviews' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Önizlemeleri önbelleğe al',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Medyayı önbelleğe al',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video önbellek modu',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video önbellek modları',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                'Akış: Önbelleğe alma, mümkün olan en kısa sürede oynatmaya başla',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                'Önbellek: Dosyayı cihaz depolamasına kaydeder, yalnızca indirme tamamlandığında oynatır',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                'Akış+Önbellek: İkisinin karışımıdır ancak şu anda çift indirmeye yol açıyor',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Not]: Videolar yalnızca \'Medyayı Önbelleğe Al\' etkinleştirilirse önbelleğe alınır.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Uyarı]: Masaüstünde Akış modu bazı Booru\'lar için hatalı çalışabilir.',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Şu süreden sonra önbelleği sil:',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Önbellek boyutu sınırı (GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maksimum toplam önbellek boyutu',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Önbellek istatistikleri:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Yükleniyor…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Boş',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} dosya',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 dosya',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Toplam',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon\'lar',
          'settings.cache.cacheTypeThumbnails' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Küçük Resimler',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Örnekler',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Medya',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Önbellek temizlendi',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} önbelleği temizlendi',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Tüm önbelleği temizle',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Önbellek tamamen temizlendi',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Uygulamanın yeniden başlatılması gerekebilir!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Hata!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Şu anda bu platform için mevcut değil',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtreler',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Gizlenenler',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'İşaretlenenler',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Kopya filtresi',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' zaten ${type} listesinde',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Filtre bulunamadı',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Hiçbir filtre eklenmedi',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Gizli filtrelerle eşleşen ögeleri tamamen gizle',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'İşaretli filtrelerle eşleşen ögeleri tamamen gizle',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Favoriye alınan ögeleri kaldır',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'İndirilen ögeleri kaldır',
          'settings.itemFilters.removeAI' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Yapay zeka (AI) ögelerini kaldır',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'LoliSync kullanmak için veritabanı etkinleştirilmelidir',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Hata!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Lütfen IP adresini ve portu gir.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Ne yapmak istediğini seç',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'Başka bir cihaza veri GÖNDER',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'Başka bir cihazdan veri AL',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Diğer cihazda sunucuyu başlat, IP/port bilgilerini gir ve ardından Senkronizasyonu başlat\'a dokun',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP Adresi',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Ana Makine IP Adresi (örn. 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port',
          'settings.sync.portPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Ana Makine Portu (örn. 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Favorileri gönder',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favoriler: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Favorileri gönder (Eski Sürüm)',
          'settings.sync.syncFavsFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Favorileri şuradan senkronize et: #…',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                'Senkronizasyonun nereden başlayacağını belirlemeni sağlar: tüm favorilerini daha önce senkronize ettiysen ve sadece en yeni ögeleri senkronize etmek istiyorsan kullanışlıdır',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? 'Baştan başlamak istiyorsan bu alanı boş bırak',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Örnek: X kadar favorin var, bu alanı 100 yaparsan senkronizasyon 100. ögeden başlar ve X\'e ulaşana kadar devam eder',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Favori sırası: En eskiden (0) en yeniye (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'İndirme geçmişini gönder',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'İndirilen: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'İndirilenleri şuradan senkronize et: #…',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                'Senkronizasyonun nereden başlayacağını belirlemeni sağlar: tüm indirme geçmişini daha önce senkronize ettiysen ve sadece en yeni ögeleri senkronize etmek istiyorsan kullanışlıdır',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Baştan başlamak istiyorsan bu alanı boş bırak',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                'Örnek: X kadar favorin var, bu alanı 100 yaparsan senkronizasyon 100. ögeden başlar ve X\'e ulaşana kadar devam eder',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Favori sırası: En eskiden (0) en yeniye (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Ayarları gönder',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru yapılandırmalarını gönder',
          'settings.sync.configsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Yapılandırmalar: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Sekmeleri gönder',
          'settings.sync.tabsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Sekmeler: ${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Sekme senkronizasyon modu',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                'Birleştir: Bu cihazdaki sekmeleri diğer cihazdakilerle birleştirir: bilinmeyen booru\'lara sahip sekmeler ve zaten mevcut olan sekmeler yok sayılır',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Değiştir: Diğer cihazdaki sekmeleri tamamen bu cihazdaki sekmelerle değiştirir',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Birleştir',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Değiştir',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Etiketleri gönder',
          'settings.sync.tagsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Etiketler: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Etiket senkronizasyon modu',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Türü koru: Eğer etiket diğer cihazda bir etiket türüyle mevcutsa ama bu cihazda mevcut değilse atlanır',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Üzerine yaz: Tüm etiketler eklenir: diğer cihazda bir etiket ve etiket türü varsa üzerine yazılır',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Türü koru',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Üzerine yaz',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Bağlantıyı test et',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Diğer cihaza test isteği gönderir.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Başarı veya hata bildirimini gösterir.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Senkronizasyonu başlat',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Port ve IP alanları boş bırakılamaz!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Senkronize etmek için hiçbir şey seçmedin!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Bu cihazın istatistikleri:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Veri almak için sunucuyu başlat. Güvenlik için halka açık Wi-Fi ağlarından kaçın',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Kullanılabilir ağ arayüzleri',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Seçilen arayüz IP\'si: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Sunucu portu',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(boş bırakılırsa varsayılan \'8080\' olur)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Alıcı sunucusunu başlat',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Hakkında',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                'LoliSnatcher açık kaynaklıdır ve GPLv3 ile lisanslanmıştır: Kaynak kodu GitHub\'da mevcuttur. Lütfen karşılaştığın sorunları veya özellik isteklerini deponun (repo) \'issues\' (sorunlar) kısmından bildir.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'GitHub\'da LoliSnatcher',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'İletişim',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'E-mail panoya kopyalandı',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                'Uygulama logosu için eserini kullanmamıza izin veren Showers-U\'ya koca bir teşekkürler: Lütfen Pixiv üzerinden ona göz atmayı unutma',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Geliştiriciler',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Yerelleştirme Uzmanları',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Sürümler',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'En güncel sürümü ve tüm sürüm notlarını GitHub Sürümler (Releases) sayfasında bulabilirsin:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Lisanslar',
          'settings.checkForUpdates.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Güncellemeleri denetle',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Güncelleme mevcut!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Neler yeni',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Güncelleme günlüğü',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Güncelleme denetleme hatası!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'En güncel sürümü kullanıyorsun',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'En son sürüm günlüğünü görüntüle',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Mevcut sürüm',
          'settings.checkForUpdates.changelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Sürüm Günlüğü (Changelog)',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Store\'u ziyaret et',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Sürümlere göz at',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Kayıtlar',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Kayıtları paylaş',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Kayıtlar harici uygulama ile paylaşılsın mı?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[UYARI]: Kayıtlar hassas bilgiler içerebilir: Paylaşırken lütfen dikkatli ol!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Yardım',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Hata Ayıklama',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug modu etkinleştirildi!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug modu devre dışı bırakıldı!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug modu zaten etkin!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Performans grafiğini göster',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPS grafiğini göster',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Görsel istatistiklerini göster',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Video istatistiklerini göster',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Görselleri bulanıklaştır + videoları sessize al [Yalnızca GELİŞTİRİCİ]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Listelerde sürükleyerek kaydırmayı etkinleştir [Yalnızca Masaüstü]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animasyon hızı (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Etiket Yöneticisi',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Çözünürlük: ${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Piksel oranı: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Kayıtlar',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Web görünümü (Webview)',
          'settings.debug.deleteAllCookies' => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Tüm çerezleri sil',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Güvenli depolamayı temizle',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Oturum dizesini al',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Oturum dizesini ayarla',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Oturum dizesi',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Oturum dizeden geri yüklendi',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Kayıtlar',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Web görünümünü aç',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'oturum açmak veya çerezleri almak için',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Dizin adı',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Bir dizin seç',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Bir dizin seçmeden seçiciyi kapatmak istiyor musun?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Hayır',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Evet',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Hata!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Dizin oluşturulamadı',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Dizin yazılabilir değil!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Yeni dizin',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Oluştur',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Sürüm',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Yorumlar',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Yorum yok',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                'Bu Booru\'da yorum yok veya yorumlar için bir API bulunmuyor',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Sayfa değiştirici',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Sayfa #',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Yüklemeler arası gecikme (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'ms cinsinden gecikme',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Mevcut sayfa #${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Olası maks. sayfa #~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Arama şu an devam ediyor!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Sayfaya atla',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Sayfaya kadar ara',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Aramayı durdur',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Boş girdi!',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Yeni ${type} filtresi ekle]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Yeni ${type} etiket filtresi',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Yeni filtre',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Filtreyi düzenle',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Etiketler',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Etiket ekle',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Ad',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tür',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Ekle',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ??
                'Şu süreden sonra eskir: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Sekme eklendi',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Sekme ekle',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopyala',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Eskimiş olarak işaretle',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Eskimeyi sıfırla',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Eskimez yap',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: '${count} etiketi sil',
                  few: '${count} etiketi sil',
                  many: '${count} etiketi sil',
                  other: '${count} etiketi sil',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Etiketleri sil',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Seçimi temizle',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Doğrulamak için dokun',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'GELİŞTİRİCİ KİLİDİNİ AÇ',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '[TEST]: Uygulamanın kilidini normal yollarla açamıyorsan buraya bas. Cihazınla ilgili detayları geliştiriciye bildir.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Senkronizasyonu durdurmak istiyor musun?',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Sunucuyu durdurmak istiyor musun?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Bağlantı yok',
          'loliSync.waitingForConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Bağlantı bekleniyor…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Sunucu başlatılıyor…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Ekranı uyanık tut',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync sunucusu kapatıldı',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Test hatası: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Test hatası: ${error}',
          'loliSync.testSuccess' => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Test isteği olumlu yanıt aldı',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Diğer cihazda bir \'Test\' mesajı görünmelidir',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Görsel arama',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Etiketler',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Yorumlar',
          'tagView.showNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Notları göster (${count})',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Notları gizle (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Notları yükle',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Bu etiket zaten mevcut arama sorgusunda:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Mevcut arama sorgusuna eklendi:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Yeni sekme eklendi:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Gönderi URL\'si',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Paylaşılma',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detaylar',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Dosya adı',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Uzantı',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Çözünürlük',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Boyut',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Derecelendirme',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Puan',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Etiket bulunamadı',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopyala',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Aramadan kaldır',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Aramaya ekle',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Arama çubuğuna eklendi:',
          'tagView.addToSearchExclude' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Aramaya ekle (Hariç tut)',
          'tagView.addedToSearchBarExclude' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Arama çubuğuna eklendi (Hariç tut):',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'İşaretlenenlere ekle',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Gizlenenlere ekle',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'İşaretlenenlerden kaldır',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Gizlenenlerden kaldır',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Etiketi düzenle',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Kaynak',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Önizleme',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Yüklenecek bir booru seç',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Önizleme yükleniyor…',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Önizleme yüklenemedi',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tekrar denemek için dokun',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Dosya URL\'si panoya kopyalandı',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Etiket önizlemeleri',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Mevcut durum',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Geçmiş',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Önizleme sayfası yüklenemedi',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Tekrar dene',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Tespit edilen bağlantılar:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'İlgili sekmeler',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Sadece bu etiketi içeren sekmeler',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
                'Sadece bu etiketi içeren ama farklı booru\'daki sekmeler',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Bu etiketi kapsayan sekmeler',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Sabitlenmiş etiketler',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Etiketi sabitle',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Sabitlemeyi kaldır',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Sabitle',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Kaldır',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» hızlı erişime sabitlensin mi?',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ??
                '«${tag}» sabitlenmiş etiketlerden kaldırılsın mı?',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Sadece ${name} için',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Etiketler (isteğe bağlı)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Bir etiket dahil etmek için yaz ve Ekle butonuna bas',
          'pinnedTags.selectExistingLabel' => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Mevcut etiketi seç',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Etiket sabitlendi',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                '${name} için sabitlendi: ${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ??
                'Global olarak sabitlendi: ${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Etiketin sabitlemesi kaldırıldı',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Hepsi',
          'pinnedTags.reorderPinnedTags' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Sabitlenmiş etiketleri yeniden sırala',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Kaydediliyor…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Yeniden sırala',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Etiketi manuel ekle',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Aramayla eşleşen etiket yok',
          'pinnedTags.noPinnedTagsYet' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Henüz sabitlenmiş etiket yok',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Etiketleri düzenle',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Etiketler',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Sabitlenmiş etiket ekle',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Etiket sorgusu',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'etiket_adi',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
                'Boşluk içeren etiketler dahil her türlü arama sorgusunu girebilirsin',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Etiketlerde ara',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Öneriler yüklenemedi. Tekrar denemek için dokun: ${msg}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Öneri bulunamadı',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Bu booru için etiket önerileri kullanılamıyor',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '«${tag}» panoya kopyalandı',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Önek',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Hariç tut (:)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Meta etiketler',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Sayımdan muaf meta etiketler',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Sayımdan muaf meta etiketler, etiket arama sınırına dahil edilmez',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Muaf',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Tekli',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Aralık',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popüler',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Tarih seç',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Tarih aralığı seç',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Geçmiş',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Web görünümü için booru seç',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Uygulamayı kilitle',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Dosya zaten mevcut',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'İndirme başarısız',
          'mobileHome.cancelledByUser' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Kullanıcı tarafından iptal edildi',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Yine de kaydet',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Atla',
          'mobileHome.retryAll' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Hepsini tekrar dene (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Mevcut, başarısız veya iptal edilen ögeler',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Tüm tekrar denenebilir ögeleri temizle',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'İndirme Yöneticisi',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Ayarlardan booru ekle',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Ayarlar',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Kaydet',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Hiçbir öge seçilmedi',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Öge yok',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Hiçbir öge seçilmedi',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Kapat',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Hiçbir booru yapılandırması bulunamadı',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Yeni Booru ekle',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Yardım',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Ayarlar',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Önceki oturum geri yükleniyor…',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Dosya URL\'si panoya kopyalandı!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Görseller',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
                'Dokun/Uzun dokun: tam ekran modunu aç veya kapat',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Çift dokun: ekrana sığdır, orijinal boyut, yakınlaştırmayı sıfırla',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Slayt gösterisi başlatılamıyor',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Yüklenen son ögeye ulaşıldı',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Duraklat',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Başlat',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Favorilerden çıkar',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Seçimi kaldır',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ölçeklendirme ile yeniden yükle',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Örnek kalitesinde yükle',
          _ => null,
        } ??
        switch (path) {
          'viewer.appBar.loadHighQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Yüksek kalitede yükle',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'İndirildi durumunu kaldır',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'İndirme durumunu ayarla',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'İndir',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(zorunlu)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus paylaşımı',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Hangi URL\'yi Hydrus ile paylaşmak istersin?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Gönderi URL\'si',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Dosya URL\'si',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus yapılandırılmamış!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Dosyayı paylaş',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Bu dosya paylaşım için zaten indiriliyor: iptal etmek istiyor musun?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Paylaşım için dosya zaten indiriliyor: mevcut dosyayı iptal edip yeni bir dosya mı paylaşmak istersin?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Mevcut:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Yeni:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Yenisini paylaş',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'İptal',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Hata!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Dosya paylaşılmadan önce kaydedilirken bir sorun oluştu',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Ne paylaşmak istersin?',
          'viewer.appBar.postURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Etiketlerle beraber gönderi URL\'si',
          'viewer.appBar.fileURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Etiketlerle beraber dosya URL\'si',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Dosya',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Etiketlerle beraber dosya',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Etiketleri seç',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Not',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notlar',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Bir booru seç',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru ögesi panoya kopyalandı',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'İndirilsin mi?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Gönderi URL\'si yok!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Dosya yükleniyor…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Bu biraz zaman alabilir, lütfen bekle…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  count,
                  one: 'Kaynak',
                  other: 'Kaynaklar',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'İndir',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favori',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Bilgi',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Paylaş',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Seç',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Tarayıcıda aç',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Slayt gösterisi',
          'galleryButtons.reloadNoScale' =>
            TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Ölçeklendirmeyi değiştir',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Kaliteyi değiştir',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Harici oynatıcı',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Görsel arama',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'İşleniyor…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Önbellekten yükleniyor ve işleniyor…',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Önbellekten yükleniyor…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Arabelleğe alınıyor (Buffering)…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Yükleniyor…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Yine de yükle',
          'media.loading.restartLoading' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Yüklemeyi yeniden başlat',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Yüklemeyi durdur',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '${seconds} sn önce başladı',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Kullanıcı tarafından durduruldu',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Yükleme hatası',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Dosya çok büyük',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Filtreler tarafından gizlendi:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Video hatası',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Dosya sıfır bayt',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dosya boyutu: ${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Sık sık oynatma sorunu mu yaşıyorsun? [Ayarlar > Video > Video oynatıcı altyapısı] kısmını değiştirmeyi dene',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videolar devre dışı veya desteklenmiyor',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Videoyu harici oynatıcıda aç',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Videoyu tarayıcıda aç',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Öge verileri yüklenemedi',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Öge verileri yükleniyor…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Tekrar dene',
          'media.video.openFileInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Dosyayı tarayıcıda aç',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Gönderiyi tarayıcıda aç',
          'media.video.currentlyChecking' =>
            TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Şu an kontrol ediliyor:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Bilinmeyen dosya formatı (.${fileExt}): tarayıcıda açmak için buraya dokun',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktif: ${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Bekleyen: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Toplam: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Boyut: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Maks.: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Sonuç yok',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
                'Arama sorgusunu değiştir veya tekrar denemek için dokun',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Sona ulaştın',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Yüklenen sayfa sayısı: ${pageNum}\nSon sayfayı yeniden yüklemek için buraya dokun',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Sayfa #${pageNum} yükleniyor…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(
                  seconds,
                  one: '${seconds} saniye önce başladı',
                  few: '${seconds} saniye önce başladı',
                  many: '${seconds} saniye önce başladı',
                  other: '${seconds} saniye önce başladı',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'İstek takılmış veya çok uzun sürmüş gibi görünüyorsa tekrar denemek için dokun',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Sayfa #${pageNum} yüklenirken hata oluştu',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tekrar denemek için buraya dokun',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Hata: hiçbir sonuç yüklenemedi',
          'preview.error.tapToRetry' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tekrar denemek için buraya dokun',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Sanatçı',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Karakter',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Telif Hakkı',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Tür',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Yok (Genel)',
          _ => null,
        };
  }
}
