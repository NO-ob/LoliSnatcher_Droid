import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

class HistoryItem {
  HistoryItem(
    this.id,
    this.searchText,
    this.booruType,
    this.booruName,
    this.isFavourite,
    this.timestamp,
  );

  HistoryItem.fromMap(Map<String, dynamic> map)
    : id = map['id'] as int,
      searchText = map['searchText'] as String,
      booruType = BooruType.values.firstWhereOrNull(
        (element) => map['booruType'].toString().toLowerCase() == element.name.toLowerCase(),
      ),
      booruName = map['booruName'] as String,
      isFavourite = map['isFavourite'] == '1',
      timestamp = map['timestamp'] as String;

  final int id;
  final String searchText;
  final BooruType? booruType;
  final String booruName;
  bool isFavourite;
  final String timestamp;
}
