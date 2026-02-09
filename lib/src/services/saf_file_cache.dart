import 'dart:async';

import 'package:lolisnatcher/src/handlers/service_handler.dart';

class SAFFileCache {
  SAFFileCache._();
  static final SAFFileCache instance = SAFFileCache._();

  String _cachedUri = '';
  final Set<String> _fileNames = {};
  Set<String> get fileNames => _fileNames;
  bool _isPopulated = false;
  bool _isPopulating = false;
  Completer<void>? _populateCompleter;

  Future<bool> existsFile(String safUri, String fileName) async {
    bool result;

    if (safUri == _cachedUri && _isPopulated) {
      result = _fileNames.contains(fileName);
    } else {
      result = await ServiceHandler.existsFileFromSAFDirectoryFast(safUri, fileName);
    }

    return result;
  }

  Future<void> populate(String safUri) async {
    if (_isPopulating) {
      await _populateCompleter?.future;
      return;
    }
    _isPopulating = true;
    _populateCompleter = Completer<void>();

    try {
      _cachedUri = safUri;
      final names = await ServiceHandler.listFileNamesFromSAFDirectory(safUri);
      _fileNames.clear();
      _fileNames.addAll(names);
      _isPopulated = true;
    } catch (e) {
      _isPopulated = false;
    } finally {
      _isPopulating = false;
      _populateCompleter?.complete();
    }
  }

  void onFileCreated(String fileName) {
    if (_isPopulated) {
      _fileNames.add(fileName);
    }
  }

  void onFileDeleted(String fileName) {
    if (_isPopulated) {
      _fileNames.remove(fileName);
    }
  }

  void invalidate() {
    _fileNames.clear();
    _isPopulated = false;
    _cachedUri = '';
  }
}
