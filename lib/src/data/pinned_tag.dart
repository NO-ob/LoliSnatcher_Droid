import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

class PinnedTag {
  PinnedTag({
    required this.id,
    required this.tagName,
    required this.pinnedAt,
    this.booruType,
    this.booruName,
    this.sortOrder = 0,
    this.labels = const [],
  });

  PinnedTag.fromMap(Map<String, dynamic> map)
    : id = map['id'] as int,
      tagName = map['tagName'] as String,
      booruType = map['booruType'] != null
          ? BooruType.values.firstWhereOrNull(
              (element) => map['booruType'].toString().toLowerCase() == element.name.toLowerCase(),
            )
          : null,
      booruName = map['booruName'] as String?,
      pinnedAt = map['pinnedAt'] as int,
      sortOrder = map['sortOrder'] as int? ?? 0,
      labels = _parseLabels(map['label'] as String?);

  /// Parse comma-separated labels string into a list
  static List<String> _parseLabels(String? labelString) {
    if (labelString == null || labelString.isEmpty) return [];
    return labelString.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  final int id;
  final String tagName;
  final BooruType? booruType;
  final String? booruName;
  final int pinnedAt;
  final int sortOrder;
  final List<String> labels;

  /// Returns true if this is a global pin (not booru-specific)
  bool get isGlobal => booruName == null;

  /// Returns true if this pin matches the given booru (either global or booru-specific match)
  bool matchesBooru(String? booruName, BooruType? booruType) {
    if (isGlobal) return true;
    return this.booruName == booruName && this.booruType == booruType;
  }

  /// Convert labels list to comma-separated string for database storage
  String get labelsString => labels.join(',');

  /// Check if this tag has a specific label
  bool hasLabel(String label) => labels.any((l) => l.toLowerCase() == label.toLowerCase());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tagName': tagName,
      'booruType': booruType?.name,
      'booruName': booruName,
      'pinnedAt': pinnedAt,
      'sortOrder': sortOrder,
      'label': labelsString,
    };
  }

  @override
  String toString() {
    return 'PinnedTag(id: $id, tagName: $tagName, booruType: $booruType, booruName: $booruName, isGlobal: $isGlobal, labels: $labels)';
  }

  PinnedTag copyWith({
    int? id,
    String? tagName,
    BooruType? booruType,
    String? booruName,
    int? pinnedAt,
    int? sortOrder,
    List<String>? labels,
    bool clearBooru = false,
    bool clearLabels = false,
  }) {
    return PinnedTag(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      booruType: clearBooru ? null : (booruType ?? this.booruType),
      booruName: clearBooru ? null : (booruName ?? this.booruName),
      pinnedAt: pinnedAt ?? this.pinnedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      labels: clearLabels ? [] : (labels ?? this.labels),
    );
  }
}
