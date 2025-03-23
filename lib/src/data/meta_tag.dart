// ignore_for_file: unnecessary_string_escapes

// sankaku has the biggest list of options? https://chan.sankakucomplex.com/wiki/help%3A_advanced_search_guide
// https://gelbooru.com/index.php?page=wiki&s=view&id=26263
// https://rule34.xxx/index.php?page=help&topic=cheatsheet

import 'package:lolisnatcher/src/data/tag_suggestion.dart';

enum MetaTagType {
  boolean,
  comparableNumber,
  date,
  number,
  sort,
  string,
  stringFromList;

  bool get isBool => this == MetaTagType.boolean;
  bool get isComparableNumber => this == MetaTagType.comparableNumber;
  bool get isDate => this == MetaTagType.date;
  bool get isNumber => this == MetaTagType.number;
  bool get isSort => this == MetaTagType.sort;
  bool get isString => this == MetaTagType.string;
  bool get isStringFromList => this == MetaTagType.stringFromList;
}

abstract class MetaTag {
  MetaTag({
    required this.name,
    required this.keyName,
    this.divider = ':',
  });

  MetaTagType get type => MetaTagType.string;

  final String name;

  String keyName;

  String divider;

  //

  RegExp get keyMatcher => RegExp('^($keyName)$divider');

  String? keyParser(String text) => keyMatcher.firstMatch(text)?.group(1);

  String keyBuilder(String? data) => data ?? keyName;

  //

  RegExp get dividerMatcher => RegExp('^$keyName($divider)');

  String? dividerParser(String text) => dividerMatcher.firstMatch(text)?.group(1);

  String dividerBuilder(String? data) => data ?? divider;

  //

  RegExp get keyDividerMatcher => RegExp('^($keyName$divider)');

  String? keyDividerParser(String text) => keyDividerMatcher.firstMatch(text)?.group(1);

  String keyDividerBuilder(String? data) => data ?? '$keyName$divider';

  //

  RegExp get valueMatcher => RegExp('^$keyName$divider(\\S+)');

  String? valueParser(String text) => valueMatcher.firstMatch(text)?.group(1);

  String valueBuilder(String? data) => data ?? '';

  //

  RegExp get tagMatcher => RegExp('^($keyName)($divider)(\\S+)?');

  /// data: {key, value, divider}
  String tagBuilder(String? key, String? divider, String? value) => '${keyBuilder(keyName)}${dividerBuilder(divider)}${valueBuilder(value)}';

  Map<String, dynamic> tagParser(String text) {
    final match = tagMatcher.firstMatch(text);
    return match != null ? {'key': match.group(1), 'divider': match.group(2), 'value': match.group(3)} : {};
  }

  bool get hasAutoComplete => true;

  Future<List<TagSuggestion>> getAutoComplete(String text) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return [TagSuggestion(tag: text)];

    if (this is MetaTagWithValues) {
      final List<String> possibleValues = (this as MetaTagWithValues)
          .values
          .where((e) => e is String || e is MetaTagValue)
          .map(
            (e) => switch (e.runtimeType) {
              const (String) => e as String,
              const (MetaTagValue) => (e as MetaTagValue).value,
              _ => '',
            },
          )
          .where((e) => e.isNotEmpty)
          .toList();

      final List<TagSuggestion> suggestedTags = [];
      for (final v in possibleValues) {
        final tag = tagBuilder(null, null, v);
        if (tag.contains(text)) {
          suggestedTags.add(
            TagSuggestion(
              tag: tag,
            ),
          );
        }
      }
      return suggestedTags;
    } else {
      return [];
    }
  }
}

class MetaTagWithValues<T> extends MetaTag {
  MetaTagWithValues({
    required super.name,
    required super.keyName,
    required this.values,
  });

  final List<T> values;

  @override
  bool get hasAutoComplete => true;
}

class MetaTagWithCompareModes extends MetaTag {
  MetaTagWithCompareModes({
    required super.name,
    required super.keyName,
    this.compareModes = CompareMode.values,
  });

  final List<CompareMode> compareModes;

  String dividerForMode(CompareMode? mode) => switch (mode) {
        CompareMode.less => ':<=',
        CompareMode.greater => ':>=',
        CompareMode.exact || null => ':',
      };

  CompareMode compareModeFromDivider(String? divider) {
    if (divider == null) return CompareMode.exact;
    if (divider == ':<=') return CompareMode.less;
    if (divider == ':>=') return CompareMode.greater;
    return CompareMode.exact;
  }

  @override
  RegExp get keyMatcher => RegExp('^($keyName)(?::<=|:>=|:=|:)');

  @override
  RegExp get dividerMatcher => RegExp('^$keyName(:<=|:>=|:=|:)');

  @override
  RegExp get keyDividerMatcher => RegExp('^($keyName(?::<=|:>=|:=|:))');

  @override
  RegExp get valueMatcher => RegExp('^$keyName(?::<=|:>=|:=|:)(\\S+)');

  @override
  RegExp get tagMatcher => RegExp('^($keyName)(:<=|:>=|:=|:)(\\S+)?');
}

//

class MetaTagValue {
  MetaTagValue({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}

class SortMetaTag extends MetaTagWithValues<MetaTagValue> {
  SortMetaTag({
    required super.values,
  }) : super(
          name: 'sort',
          keyName: 'sort',
        );

  @override
  MetaTagType get type => MetaTagType.sort;

  // values - score, score:desc, score:asc, date, date:desc, date:asc...
}

class OrderMetaTag extends MetaTagWithValues<MetaTagValue> {
  OrderMetaTag({
    required super.values,
  }) : super(
          name: 'order',
          keyName: 'order',
        );

  @override
  MetaTagType get type => MetaTagType.sort;
}

//

enum CompareMode {
  less,
  exact,
  greater;

  bool get isLess => this == CompareMode.less;
  bool get isGreater => this == CompareMode.greater;
  bool get isExact => this == CompareMode.exact;
}

class DateMetaTag extends MetaTagWithCompareModes {
  DateMetaTag({
    required super.name,
    required super.keyName,
    this.dateFormat = 'yyyy-MM-dd',
    this.valuesDivider = '..',
  });

  final String dateFormat; // yyyy-MM-dd

  final String valuesDivider; // .. // for between mode

  @override
  MetaTagType get type => MetaTagType.date;
}

class ComparableNumberMetaTag extends MetaTagWithCompareModes {
  ComparableNumberMetaTag({
    required super.name,
    required super.keyName,
    this.valuesDivider = '..',
  });

  final String valuesDivider;

  @override
  MetaTagType get type => MetaTagType.comparableNumber;
}

//

class NumberMetaTag extends MetaTag {
  NumberMetaTag({
    required super.name,
    required super.keyName,
  });

  @override
  MetaTagType get type => MetaTagType.number;
}

class BoolMetaTag extends MetaTag {
  BoolMetaTag({
    required super.name,
    required super.keyName,
  });

  @override
  MetaTagType get type => MetaTagType.boolean;
}

class StringMetaTag extends MetaTag {
  StringMetaTag({
    required super.name,
    required super.keyName,
  });

  @override
  MetaTagType get type => MetaTagType.string;
}

class StringFromListMetaTag extends MetaTagWithValues<String> {
  StringFromListMetaTag({
    required super.name,
    required super.keyName,
    required super.values,
  });

  @override
  MetaTagType get type => MetaTagType.stringFromList;
}

class GenericRatingMetaTag extends MetaTagWithValues<MetaTagValue> {
  GenericRatingMetaTag()
      : super(
          name: 'rating',
          keyName: 'rating',
          values: [
            MetaTagValue(name: 'Safe', value: 'safe'),
            MetaTagValue(name: 'Questionable', value: 'questionable'),
            MetaTagValue(name: 'Explicit', value: 'explicit'),
          ],
        );
}

class GelbooruRatingMetaTag extends MetaTagWithValues<MetaTagValue> {
  GelbooruRatingMetaTag()
      : super(
          name: 'rating',
          keyName: 'rating',
          values: [
            MetaTagValue(name: 'General', value: 'general'),
            MetaTagValue(name: 'Sensitive', value: 'sensitive'),
            MetaTagValue(name: 'Questionable', value: 'questionable'),
            MetaTagValue(name: 'Explicit', value: 'explicit'),
          ],
        );
}
