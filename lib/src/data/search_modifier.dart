// ignore_for_file: unnecessary_string_escapes

import 'package:intl/intl.dart';

// TODO add list of avaialable SearchModifier to every booru handler

// sankaku has the biggest list of options? https://chan.sankakucomplex.com/wiki/help%3A_advanced_search_guide

enum SearchModifierType {
  sort,
  date,
  number,
  bool,
  stringFromList,
  stringFromListOrFreeform,
  string;
}

abstract class SearchModifier {
  SearchModifier();

  SearchModifierType get type => SearchModifierType.string;

  List<String> get keyNames => ['mod'];

  RegExp get keyMatcher => RegExp(r'(^\S+):\S+');

  String keyBuilder(Map<String, dynamic> data) => data['key'] as String? ?? '';

  RegExp get dividerMatcher => RegExp(r'^\S+(:)\S+');

  String dividerBuilder(Map<String, dynamic> data) => data['divider'] as String? ?? '';

  RegExp get valueMatcher => RegExp(r'^\S+:(\S+)');

  String valueBuilder(Map<String, dynamic> data) => data['value'] as String? ?? '';

  /// data: {key, value, divider}
  String modifierBuilder(Map<String, dynamic> data) => '${keyBuilder(data)}${dividerBuilder(data)}${valueBuilder(data)}';
}

//

/// sort:score:asc
/// order:score:desc
class SortModifier extends SearchModifier {
  SortModifier({
    required this.values,
  });

  @override
  SearchModifierType get type => SearchModifierType.sort;

  @override
  List<String> get keyNames => ['sort', 'order'];

  @override
  RegExp get keyMatcher => RegExp('^(${keyNames.join('|')}):\S+');

  @override
  RegExp get dividerMatcher => RegExp('^(?:${keyNames.join('|')})(:)\S+');

  @override
  RegExp get valueMatcher => RegExp('^(?:${keyNames.join('|')}):(\S+)');

  final List<String> values; // score, score:desc, score:asc, date, date:desc, date:asc...
}

//

enum CompareMode {
  less,
  more,
  exact,
  between;
}

class DateModifier extends SearchModifier {
  DateModifier({
    required this.compareModes,
    required this.dateFormat,
    required this.dateDivider,
    this.customKeyName,
  });

  @override
  SearchModifierType get type => SearchModifierType.date;

  @override
  List<String> get keyNames => [
        'date',
        if (customKeyName != null) customKeyName!,
      ];

  @override
  RegExp get keyMatcher => RegExp('(^${keyNames.join('|')})(?:<=|=<|>=|=>|=|:)\S+');

  @override
  String keyBuilder(Map<String, dynamic> data) => 'date';

  @override
  RegExp get dividerMatcher => RegExp('^(?:${keyNames.join('|')})(<=|=<|>=|=>|=|:)\S+');

  @override
  String dividerBuilder(Map<String, dynamic> data) {
    final mode = data['mode'] as CompareMode? ?? CompareMode.exact;
    switch (mode) {
      case CompareMode.less:
        return ':<=';
      case CompareMode.more:
        return ':>=';
      case CompareMode.exact:
      case CompareMode.between:
        return ':';
    }
  }

  @override
  RegExp get valueMatcher => RegExp('^(?:${keyNames.join('|')})(?:<=|=<|>=|=>|=|:)(\S+)');

  @override
  String valueBuilder(Map<String, dynamic> data) {
    final mode = data['mode'] as CompareMode? ?? CompareMode.exact;

    switch (mode) {
      case CompareMode.less:
      case CompareMode.more:
      case CompareMode.exact:
        final date = data['first'] as DateTime?;
        if (date == null) {
          return '';
        }
        return DateFormat(dateFormat).format(date);
      case CompareMode.between:
        final firstDate = data['first'] as DateTime?;
        final secondDate = data['second'] as DateTime?;
        if (firstDate == null && secondDate == null) {
          return '';
        }
        return (firstDate == null ? '' : DateFormat(dateFormat).format(firstDate)) +
            dateDivider +
            (secondDate == null ? '' : DateFormat(dateFormat).format(secondDate));
    }
  }

  final List<CompareMode> compareModes;

  final String dateFormat; // yyyy-MM-dd

  final String dateDivider; // .. // for between mode

  final String? customKeyName;
}

class ComparableNumberModifier extends SearchModifier {
  ComparableNumberModifier({
    required this.keyName,
    required this.compareModes,
    required this.numberDivider,
  });

  @override
  SearchModifierType get type => SearchModifierType.date;

  @override
  List<String> get keyNames => [keyName];

  @override
  RegExp get keyMatcher => RegExp('(^${keyNames.join('|')})\S+');

  @override
  String keyBuilder(Map<String, dynamic> data) => 'date';

  @override
  RegExp get dividerMatcher => RegExp('^(?:${keyNames.join('|')})(<=|=<|>=|=>|=|:)\S+');

  @override
  String dividerBuilder(Map<String, dynamic> data) {
    final mode = data['mode'] as CompareMode? ?? CompareMode.exact;
    switch (mode) {
      case CompareMode.less:
        return ':<=';
      case CompareMode.more:
        return ':>=';
      case CompareMode.exact:
      case CompareMode.between:
        return ':';
    }
  }

  @override
  RegExp get valueMatcher => RegExp('^(?:${keyNames.join('|')})(?:<=|=<|>=|=>|=|:)(\S+)');

  @override
  String valueBuilder(Map<String, dynamic> data) {
    final mode = data['mode'] as CompareMode? ?? CompareMode.exact;

    switch (mode) {
      case CompareMode.less:
      case CompareMode.more:
      case CompareMode.exact:
        final value = data['first'] as String?;
        if (value == null) {
          return '';
        }
        return value;
      case CompareMode.between:
        final first = data['first'] as String? ?? '';
        final second = data['second'] as String? ?? '';
        if (first.isEmpty && second.isEmpty) {
          return '';
        }
        return first + numberDivider + second;
    }
  }

  final String keyName;

  final List<CompareMode> compareModes;

  final String numberDivider; // .. // for between mode
}

//

class OtherModifier extends SearchModifier {
  OtherModifier({
    required this.name,
    required this.keyName,
  });

  @override
  SearchModifierType get type => SearchModifierType.string;

  @override
  List<String> get keyNames => [keyName];

  final String name;

  final String keyName;
}

class NumberModifier extends OtherModifier {
  NumberModifier({
    required super.name,
    required super.keyName,
  });

  @override
  SearchModifierType get type => SearchModifierType.number;
}

class BoolModifier extends OtherModifier {
  BoolModifier({
    required super.name,
    required super.keyName,
  });

  @override
  SearchModifierType get type => SearchModifierType.bool;
}

class StringFromListModifier extends OtherModifier {
  StringFromListModifier({
    required super.name,
    required super.keyName,
    required this.values,
  });

  @override
  SearchModifierType get type => SearchModifierType.stringFromList;

  final List<Map<String, dynamic>> values;
}

class StringFromListOrFreeformModifier extends OtherModifier {
  StringFromListOrFreeformModifier({
    required super.name,
    required super.keyName,
    required this.values,
  });

  @override
  SearchModifierType get type => SearchModifierType.stringFromListOrFreeform;

  final List<Map<String, dynamic>> values;
}
