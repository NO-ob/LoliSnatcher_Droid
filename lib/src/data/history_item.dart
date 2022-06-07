class HistoryItem {
  final int id;
  final String searchText;
  final String booruType;
  final String booruName;
  bool isFavourite;
  final String timestamp;

  HistoryItem(this.id, this.searchText, this.booruType, this.booruName, this.isFavourite, this.timestamp);

  HistoryItem.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        searchText = map['searchText'] as String,
        booruType = map['booruType'] as String,
        booruName = map['booruName'] as String,
        isFavourite = map['isFavourite'] == '1',
        timestamp = map['timestamp'] as String;
}
