import 'dart:io';

import 'package:sqflite/sqflite.dart';

/// File operations run on private staging files, never on a partially copied
/// live database. Uses the same SQLite implementation as the app connection.
class DatabaseBackupService {
  const DatabaseBackupService();

  Future<void> createSnapshot(File source, File destination, {Database? database}) async {
    if (!await source.exists()) throw StateError('Database file does not exist');
    if (await destination.exists()) throw StateError('Snapshot destination already exists');
    final connection = database ?? await openDatabase(source.path, singleInstance: false);
    try {
      final originalMode = (await connection.rawQuery('PRAGMA journal_mode')).single.values.single;
      const modes = {'delete', 'truncate', 'persist', 'memory', 'wal', 'off'};
      if (originalMode is! String || !modes.contains(originalMode)) {
        throw StateError('Unknown database journal mode');
      }
      try {
        // Switching out of WAL checkpoints committed pages into the main file.
        // This also works on Android versions too old to support VACUUM INTO.
        final mode = (await connection.rawQuery('PRAGMA journal_mode = DELETE')).single.values.single;
        if (mode != 'delete') throw StateError('Unable to checkpoint database for backup');
        await connection.transaction((txn) async {
          // Keep other app operations queued and other connections locked out
          // until the local copy is complete. No database writes in this block.
          await txn.rawQuery('SELECT count(*) FROM sqlite_master');
          await source.copy(destination.path);
        }, exclusive: true);
      } finally {
        await _setJournalMode(connection, originalMode);
      }
    } finally {
      if (database == null) await connection.close();
    }
  }

  Future<void> _setJournalMode(Database connection, String mode) async {
    final restoredMode = (await connection.rawQuery('PRAGMA journal_mode = $mode')).single.values.single;
    if (restoredMode != mode) throw StateError('Unable to restore database journal mode');
  }

  Future<void> validate(File file) async {
    if (!await file.exists() || await file.length() < 100) {
      throw const FormatException('Missing or incomplete database backup');
    }
    final connection = await openDatabase(file.path, readOnly: true, singleInstance: false);
    try {
      final integrity = await connection.rawQuery('PRAGMA integrity_check');
      if (integrity.length != 1 || integrity.single.values.single != 'ok') {
        throw const FormatException('Database backup failed integrity validation');
      }
      // Require the original core schema, allowing older backups whose optional
      // tables/columns are added by DBHandler.updateTable on the next startup.
      const requiredColumns = {
        'BooruItem': {
          'id',
          'thumbnailURL',
          'sampleURL',
          'fileURL',
          'postURL',
          'mediaType',
          'isSnatched',
          'isFavourite',
        },
        'Tag': {'id', 'name'},
        'ImageTag': {'tagID', 'booruItemID'},
      };
      final tables = await connection.rawQuery("SELECT name FROM sqlite_master WHERE type = 'table'");
      final tableNames = tables.map((row) => row['name']).whereType<String>().map((name) => name.toLowerCase()).toSet();
      for (final entry in requiredColumns.entries) {
        if (!tableNames.contains(entry.key.toLowerCase())) {
          throw FormatException('Database backup is missing ${entry.key}');
        }
        final columns = await connection.rawQuery('PRAGMA table_info("${entry.key}")');
        final names = columns.map((row) => row['name']).whereType<String>().map((name) => name.toLowerCase()).toSet();
        if (!names.containsAll(entry.value.map((name) => name.toLowerCase()))) {
          throw FormatException('Database backup has an incompatible ${entry.key} table');
        }
      }
    } finally {
      await connection.close();
    }
  }

  /// Both files must be on the same filesystem, and the live connection must
  /// already be closed. Retain the original and its sidecars until installation
  /// has succeeded. Leave the recovery directory intact if rollback fails.
  Future<void> install(
    File staged,
    File live,
    Directory recovery, {
    required Future<void> Function() reopen,
    required Future<void> Function() close,
  }) async {
    final moved = <({File original, File saved})>[];
    bool installed = false;
    try {
      for (final suffix in ['', '-wal', '-shm', '-journal']) {
        final original = File('${live.path}$suffix');
        if (await original.exists()) {
          final saved = await original.rename('${recovery.path}/store.db$suffix');
          moved.add((original: original, saved: saved));
        }
      }
      await staged.rename(live.path);
      installed = true;
      // Check the installed file before considering the replacement successful.
      await validate(live);
      await reopen();
    } catch (_) {
      if (installed) {
        await close();
        for (final suffix in ['', '-wal', '-shm', '-journal']) {
          final replacement = File('${live.path}$suffix');
          if (await replacement.exists()) await replacement.delete();
        }
      }
      for (final entry in moved.reversed) {
        await entry.saved.rename(entry.original.path);
      }
      rethrow;
    }
  }
}
