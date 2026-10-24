import 'package:intl/intl.dart';
import 'package:slang/slang.dart' show PluralResolver;

// CLDR categories for the languages in assets/i18n, shared with cleanup.
class LocalizationPluralRules {
  static const categories = <String, Set<String>>{
    'de': {'one', 'other'},
    'en': {'one', 'other'},
    'es': {'one', 'many', 'other'},
    'fr': {'one', 'many', 'other'},
    'it': {'one', 'many', 'other'},
    'ja': {'other'},
    'ko': {'other'},
    'nl': {'one', 'other'},
    'pl': {'one', 'few', 'many', 'other'},
    'pt': {'one', 'many', 'other'},
    'ru': {'one', 'few', 'many', 'other'},
    'sr': {'one', 'few', 'other'},
    'tr': {'one', 'other'},
    'zh': {'other'},
  };

  static Set<String> categoriesFor(String locale) {
    final language = Intl.canonicalizedLocale(locale).split('_').first;
    return categories[language] ??
        (throw ArgumentError.value(locale, 'locale', 'Missing cardinal plural category configuration'));
  }

  static PluralResolver cardinal(String locale) {
    final canonicalLocale = Intl.canonicalizedLocale(locale);
    return (n, {zero, one, two, few, many, other}) => Intl.pluralLogic(
      n,
      zero: zero,
      one: one,
      two: two,
      few: few,
      many: many,
      other: other ?? n.toString(),
      locale: canonicalLocale,
      // Exact-number overrides bypass CLDR, notably in Japanese and pt-BR.
      useExplicitNumberCases: false,
    );
  }
}
