import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:sqflite/sqflite.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/history_item.dart';
import 'package:lolisnatcher/src/data/pinned_tag.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

///////////////////////////////////////////////////////////////
/// WARNING:
/// On desktop releases you need to add sqlite3.dll for windows and have sqlite3 installed for linux
/// https://www.sqlite.org/download.html
/// https://archlinux.org/packages/core/x86_64/sqlite/
/// https://pub.dev/packages/sqflite_common_ffi
///////////////////////////////////////////////////////////////

enum BooruUpdateMode { local, urlUpdate, sync }

class DBHandler {
  DBHandler();
  Database? db;

  /// Connects to the database file and create the database if the tables dont exist
  Future<bool> dbConnect(
    String path, {
    ValueChanged<String>? onStatusUpdate,
  }) async {
    // await Sqflite.devSetDebugModeOn(true);
    if (Platform.isAndroid || Platform.isIOS) {
      db = await openDatabase('${path}store.db', version: 1, singleInstance: false);
    } else if (Platform.isWindows || Platform.isLinux) {
      db = await databaseFactory.openDatabase('${path}store.db');
    }
    await updateTable();
    await fixBooruItems(onStatusUpdate);
    await deleteUntracked();
    return true;
  }

  Future<bool> updateTable() async {
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS BooruItem '
      '(id INTEGER PRIMARY KEY, '
      'thumbnailURL TEXT, '
      'sampleURL TEXT, '
      'fileURL TEXT, '
      'postURL TEXT, '
      'mediaType TEXT, '
      'isSnatched INTEGER, '
      'isFavourite INTEGER '
      ')',
    );
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS Tag ( '
      'id INTEGER PRIMARY KEY, '
      'name TEXT '
      'tagType TEXT '
      'updatedAt INTEGER '
      ')',
    );
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS ImageTag ( '
      'tagID INTEGER, '
      'booruItemID INTEGER '
      ')',
    );
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS SearchHistory ( '
      'id INTEGER PRIMARY KEY, '
      'booruType TEXT, '
      'booruName TEXT, '
      'searchText TEXT, '
      'isFavourite INTEGER, '
      'timestamp TEXT DEFAULT CURRENT_TIMESTAMP '
      ')',
    );
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS TabRestore ( '
      'id INTEGER PRIMARY KEY, '
      'restore TEXT '
      ')',
    );
    await db?.execute(
      'CREATE TABLE IF NOT EXISTS PinnedTag ( '
      'id INTEGER PRIMARY KEY, '
      'tagName TEXT NOT NULL, '
      'booruType TEXT, '
      'booruName TEXT, '
      'pinnedAt INTEGER NOT NULL, '
      'sortOrder INTEGER DEFAULT 0, '
      'label TEXT '
      ')',
    );
    try {
      if (!await columnExists('SearchHistory', 'isFavourite')) {
        await db?.execute('ALTER TABLE SearchHistory ADD COLUMN isFavourite INTEGER;');
      }
      if (!await columnExists('Tag', 'tagType')) {
        await db?.execute('ALTER TABLE Tag ADD COLUMN tagType TEXT;');
      }
      if (!await columnExists('Tag', 'updatedAt')) {
        await db?.execute('ALTER TABLE Tag ADD COLUMN updatedAt INTEGER;');
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Error updating table',
        'DBHandler',
        'updateTable',
        LogTypes.exception,
        s: s,
      );
    }
    return true;
  }

  Future<bool> columnExists(String tableName, String columnName) async {
    final List<Map<String, Object?>>? result = await db?.rawQuery(
      "SELECT COUNT(*) AS count FROM pragma_table_info('$tableName') WHERE name='$columnName'",
    );
    if (result != null && result.isNotEmpty) {
      if ((result[0]['count'] ?? 0) == 1) {
        return true;
      }
    }
    return false;
  }

  Future<bool> createIndexes() async {
    await db?.execute('CREATE INDEX IF NOT EXISTS ImageTag_tagID_index ON ImageTag (tagID);');
    await db?.execute('CREATE INDEX IF NOT EXISTS ImageTag_booruItemID_index ON ImageTag (booruItemID);');
    return true;
  }

  Future<bool> dropIndexes() async {
    await db?.execute('DROP INDEX IF EXISTS ImageTag_tagID_index;');
    await db?.execute('DROP INDEX IF EXISTS ImageTag_booruItemID_index;');
    await db?.execute('DROP INDEX IF EXISTS BooruItem_isSnatched_index;');
    await db?.execute('DROP INDEX IF EXISTS BooruItem_isFavourite_index;');
    await db?.execute('DROP INDEX IF EXISTS BooruItem_fileURL_index;');
    await db?.execute('DROP INDEX IF EXISTS BooruItem_id_index;');
    await db?.execute('DROP INDEX IF EXISTS BooruItem_fileURL_isFavourite_isSnatched_index;');
    await db?.execute('DROP INDEX IF EXISTS Tag_name_index;');
    await db?.execute('DROP INDEX IF EXISTS Tag_id_index;');
    return true;
  }

  /// Inserts a new booruItem or updates the isSnatched and isFavourite values of an existing BooruItem in the database
  Future<String?> updateBooruItem(BooruItem item, BooruUpdateMode mode) async {
    Logger.Inst().log(
      'updateBooruItem called fileURL is: ${item.fileURL}',
      'DBHandler',
      'updateBooruItem',
      LogTypes.booruHandlerInfo,
    );
    String? itemID = await getItemID(item.postURL);
    String resultStr = '';
    if (itemID == null || itemID.isEmpty) {
      final result = await db?.rawInsert(
        'INSERT INTO BooruItem(thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite) VALUES(?,?,?,?,?,?,?)',
        [
          item.thumbnailURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          item.sampleURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          item.fileURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          item.postURL,
          item.mediaType.toJson(),
          Tools.boolToInt(item.isSnatched.value == true),
          Tools.boolToInt(item.isFavourite.value == true),
        ],
      );
      itemID = result?.toString();
      await updateTags(item.tagsList.map((t) => t.fullString).toList(), itemID);
      resultStr = 'Inserted';
    } else if (mode == BooruUpdateMode.local) {
      await db?.rawUpdate(
        'UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?',
        [Tools.boolToInt(item.isSnatched.value == true), Tools.boolToInt(item.isFavourite.value == true), itemID],
      );
      resultStr = 'Updated';
    } else if (mode == BooruUpdateMode.urlUpdate) {
      await db?.rawUpdate(
        'UPDATE BooruItem SET thumbnailURL = ?,sampleURL = ?,fileURL = ? WHERE id = ?',
        [
          item.thumbnailURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          item.sampleURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          item.fileURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
          itemID,
        ],
      );
      resultStr = 'Updated Urls';
    } else {
      resultStr = 'Already Exists';
    }
    await deleteUntracked();
    return resultStr;
  }

  Future<Map<String, int>> updateMultipleBooruItems(List<BooruItem> items, BooruUpdateMode mode) async {
    // TODO rewrite using batch
    final List<String> itemIDs = await getItemIDs(items.map((item) => item.postURL).toList());

    int saved = 0, exist = 0;
    for (final BooruItem item in items) {
      final int itemIndex = items.indexWhere((element) => element.postURL == item.postURL);
      String? itemID = (itemIDs.isNotEmpty && itemIndex != -1) ? itemIDs[itemIndex] : null;

      if (itemID == null || itemID.isEmpty) {
        final result = await db?.rawInsert(
          'INSERT INTO BooruItem(thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite) VALUES(?,?,?,?,?,?,?)',
          [
            item.thumbnailURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            item.sampleURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            item.fileURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            item.postURL,
            item.mediaType.toJson(),
            Tools.boolToInt(item.isSnatched.value == true),
            Tools.boolToInt(item.isFavourite.value == true),
          ],
        );
        itemID = result?.toString();
        await updateTags(item.tagsList.map((t) => t.fullString).toList(), itemID);
        saved++;
      } else if (mode == BooruUpdateMode.local) {
        await db?.rawUpdate(
          'UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?',
          [Tools.boolToInt(item.isSnatched.value == true), Tools.boolToInt(item.isFavourite.value == true), itemID],
        );
      } else if (mode == BooruUpdateMode.urlUpdate) {
        await db?.rawUpdate(
          'UPDATE BooruItem SET thumbnailURL = ?,sampleURL = ?,fileURL = ? WHERE id = ?',
          [
            item.thumbnailURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            item.sampleURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            item.fileURL.replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/'),
            itemID,
          ],
        );
      } else {
        exist++;
      }
      await Future.delayed(const Duration(milliseconds: 1));
    }
    await deleteUntracked();

    return {'saved': saved, 'exist': exist};
  }

  /// Gets a BooruItem id from the database based on a fileurl
  Future<String?> getItemID(String postURL) async {
    List? result;
    result = await db?.rawQuery('SELECT id FROM BooruItem WHERE postURL = ?', [postURL]);

    if (result != null && result.isNotEmpty) {
      return result.first['id'].toString();
    } else {
      return null;
    }
  }

  Future<List<String>> getItemIDs(List<String> postURLs) async {
    final List? result = await db?.rawQuery(
      "SELECT id, postURL FROM BooruItem WHERE postURL IN (${List.generate(postURLs.length, (_) => '?').join(',')})",
      postURLs,
    );

    final List<String> ids = List.generate(postURLs.length, (index) => '');
    if (result != null && result.isNotEmpty) {
      for (final Map<String, dynamic> item in result) {
        final int postIndex = postURLs.indexOf(item['postURL']);
        if (postIndex != -1) {
          ids[postIndex] = item['id'].toString();
        }
      }
    }
    return ids;
  }

  Future<List<BooruItem>> getSankakuItems({
    String search = '',
    bool idol = false,
  }) async {
    if (search.isNotEmpty) {
      final items = await searchDB(
        search,
        '0',
        '1000000',
        'DESC',
        customConditions: ["bi.postURL like '%${idol ? "idol" : "chan"}.sankakucomplex%'"],
      );
      for (final item in items) {
        item.isSnatched.value = false;
      }
      return items;
    }

    final List? result = await db?.rawQuery(
      'SELECT BooruItem.id as ItemID, thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite '
      'FROM BooruItem '
      "WHERE postURL like '%${idol ? "idol" : "chan"}.sankakucomplex%' "
      'ORDER BY BooruItem.id DESC;',
    );
    final List<BooruItem> items = [];
    if (result != null && result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        final currentItem = result[i];
        if (currentItem != null && currentItem.isNotEmpty) {
          final BooruItem bItem = BooruItem.fromDBRow(currentItem, []);
          items.add(bItem);
        }
      }
    }
    return items;
  }

  Future<List<BooruItem>> searchDB(
    String searchTagsString,
    String offset,
    String limit,
    String order, {
    List<String> customConditions = const [],
    bool isDownloads = false,
  }) async {
    final db = this.db;
    if (db == null) return [];

    // --- 1. PARSE PARAMETERS ---
    // Clean input tags and separate special commands
    final List<String> rawTags = searchTagsString.trim().split(' ').where((t) => t.isNotEmpty).toList();
    final List<String> searchTags = [];
    final List<String> excludeTags = [];
    String siteQuery = '';
    bool isRandomOrder = false;

    for (final tag in rawTags) {
      final lowerTag = tag.toLowerCase();
      if (lowerTag.startsWith('site:') || lowerTag.startsWith('-site:')) {
        final isExclude = lowerTag.startsWith('-site:');
        final term = tag.replaceAll(RegExp('^-?site:', caseSensitive: false), '');
        siteQuery =
            "bi.postURL ${isExclude ? 'NOT' : ''} LIKE '%$term%' OR bi.fileURL ${isExclude ? 'NOT' : ''} LIKE '%$term%' ";
      } else if (lowerTag == 'sort:random') {
        isRandomOrder = true;
      } else if (tag.startsWith('-')) {
        excludeTags.add(tag.substring(1));
      } else {
        searchTags.add(tag);
      }
    }

    // --- 2. BUILD MAIN QUERY ---
    final StringBuffer sql = StringBuffer(
      'SELECT bi.id as dbid, bi.thumbnailURL, bi.sampleURL, bi.fileURL, bi.postURL, bi.mediaType, bi.isSnatched, bi.isFavourite '
      'FROM BooruItem AS bi ',
    );
    final List<String> whereClauses = [];
    final List<dynamic> args = [];

    // Only join if we need to filter by included tags
    if (searchTags.isNotEmpty) {
      sql.write('JOIN ImageTag AS it ON bi.id = it.booruItemID ');
      sql.write('JOIN Tag AS t ON it.tagID = t.id ');
    }

    // A. Base Filter
    whereClauses.add(isDownloads ? 'bi.isSnatched = 1' : 'bi.isFavourite = 1');

    // B. Site Filter
    if (siteQuery.isNotEmpty) whereClauses.add(siteQuery);

    // C. Custom Conditions
    if (customConditions.isNotEmpty) whereClauses.add('(${customConditions.join(' AND ')})');

    // D. Exclusions
    if (excludeTags.isNotEmpty) {
      final placeholders = List.filled(excludeTags.length, '?').join(',');
      whereClauses.add('''
        bi.id NOT IN (
          SELECT it_ex.booruItemID 
          FROM ImageTag it_ex 
          JOIN Tag t_ex ON it_ex.tagID = t_ex.id 
          WHERE t_ex.name IN ($placeholders)
        )
      ''');
      args.addAll(excludeTags);
    }

    // E. Inclusions
    if (searchTags.isNotEmpty) {
      final placeholders = List.filled(searchTags.length, '?').join(',');
      whereClauses.add('t.name IN ($placeholders)');
      args.addAll(searchTags);
    }

    // Apply WHERE
    if (whereClauses.isNotEmpty) {
      sql.write('WHERE ${whereClauses.join(' AND ')} ');
    }

    // Grouping for intersection logic (Must have ALL tags)
    if (searchTags.isNotEmpty) {
      sql.write('GROUP BY bi.id HAVING COUNT(DISTINCT t.id) = ? ');
      args.add(searchTags.length);
    }

    // Ordering & Pagination
    String orderByClause = 'bi.id $order';
    if (isRandomOrder) orderByClause = 'RANDOM()';
    sql.write('ORDER BY $orderByClause LIMIT ? OFFSET ?');
    args.add(limit);
    args.add(offset);

    // --- 3. EXECUTE MAIN SEARCH ---
    final List<Map<String, dynamic>> results = await db.rawQuery(sql.toString(), args);

    if (results.isEmpty) return [];

    // --- 4. FETCH TAGS ---
    final itemIDs = results.map((r) => r['dbid'] as int).toList();
    final tagPlaceholders = List.filled(itemIDs.length, '?').join(',');
    final tagsResult = await db.rawQuery(
      'SELECT it.booruItemID, t.name '
      'FROM Tag AS t '
      'INNER JOIN ImageTag AS it ON t.id = it.tagID '
      'WHERE it.booruItemID IN ($tagPlaceholders)',
      itemIDs,
    );

    // --- 5. MAP RESULTS ---
    final Map<int, List<String>> tagsMap = {};
    for (final row in tagsResult) {
      final id = row['booruItemID']! as int;
      final tagName = row['name']! as String;
      if (!tagsMap.containsKey(id)) tagsMap[id] = [];
      tagsMap[id]!.add(tagName);
    }

    // Construct final objects using BooruItem.fromDBRow
    return results.map((row) {
      final id = row['dbid'] as int;
      final itemTags = tagsMap[id] ?? [];
      return BooruItem.fromDBRow(row, itemTags);
    }).toList();
  }

  Future<List<Tag>> getAllTags() async {
    final List? result = await db?.rawQuery('SELECT name, tagType, updatedAt FROM Tag');
    final List<Tag> tags = [];
    if (result != null && result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        final currentItem = result[i];
        if (currentItem != null && currentItem.isNotEmpty) {
          tags.add(Tag.fromJson(currentItem));
        }
      }
    }
    return tags;
  }

  Future<int> searchDBCount(
    String searchTagsString, {
    List<String> customConditions = const [],
    bool isDownloads = false,
  }) async {
    final db = this.db;
    if (db == null) return 0;

    // --- 1. PARSE PARAMETERS ---
    // Clean input tags and separate special commands
    final List<String> rawTags = searchTagsString.trim().split(' ').where((t) => t.isNotEmpty).toList();
    final List<String> searchTags = [];
    final List<String> excludeTags = [];
    String siteQuery = '';

    for (final tag in rawTags) {
      final lowerTag = tag.toLowerCase();
      if (lowerTag.startsWith('site:') || lowerTag.startsWith('-site:')) {
        final isExclude = lowerTag.startsWith('-site:');
        final term = tag.replaceAll(RegExp('^-?site:', caseSensitive: false), '');
        siteQuery = "bi.postURL ${isExclude ? 'NOT' : ''} LIKE '%$term%'";
      } else if (lowerTag == 'sort:random') {
        // do nothing
      } else if (tag.startsWith('-')) {
        excludeTags.add(tag.substring(1));
      } else {
        searchTags.add(tag);
      }
    }

    // --- 2. BUILD COUNT QUERY ---
    final StringBuffer sql = StringBuffer('SELECT COUNT(*) as count FROM BooruItem AS bi ');
    final List<String> whereClauses = [];
    final List<dynamic> args = [];

    // Join tables ONLY if filtering by included tags
    if (searchTags.isNotEmpty) {
      sql.write('JOIN ImageTag AS it ON bi.id = it.booruItemID ');
      sql.write('JOIN Tag AS t ON it.tagID = t.id ');
    }

    // --- 3. APPLY FILTERS ---

    // A. Base Filter
    whereClauses.add(isDownloads ? 'bi.isSnatched = 1' : 'bi.isFavourite = 1');

    // B. Site Filter
    if (siteQuery.isNotEmpty) whereClauses.add(siteQuery);

    // C. Custom Conditions
    if (customConditions.isNotEmpty) {
      whereClauses.add('(${customConditions.join(' AND ')})');
    }

    // D. Exclusions
    if (excludeTags.isNotEmpty) {
      final placeholders = List.filled(excludeTags.length, '?').join(',');
      whereClauses.add('''
        bi.id NOT IN (
          SELECT it_ex.booruItemID 
          FROM ImageTag it_ex 
          JOIN Tag t_ex ON it_ex.tagID = t_ex.id 
          WHERE t_ex.name IN ($placeholders)
        )
      ''');
      args.addAll(excludeTags);
    }

    // E. Inclusions
    if (searchTags.isNotEmpty) {
      final placeholders = List.filled(searchTags.length, '?').join(',');
      whereClauses.add('t.name IN ($placeholders)');
      args.addAll(searchTags);
    }

    // Apply WHERE
    if (whereClauses.isNotEmpty) {
      sql.write('WHERE ${whereClauses.join(' AND ')} ');
    }

    // --- 4. INTERSECTION LOGIC ---
    // For COUNT with multiple tags, we must count the GROUPS, not the rows.
    if (searchTags.isNotEmpty) {
      // Logic:
      // 1. Group by ID
      // 2. Filter groups that have ALL tags
      // 3. Count the resulting groups
      sql.write('GROUP BY bi.id HAVING COUNT(DISTINCT t.id) = ? ');
      args.add(searchTags.length);

      // Because we used GROUP BY, the result will be multiple rows (one 'count' per item).
      // We need to wrap this to count the number of rows returned.

      final fullSql = 'SELECT COUNT(*) as total FROM ($sql)';
      final result = await db.rawQuery(fullSql, args);
      return result.first['total'] as int? ?? 0;
    } else {
      // Simple case (No Group By needed)
      final result = await db.rawQuery(sql.toString(), args);
      return result.first['count'] as int? ?? 0;
    }
  }

  Future<int> getFavouritesCount() async {
    List? result;
    result = await db?.rawQuery('SELECT COUNT(*) as count FROM BooruItem WHERE isFavourite = 1');

    if (result != null) {
      return result.first['count'];
    } else {
      return 0;
    }
  }

  Future<int> getSnatchedCount() async {
    List? result;
    result = await db?.rawQuery('SELECT COUNT(*) as count FROM BooruItem WHERE isSnatched = 1');

    if (result != null) {
      return result.first['count'];
    } else {
      return 0;
    }
  }

  Future<void> clearSnatched() async {
    await db?.rawUpdate('UPDATE BooruItem SET isSnatched = 0');
    unawaited(deleteUntracked());
  }

  Future<void> clearFavourites() async {
    await db?.rawUpdate('UPDATE BooruItem SET isFavourite = 0');
    unawaited(deleteUntracked());
  }

  /// Adds tags for a BooruItem to the database
  Future<void> updateTags(List<String> tags, String? itemID) async {
    if (itemID == null) {
      return;
    }
    String? id = '';
    // TODO rewrite using batch
    for (final tag in tags) {
      id = await getTagID(tag);
      if (id.isEmpty) {
        final result = await db?.rawInsert('INSERT INTO Tag(name) VALUES(?)', [tag]);
        id = result?.toString();
      }
      await db?.rawInsert('INSERT INTO ImageTag(tagID, booruItemID) VALUES(?,?)', [id, itemID]);
    }
  }

  /// Adds tags for a BooruItem to the database
  Future<void> updateTagsFromObjects(List<Tag> tags) async {
    String? id = '';
    // TODO rewrite using batch
    for (final tag in tags) {
      id = await getTagID(tag.fullString);
      if (id.isEmpty) {
        final result = await db?.rawInsert('INSERT INTO Tag(name, tagType, updatedAt) VALUES(?,?,?)', [
          tag.fullString,
          tag.tagType.name,
          tag.updatedAt,
        ]);
        id = result?.toString();
      } else {
        await db?.rawUpdate('UPDATE Tag SET tagType = ?,updatedAt = ? WHERE id = ?', [
          tag.tagType.name,
          tag.updatedAt,
          id,
        ]);
      }
    }
    return;
  }

  /// Gets a tag id from the database
  Future<String> getTagID(String tagName) async {
    // TODO rewrite using batch
    final result = await db?.rawQuery('SELECT id FROM Tag WHERE name IN (?)', [tagName]);
    if (result != null && result.isNotEmpty) {
      return result.first['id'].toString();
    } else {
      return '';
    }
  }

  /// Get a list of tags from the database based on an input
  Future<List<String>> getTags(String queryStr, int limit) async {
    final List<String> tags = [];
    final result = await db?.rawQuery('SELECT DISTINCT name FROM Tag WHERE lower(name) LIKE (?) LIMIT $limit', [
      '${queryStr.toLowerCase()}%',
    ]);
    if (result != null && result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        tags.add(result[i]['name'].toString());
      }
    }
    return tags;
  }

  /// Get tags sorted by usage count (how many items they're attached to)
  /// If [queryStr] is provided, filters tags that start with the query
  /// Returns a list of maps with 'name' and 'count' keys
  Future<List<({String name, int count})>> getTagsByUsageCount(String? queryStr, int limit) async {
    final List<({String name, int count})> tags = [];

    String query;
    List<Object?> args;

    if (queryStr != null && queryStr.isNotEmpty) {
      query = '''
        SELECT t.name, COUNT(it.booruItemID) as count
        FROM Tag t
        LEFT JOIN ImageTag it ON t.id = it.tagID
        WHERE lower(t.name) LIKE (?)
        GROUP BY t.id
        ORDER BY count DESC
        LIMIT ?
      ''';
      args = ['${queryStr.toLowerCase()}%', limit];
    } else {
      query = '''
        SELECT t.name, COUNT(it.booruItemID) as count
        FROM Tag t
        LEFT JOIN ImageTag it ON t.id = it.tagID
        GROUP BY t.id
        ORDER BY count DESC
        LIMIT ?
      ''';
      args = [limit];
    }

    final result = await db?.rawQuery(query, args);
    if (result != null && result.isNotEmpty) {
      for (final row in result) {
        final name = row['name']?.toString() ?? '';
        final count = row['count'] as int? ?? 0;
        if (name.isNotEmpty) {
          tags.add((name: name, count: count));
        }
      }
    }
    return tags;
  }

  /// functions related to tab backup logic:
  Future<void> addTabRestore(String restore) async {
    final result = await db?.rawQuery('SELECT id FROM TabRestore ORDER BY id DESC LIMIT 1');
    if (result != null && result.isNotEmpty) {
      // replace existing entry
      await db?.rawUpdate('UPDATE TabRestore SET restore = ? WHERE id = ?;', [restore, result[0]['id'].toString()]);
    } else {
      // or add new if no entries
      await db?.rawInsert('INSERT INTO TabRestore(restore) VALUES(?);', [restore]);
    }

    // clear all then add a new one
    // await clearTabRestore();
    // await db?.rawInsert("INSERT INTO TabRestore(restore) VALUES(?);", [restore]);
    return;
  }

  Future<void> clearTabRestore() async {
    await db?.rawDelete('DELETE FROM TabRestore WHERE id IS NOT NULL;'); // remove previous items
    return;
  }

  Future<String?> getTabRestore() async {
    final result = await db?.rawQuery('SELECT id, restore FROM TabRestore ORDER BY id DESC LIMIT 1;');
    String? restoreItem;
    if (result != null && result.isNotEmpty) {
      restoreItem = result[0]['restore'].toString();
    }
    return restoreItem;
  }

  Future<void> removeTabRestore(String id) async {
    await db?.rawDelete('DELETE FROM TabRestore WHERE id=?;', [id]);
    return;
  }
  ///////

  /// Remove duplicates and add every new search to history table
  Future<void> updateSearchHistory(String searchText, String? booruType, String? booruName) async {
    // trim extra spaces
    searchText = searchText.trim();

    // remove non-favourite duplicates of new entry
    const String notFavouriteQuery = "(isFavourite != '1' OR isFavourite is null)";
    await db?.rawDelete(
      'DELETE FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND $notFavouriteQuery;',
      [searchText, booruType, booruName],
    );

    final favouriteDuplicates = await db?.rawQuery(
      "SELECT * FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1';",
      [searchText, booruType, booruName],
    );
    if (favouriteDuplicates == null || favouriteDuplicates.isEmpty) {
      // insert new entry only if it wasn't favourited before
      await db?.rawInsert('INSERT INTO SearchHistory(searchText, booruType, booruName) VALUES(?,?,?)', [
        searchText,
        booruType,
        booruName,
      ]);
    } else {
      // otherwise update the last seartch time
      await db?.rawUpdate(
        "UPDATE SearchHistory SET timestamp = CURRENT_TIMESTAMP WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1';",
        [searchText, booruType, booruName],
      );
    }

    // remove everything except last X entries (ignores favourited)
    await db?.rawDelete(
      'DELETE FROM SearchHistory WHERE $notFavouriteQuery AND id NOT IN (SELECT id FROM SearchHistory WHERE $notFavouriteQuery ORDER BY id DESC LIMIT ${Constants.historyLimit});',
    );
  }

  /// Get search history entries
  Future<List<HistoryItem>> getSearchHistory() async {
    final metaData = await db?.rawQuery('SELECT * FROM SearchHistory GROUP BY searchText, booruName ORDER BY id DESC');
    final List<Map<String, dynamic>> result = [];
    metaData?.forEach((s) {
      result.add({
        'id': s['id'],
        'searchText': s['searchText'].toString(),
        'booruType': s['booruType'].toString(),
        'booruName': s['booruName'].toString(),
        'isFavourite': s['isFavourite'].toString(),
        'timestamp': s['timestamp'].toString(),
      });
    });
    return List.from(result.map(HistoryItem.fromMap));
  }

  Future<List<HistoryItem>> getLatestSearchHistory() async {
    final metaData = await db?.rawQuery(
      'SELECT * FROM (SELECT * FROM SearchHistory ORDER BY timestamp DESC LIMIT 20)',
    );
    final List<Map<String, dynamic>> result = [];
    metaData?.forEach((s) {
      result.add({
        'id': s['id'],
        'searchText': s['searchText'].toString(),
        'booruType': s['booruType'].toString(),
        'booruName': s['booruName'].toString(),
        'isFavourite': s['isFavourite'].toString(),
        'timestamp': s['timestamp'].toString(),
      });
    });
    return List.from(result.map(HistoryItem.fromMap));
  }

  Future<List<String>> getSearchHistoryByInput(String queryStr, int limit) async {
    final List<String> tags = [];
    final result = await db?.rawQuery(
      'SELECT DISTINCT searchText FROM SearchHistory WHERE lower(searchText) LIKE (?) LIMIT $limit',
      ['${queryStr.toLowerCase()}%'],
    );
    if (result != null && result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        tags.add(result[i]['searchText'].toString());
      }
    }
    return tags;
  }

  /// Delete entry from search history (if no id given - clears everything)
  Future<void> deleteFromSearchHistory(int? id) async {
    if (id != null) {
      await db?.rawDelete('DELETE FROM SearchHistory WHERE id IN (?)', [id]);
    } else {
      await db?.rawDelete('DELETE FROM SearchHistory WHERE id IS NOT NULL');
    }
    return;
  }

  /// Set/unset search history entry as favourite
  Future<void> setFavouriteSearchHistory(int id, bool isFavourite) async {
    await db?.rawUpdate('UPDATE SearchHistory SET isFavourite = ? WHERE id = ?', [Tools.boolToInt(isFavourite), id]);
    return;
  }

  ///////
  /// Pinned Tags methods

  /// Add a pinned tag (global or booru-specific)
  Future<int?> addPinnedTag(
    String tagName, {
    String? booruType,
    String? booruName,
    List<String> labels = const [],
  }) async {
    // Check if already pinned with same scope
    final existing = await db?.rawQuery(
      'SELECT id FROM PinnedTag WHERE tagName = ? AND (booruName IS ? OR (booruName = ? AND booruType = ?))',
      [tagName, booruName, booruName, booruType],
    );
    if (existing != null && existing.isNotEmpty) {
      return null; // Already pinned
    }

    final pinnedAt = DateTime.now().millisecondsSinceEpoch;
    final labelsString = labels.isNotEmpty ? labels.join(',') : null;
    final result = await db?.rawInsert(
      'INSERT INTO PinnedTag(tagName, booruType, booruName, pinnedAt, sortOrder, label) VALUES(?, ?, ?, ?, ?, ?)',
      [tagName, booruType, booruName, pinnedAt, 0, labelsString],
    );
    return result;
  }

  /// Remove a pinned tag by id
  Future<void> removePinnedTag(int id) async {
    await db?.rawDelete('DELETE FROM PinnedTag WHERE id = ?', [id]);
  }

  /// Remove a pinned tag by tagName and scope
  Future<void> removePinnedTagByName(String tagName, {String? booruType, String? booruName}) async {
    if (booruName == null) {
      await db?.rawDelete('DELETE FROM PinnedTag WHERE tagName = ? AND booruName IS NULL', [tagName]);
    } else {
      await db?.rawDelete(
        'DELETE FROM PinnedTag WHERE tagName = ? AND booruName = ? AND booruType = ?',
        [tagName, booruName, booruType],
      );
    }
  }

  /// Get all pinned tags (both global and booru-specific for the given booru)
  Future<List<PinnedTag>> getPinnedTags({String? booruType, String? booruName}) async {
    final List<Map<String, dynamic>>? result = await db?.rawQuery(
      'SELECT * FROM PinnedTag WHERE booruName IS NULL OR (booruName = ? AND booruType = ?) ORDER BY sortOrder ASC, pinnedAt DESC',
      [booruName, booruType],
    );

    if (result == null || result.isEmpty) {
      return [];
    }

    return result.map(PinnedTag.fromMap).toList();
  }

  /// Get all pinned tags (regardless of booru)
  Future<List<PinnedTag>> getAllPinnedTags() async {
    final List<Map<String, dynamic>>? result = await db?.rawQuery(
      'SELECT * FROM PinnedTag ORDER BY sortOrder ASC, pinnedAt DESC',
    );

    if (result == null || result.isEmpty) {
      return [];
    }

    return result.map(PinnedTag.fromMap).toList();
  }

  /// Check if a tag is pinned (either globally or for specific booru)
  Future<PinnedTag?> getPinnedTag(String tagName, {String? booruType, String? booruName}) async {
    // First check for booru-specific pin
    if (booruName != null) {
      final booruSpecific = await db?.rawQuery(
        'SELECT * FROM PinnedTag WHERE tagName = ? AND booruName = ? AND booruType = ?',
        [tagName, booruName, booruType],
      );
      if (booruSpecific != null && booruSpecific.isNotEmpty) {
        return PinnedTag.fromMap(booruSpecific.first);
      }
    }

    // Then check for global pin
    final global = await db?.rawQuery(
      'SELECT * FROM PinnedTag WHERE tagName = ? AND booruName IS NULL',
      [tagName],
    );
    if (global != null && global.isNotEmpty) {
      return PinnedTag.fromMap(global.first);
    }

    return null;
  }

  /// Update sort order for pinned tags
  Future<void> updatePinnedTagOrder(int id, int sortOrder) async {
    await db?.rawUpdate('UPDATE PinnedTag SET sortOrder = ? WHERE id = ?', [sortOrder, id]);
  }

  /// Batch update sort order for multiple pinned tags
  Future<void> updatePinnedTagsOrder(List<PinnedTag> tags) async {
    final batch = db?.batch();
    for (int i = 0; i < tags.length; i++) {
      batch?.rawUpdate('UPDATE PinnedTag SET sortOrder = ? WHERE id = ?', [i, tags[i].id]);
    }
    await batch?.commit(noResult: true);
  }

  /// Update labels for a pinned tag (stored as comma-separated string)
  Future<void> updatePinnedTagLabels(int id, List<String> labels) async {
    final labelsString = labels.join(',');
    await db?.rawUpdate('UPDATE PinnedTag SET label = ? WHERE id = ?', [labelsString, id]);
  }

  /// Get all unique labels from pinned tags (parses comma-separated labels)
  Future<List<String>> getPinnedTagLabels({String? booruType, String? booruName}) async {
    final List<Map<String, dynamic>>? result = await db?.rawQuery(
      "SELECT DISTINCT label FROM PinnedTag WHERE label IS NOT NULL AND label != '' AND (booruName IS NULL OR (booruName = ? AND booruType = ?))",
      [booruName, booruType],
    );

    if (result == null || result.isEmpty) {
      return [];
    }

    // Parse comma-separated labels and collect unique ones
    final Set<String> uniqueLabels = {};
    for (final row in result) {
      final labelString = row['label'] as String;
      final labels = labelString.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
      uniqueLabels.addAll(labels);
    }

    final labelsList = uniqueLabels.toList()..sort();
    return labelsList;
  }

  /// Return a list of boolean for isSnatched and isFavourite
  Future<List<bool>> getTrackedValues(BooruItem item) async {
    final List<bool> values = [false, false];
    List? result;

    // DateTime startTime = DateTime.now();
    if (item.fileURL.contains('sankakucomplex.com') ||
        item.fileURL.contains('rule34.xxx') ||
        item.fileURL.contains('paheal.net')) {
      // compare by post url, not file url (for example: r34xxx changes urls based on country)
      result = await db?.rawQuery('SELECT isFavourite, isSnatched FROM BooruItem WHERE postURL = ?', [item.postURL]);
    } else {
      result = await db?.rawQuery('SELECT isFavourite, isSnatched FROM BooruItem WHERE fileURL = ?', [item.fileURL]);
    }
    // print("getTrackedValues: ${DateTime.now().difference(startTime).inMilliseconds}ms"); // performance test
    if (result != null && result.isNotEmpty) {
      values[0] = Tools.intToBool(result.first['isSnatched']);
      values[1] = Tools.intToBool(result.first['isFavourite']);
    }
    return values;
  }

  /// Return a list of lists of boolean for isSnatched and isFavourite, attempt to make a bulk fetcher
  Future<List<List<bool>>> getMultipleTrackedValues(List<BooruItem> items) async {
    final List<List<bool>> values = [];

    final List<String> queryParts = [];
    final List<String> queryArgs = [];
    for (final BooruItem item in items) {
      if (item.fileURL.contains('sankakucomplex.com') ||
          item.fileURL.contains('rule34.xxx') ||
          item.fileURL.contains('paheal.net')) {
        // compare by post url, not file url (for example: r34xxx changes urls based on country)
        // TODO merge them by type? i.e. - (postURL in [] OR fileURL in [])
        queryParts.add('postURL = ?');
        queryArgs.add(item.postURL);
      } else {
        queryParts.add('fileURL = ?');
        queryArgs.add(item.fileURL);
      }
    }

    // DateTime startTime = DateTime.now();
    final List? result = await db?.rawQuery(
      "SELECT fileURL, postURL, isFavourite, isSnatched FROM BooruItem WHERE ${queryParts.join(' OR ')};",
      queryArgs,
    );
    // print("Query took ${DateTime.now().difference(startTime).inMilliseconds}ms"); // performance test

    if (result != null) {
      for (final BooruItem item in items) {
        final res = result.firstWhere(
          (el) => el['postURL'].toString() == item.postURL,
          orElse: () => {'isSnatched': 0, 'isFavourite': 0},
        );
        values.add([Tools.intToBool(res['isSnatched']), Tools.intToBool(res['isFavourite'])]);
      }
    }
    return values;
  }

  /// Deletes booruItems which are no longer favourited or snatched
  Future<bool> deleteUntracked() async {
    final result = await db?.rawQuery(
      'SELECT id FROM BooruItem WHERE (isFavourite = 0 OR isFavourite IS NULL) AND (isSnatched = 0 OR isSnatched IS NULL)',
    );
    if (result != null && result.isNotEmpty) {
      await deleteItem(result.map((r) => r['id'].toString()).toList());
    }
    return true;
  }

  /// Deletes a BooruItem and its tags from the database
  Future<void> deleteItem(List<String> itemIDs) async {
    Logger.Inst().log(
      'DBHandler deleting ${itemIDs.length} items',
      'DBHandler',
      'deleteItem',
      LogTypes.booruHandlerInfo,
    );
    const int chunkSize = 1000;
    for (int i = 0; i < (itemIDs.length / chunkSize).ceil(); i++) {
      final chunk = itemIDs.sublist(i * chunkSize, min(itemIDs.length, (i + 1) * chunkSize));
      final batch = db?.batch();
      for (final id in chunk) {
        batch?.rawDelete('DELETE FROM BooruItem WHERE id = ?', [id]);
        batch?.rawDelete('DELETE FROM ImageTag WHERE booruItemID = ?', [id]);
      }
      await batch?.commit(noResult: true);
    }
  }

  //

  Future<void> fixBooruItems(ValueChanged<String>? onStatusUpdate) async {
    try {
      await convertGelbooruServers(
        'img2',
        'video-cdn4',
        onStatusUpdate,
      ); // latest change i4->2, v3->4, ~early-mid December 25
      await fixR34XXXPostUrls(onStatusUpdate);
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        s: s,
        'DBHandler',
        'fixBooruItems',
        LogTypes.exception,
      );
    }
  }

  Future<void> convertGelbooruServers(
    String newImgServer,
    String newVidServer,
    ValueChanged<String>? onStatusUpdate,
  ) async {
    final List<String> conditions = [];
    for (final server in [
      {'img': newImgServer},
      {'video-cdn': newVidServer},
    ]) {
      for (final type in ['fileURL', 'sampleURL', 'thumbnailURL']) {
        conditions.add(
          "($type LIKE '%${server.keys.first}%.gelbooru.com%' AND $type NOT LIKE '%${server.values.first}.gelbooru.com%')",
        );
      }
    }

    // gelbooru moves images (imgN) and videos (cdnN) to new servers from time to time?
    final List<Map<String, dynamic>> items =
        await db?.rawQuery(
          'SELECT id, fileURL, sampleURL, thumbnailURL FROM BooruItem WHERE '
          "(${conditions.join(' OR ')} " // migrate to other servers
          "OR fileURL LIKE 'https://%//%' OR sampleURL LIKE 'https://%//%' OR thumbnailURL LIKE 'https://%//%') " // fix multiple slashes (except https://)
          "AND postURL LIKE '%gelbooru.com%';",
        ) ??
        [];

    const int chunkSize = 1000;
    for (int i = 0; i < (items.length / chunkSize).ceil(); i++) {
      final batch = db?.batch();
      final chunk = items.sublist(i * chunkSize, min(items.length, (i + 1) * chunkSize));
      onStatusUpdate?.call('Gelbooru: ${i * chunkSize}/${items.length}');
      for (final Map<String, dynamic> item in chunk) {
        final String newFileURL = item['fileURL']
            .toString()
            .replaceAllMapped(RegExp(r'img(\d+).gelbooru.com'), (m) => '$newImgServer.gelbooru.com')
            .replaceAllMapped(RegExp(r'video-cdn(\d+).gelbooru.com'), (m) => '$newVidServer.gelbooru.com')
            .replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/');
        final String newSampleURL = item['sampleURL']
            .toString()
            .replaceAllMapped(RegExp(r'img(\d+).gelbooru.com'), (m) => '$newImgServer.gelbooru.com')
            .replaceAllMapped(RegExp(r'video-cdn(\d+).gelbooru.com'), (m) => '$newVidServer.gelbooru.com')
            .replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/');
        final String newThumbnailURL = item['thumbnailURL']
            .toString()
            .replaceAllMapped(RegExp(r'img(\d+).gelbooru.com'), (m) => '$newImgServer.gelbooru.com')
            .replaceAllMapped(RegExp(r'video-cdn(\d+).gelbooru.com'), (m) => '$newVidServer.gelbooru.com')
            .replaceFirstMapped(RegExp('(?<!https?:)//'), (m) => '/');
        batch?.rawUpdate(
          'UPDATE BooruItem SET fileURL = ?, sampleURL = ?, thumbnailURL = ? WHERE id = ?;',
          [newFileURL, newSampleURL, newThumbnailURL, item['id']],
        );
      }
      await batch?.commit(noResult: true);
    }
  }

  Future<void> fixR34XXXPostUrls(ValueChanged<String>? onStatusUpdate) async {
    // 2.4.4+4203 introduced a bug where postURL was changed to api.rule34.xxx, this fixes those entries back to just rule34.xxx

    final List<Map<String, dynamic>> items =
        await db?.rawQuery(
          "SELECT id, postURL FROM BooruItem WHERE postURL LIKE '%api.rule34.xxx%';",
        ) ??
        [];

    const int chunkSize = 1000;
    for (int i = 0; i < (items.length / chunkSize).ceil(); i++) {
      final batch = db?.batch();
      final chunk = items.sublist(i * chunkSize, min(items.length, (i + 1) * chunkSize));
      onStatusUpdate?.call('R34XXX: ${i * chunkSize}/${items.length}');
      for (final Map<String, dynamic> item in chunk) {
        final String newPostURL = item['postURL'].toString().replaceAll('api.rule34.xxx', 'rule34.xxx');
        batch?.rawUpdate(
          'UPDATE BooruItem SET postURL = ? WHERE id = ?;',
          [newPostURL, item['id']],
        );
      }
      await batch?.commit(noResult: true);
    }
  }

  /// Scans for empty tags and direct duplicates, then deletes them.
  Future<void> tagsCleanup() async {
    if (db == null) return;

    try {
      final emptyTags = await db?.rawQuery("SELECT id FROM Tag WHERE trim(name) = '' OR name IS NULL") ?? [];

      if (emptyTags.isNotEmpty) {
        Logger.Inst().log(
          '[TagCleanup] Found ${emptyTags.length} empty tags. Removing...',
          'DBHandler',
          'tagsCleanup',
          LogTypes.booruHandlerInfo,
        );

        await db?.transaction((txn) async {
          final ids = emptyTags.map((e) => e['id']! as int).toList();
          final placeholders = List.filled(ids.length, '?').join(',');
          await txn.rawDelete('DELETE FROM ImageTag WHERE tagID IN ($placeholders)', ids);
          await txn.rawDelete('DELETE FROM Tag WHERE id IN ($placeholders)', ids);
        });
      }

      //

      final duplicateGroups =
          await db?.rawQuery('''
        SELECT name as cleanName, COUNT(*) as count 
        FROM Tag 
        GROUP BY name 
        HAVING count > 1
      ''') ??
          [];

      if (duplicateGroups.isEmpty) return;

      Logger.Inst().log(
        '[TagCleanup] Found ${duplicateGroups.length} duplicate tag groups.',
        'DBHandler',
        'tagsCleanup',
        LogTypes.booruHandlerInfo,
      );

      for (final g in duplicateGroups) {
        final String cleanName = g['cleanName']! as String;

        final variants =
            await db?.rawQuery('SELECT id, name FROM Tag WHERE name = ? ORDER BY id ASC', [cleanName]) ?? [];

        if (variants.length < 2) continue;

        int winnerId = -1;
        int maxUsage = -1;

        for (final v in variants) {
          final int id = v['id']! as int;
          final int count =
              Sqflite.firstIntValue(await db?.rawQuery('SELECT COUNT(*) FROM ImageTag WHERE tagID = ?', [id]) ?? []) ??
              0;

          if (count > maxUsage) {
            maxUsage = count;
            winnerId = id;
          }
        }

        await db?.transaction((txn) async {
          for (final v in variants) {
            final int id = v['id']! as int;
            if (id == winnerId) continue;
            await txn.rawUpdate(
              '''
              UPDATE ImageTag 
              SET tagID = ? 
              WHERE tagID = ? 
              AND booruItemID NOT IN (
                SELECT booruItemID FROM ImageTag WHERE tagID = ?
              )
            ''',
              [winnerId, id, winnerId],
            );
            await txn.rawDelete('DELETE FROM ImageTag WHERE tagID = ?', [id]);
            await txn.rawDelete('DELETE FROM Tag WHERE id = ?', [id]);
          }
        });
        if (kDebugMode) {
          Logger.Inst().log(
            '[TagCleanup] Removed duplicate tags for "$cleanName".',
            'DBHandler',
            'tagsCleanup',
            LogTypes.booruHandlerInfo,
          );
        }
      }

      Logger.Inst().log(
        '[TagCleanup] Done.',
        'DBHandler',
        'tagsCleanup',
        LogTypes.booruHandlerInfo,
      );
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        s: s,
        'DBHandler',
        'deduplicateTags',
        LogTypes.exception,
      );
    }
  }
}
