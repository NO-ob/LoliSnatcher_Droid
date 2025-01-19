/// Generated file. Do not edit.
///
/// Source: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 454 (227 per locale)

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'strings_ru.g.dart' deferred as l_ru;
part 'strings_en.g.dart';

/// Generated by the "Translation Overrides" feature.
/// This config is needed to recreate the translation model exactly
/// the same way as this file was created.
final _buildConfig = BuildModelConfig(
  fallbackStrategy: FallbackStrategy.baseLocale,
  keyCase: null,
  keyMapCase: null,
  paramCase: null,
  sanitization: SanitizationConfig(enabled: true, prefix: 'k', caseStyle: CaseStyle.camel),
  stringInterpolation: StringInterpolation.braces,
  maps: [],
  pluralAuto: PluralAuto.cardinal,
  pluralParameter: 'n',
  pluralCardinal: [],
  pluralOrdinal: [],
  contexts: [],
  interfaces: [], // currently not supported
);

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en'),
  ru(languageCode: 'ru');

  const AppLocale({
    required this.languageCode,
    this.scriptCode, // ignore: unused_element
    this.countryCode, // ignore: unused_element
  });

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;

  @override
  Future<Translations> build({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) async {
    switch (this) {
      case AppLocale.en:
        return TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.ru:
        await l_ru.loadLibrary();
        return l_ru.TranslationsRu(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  @override
  Translations buildSync({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) {
    switch (this) {
      case AppLocale.en:
        return TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.ru:
        return l_ru.TranslationsRu(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations => LocaleSettings.instance.getTranslations(this);
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of loc).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = loc.someKey.anotherKey;
/// String b = loc['someKey.anotherKey']; // Only for edge cases!
Translations get loc => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final loc = Translations.of(context); // Get loc variable.
/// String a = loc.someKey.anotherKey; // Use loc variable.
/// String b = loc['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.loc.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get loc => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._()
      : super(
          utils: AppLocaleUtils.instance,
          lazy: true,
        );

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static Future<AppLocale> setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static Future<AppLocale> setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
  static Future<AppLocale> useDeviceLocale() => instance.useDeviceLocale();
  static Future<void> setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
  static Future<void> overrideTranslations({required AppLocale locale, required FileType fileType, required String content}) =>
      instance.overrideTranslations(locale: locale, fileType: fileType, content: content);
  static Future<void> overrideTranslationsFromMap({required AppLocale locale, required bool isFlatMap, required Map map}) =>
      instance.overrideTranslationsFromMap(locale: locale, isFlatMap: isFlatMap, map: map);

  // synchronous versions
  static AppLocale setLocaleSync(AppLocale locale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleSync(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRawSync(String rawLocale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRawSync(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
  static void setPluralResolverSync({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) =>
      instance.setPluralResolverSync(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
  static void overrideTranslationsSync({required AppLocale locale, required FileType fileType, required String content}) =>
      instance.overrideTranslationsSync(locale: locale, fileType: fileType, content: content);
  static void overrideTranslationsFromMapSync({required AppLocale locale, required bool isFlatMap, required Map map}) =>
      instance.overrideTranslationsFromMapSync(locale: locale, isFlatMap: isFlatMap, map: map);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(
          baseLocale: AppLocale.en,
          locales: AppLocale.values,
          buildConfig: _buildConfig,
        );

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) =>
      instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static Future<Translations> buildWithOverrides(
          {required AppLocale locale,
          required FileType fileType,
          required String content,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.buildWithOverrides(
          locale: locale, fileType: fileType, content: content, cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
  static Future<Translations> buildWithOverridesFromMap(
          {required AppLocale locale,
          required bool isFlatMap,
          required Map map,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.buildWithOverridesFromMap(
          locale: locale, isFlatMap: isFlatMap, map: map, cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
  static Translations buildWithOverridesSync(
          {required AppLocale locale,
          required FileType fileType,
          required String content,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.buildWithOverridesSync(
          locale: locale, fileType: fileType, content: content, cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
  static Translations buildWithOverridesFromMapSync(
          {required AppLocale locale,
          required bool isFlatMap,
          required Map map,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.buildWithOverridesFromMapSync(
          locale: locale, isFlatMap: isFlatMap, map: map, cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
}