// ignore_for_file: unnecessary_string_escapes

// sankaku has the biggest list of options? https://chan.sankakucomplex.com/wiki/help%3A_advanced_search_guide
// https://gelbooru.com/index.php?page=wiki&s=view&id=26263
// https://rule34.xxx/index.php?page=help&topic=cheatsheet

import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum MetaTagType {
  boolean,
  comparableNumber,
  date,
  number,
  sort,
  string,
  stringFromList,
  user,
  ;

  bool get isBool => this == .boolean;
  bool get isComparableNumber => this == .comparableNumber;
  bool get isDate => this == .date;
  bool get isNumber => this == .number;
  bool get isSort => this == .sort;
  bool get isString => this == .string;
  bool get isStringFromList => this == .stringFromList;
  bool get isUser => this == .user;
}

abstract class MetaTag {
  MetaTag({
    required this.name,
    required this.keyName,
    this.divider = ':',
    this.isFree = false,
  });

  MetaTagType get type => .string;

  final String name;

  String keyName;

  String divider;

  bool isFree; // for danbooru, they have free tags which don't count towards query tag limit

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
  String tagBuilder(String? key, String? divider, String? value) =>
      '${keyBuilder(key)}${dividerBuilder(divider)}${valueBuilder(value)}';

  Map<String, dynamic> tagParser(String text) {
    final match = tagMatcher.firstMatch(text);
    return match != null ? {'key': match.group(1), 'divider': match.group(2), 'value': match.group(3)} : {};
  }

  bool get hasAutoComplete => true;

  Future<List<TagSuggestion>> getAutoComplete(String text) async {
    if (this is MetaTagWithValues) {
      final List<MetaTagValue> possibleValues = (this as MetaTagWithValues).values.toList();

      final List<TagSuggestion> suggestedTags = [];
      for (final value in possibleValues) {
        final tag = tagBuilder(null, null, value.value);
        if (tag.contains(text)) {
          suggestedTags.add(
            TagSuggestion(
              tag: tag,
              description: value.value != value.name ? value.name : null,
            ),
          );
        }
      }
      return suggestedTags;
    } else {
      return [];
    }
  }

  MetaTag copyWith({
    String? name,
    String? keyName,
    String? divider,
    bool? isFree,
  });
}

class BasicMetaTag extends MetaTag {
  BasicMetaTag({
    required super.name,
    required super.keyName,
    super.divider = ':',
    super.isFree = false,
  });

  @override
  BasicMetaTag copyWith({
    String? name,
    String? keyName,
    String? divider,
    bool? isFree,
  }) => BasicMetaTag(
    name: name ?? this.name,
    keyName: keyName ?? this.keyName,
    divider: divider ?? this.divider,
    isFree: isFree ?? this.isFree,
  );
}

class MetaTagWithValues extends MetaTag {
  MetaTagWithValues({
    required super.name,
    required super.keyName,
    required this.values,
    super.divider = ':',
    super.isFree = false,
  });

  final List<MetaTagValue> values;

  @override
  bool get hasAutoComplete => true;

  @override
  MetaTagWithValues copyWith({
    String? name,
    String? keyName,
    List<MetaTagValue>? values,
    String? divider,
    bool? isFree,
  }) => MetaTagWithValues(
    name: name ?? this.name,
    keyName: keyName ?? this.keyName,
    values: values ?? this.values,
    divider: divider ?? this.divider,
    isFree: isFree ?? this.isFree,
  );
}

class MetaTagWithCompareModes extends MetaTag {
  MetaTagWithCompareModes({
    required super.name,
    required super.keyName,
    super.divider = ':',
    this.compareModes = CompareMode.values,
    super.isFree = false,
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

  @override
  MetaTagWithCompareModes copyWith({
    String? name,
    String? keyName,
    String? divider,
    List<CompareMode>? compareModes,
    bool? isFree,
  }) => MetaTagWithCompareModes(
    name: name ?? this.name,
    keyName: keyName ?? this.keyName,
    divider: divider ?? this.divider,
    compareModes: compareModes ?? this.compareModes,
    isFree: isFree ?? this.isFree,
  );
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

class SortMetaTag extends MetaTagWithValues {
  SortMetaTag({
    required super.values,
    super.isFree = false,
  }) : super(
         name: 'Sort',
         keyName: 'sort',
       );

  @override
  MetaTagType get type => .sort;

  // values - score, score:desc, score:asc, date, date:desc, date:asc...
}

class OrderMetaTag extends MetaTagWithValues {
  OrderMetaTag({
    required super.values,
    super.isFree = false,
  }) : super(
         name: 'Order',
         keyName: 'order',
       );

  @override
  MetaTagType get type => .sort;
}

//

enum CompareMode {
  less,
  exact,
  greater,
  ;

  bool get isLess => this == CompareMode.less;
  bool get isGreater => this == CompareMode.greater;
  bool get isExact => this == CompareMode.exact;
}

class DateMetaTag extends MetaTagWithCompareModes {
  DateMetaTag({
    required super.name,
    required super.keyName,
    this.dateFormat = 'yyyy-MM-dd',
    this.prettierDateFormat,
    this.valuesDivider = '..',
    this.supportsRange = true,
    super.isFree = false,
  });

  final String dateFormat; // yyyy-MM-dd

  final String?
  prettierDateFormat; // for cases when api uses some ugly date format, use this to format date in searchbar chip

  final String valuesDivider; // .. // for between mode

  final bool supportsRange;

  @override
  MetaTagType get type => .date;
}

class ComparableNumberMetaTag extends MetaTagWithCompareModes {
  ComparableNumberMetaTag({
    required super.name,
    required super.keyName,
    this.valuesDivider = '..',
    super.isFree = false,
  });

  final String valuesDivider;

  @override
  MetaTagType get type => .comparableNumber;
}

//

class NumberMetaTag extends BasicMetaTag {
  NumberMetaTag({
    required super.name,
    required super.keyName,
    super.isFree = false,
  });

  @override
  MetaTagType get type => .number;
}

class BoolMetaTag extends BasicMetaTag {
  BoolMetaTag({
    required super.name,
    required super.keyName,
    super.isFree = false,
  });

  @override
  MetaTagType get type => .boolean;
}

class StringMetaTag extends BasicMetaTag {
  StringMetaTag({
    required super.name,
    required super.keyName,
    super.isFree = false,
  });

  @override
  MetaTagType get type => .string;
}

/// Special tag, only used when booru has no metatags data.
/// In that case this is used to do a generic detection of anything formatted like "key:value".
/// Hidden from UI, only affects text styling in tag/tab widgets and tag suggestion search input
class GenericMetaTag extends BasicMetaTag {
  GenericMetaTag()
    : super(
        name: '',
        keyName: '',
      );

  @override
  RegExp get keyMatcher => RegExp('^(\\w+)$divider');

  @override
  RegExp get dividerMatcher => RegExp('^(?:\\w+)($divider)');

  @override
  RegExp get keyDividerMatcher => RegExp('^(\\w+$divider)');

  @override
  RegExp get valueMatcher => RegExp('^\\w+$divider(\\S+)');

  @override
  RegExp get tagMatcher => RegExp('^(\\w+)($divider)(\\S+)?');
}

class GenericRatingMetaTag extends MetaTagWithValues {
  GenericRatingMetaTag()
    : super(
        name: 'Rating',
        keyName: 'rating',
        values: [
          MetaTagValue(name: 'Safe', value: 'safe'),
          MetaTagValue(name: 'Questionable', value: 'questionable'),
          MetaTagValue(name: 'Explicit', value: 'explicit'),
        ],
      );
}

class DanbooruGelbooruRatingMetaTag extends MetaTagWithValues {
  DanbooruGelbooruRatingMetaTag({
    super.isFree = false,
  }) : super(
         name: 'Rating',
         keyName: 'rating',
         values: [
           MetaTagValue(name: 'General', value: 'general'),
           MetaTagValue(name: 'Sensitive', value: 'sensitive'),
           MetaTagValue(name: 'Questionable', value: 'questionable'),
           MetaTagValue(name: 'Explicit', value: 'explicit'),
         ],
       );
}

class UserMetaTag extends StringMetaTag {
  UserMetaTag({
    super.name = 'User',
    super.keyName = 'user',
    super.isFree = false,
  });

  @override
  MetaTagType get type => .user;
}

class LocalDbSiteMetaTag extends MetaTagWithValues {
  LocalDbSiteMetaTag({
    super.isFree = false,
  }) : super(
         name: 'Site',
         keyName: 'site',
         values: SettingsHandler.instance.booruList
             .where((b) => b.type?.isSaveable == true)
             .map(
               (b) => MetaTagValue(
                 name: b.name ?? '?',
                 value: Uri.tryParse(b.baseURL ?? '')?.host ?? '',
               ),
             )
             .where((t) => t.value.isNotEmpty)
             .toList(),
       );
}
