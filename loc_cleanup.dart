import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import 'lib/src/utils/localization_plural_rules.dart';

const _pluralOrder = ['zero', 'one', 'two', 'few', 'many', 'other'];

Future<void> main(List<String> args) async {
  if (args.any((arg) => arg != '--check')) {
    stderr.writeln('Usage: loc_cleanup.dart [--check]');
    exitCode = 64;
    return;
  }
  final checkOnly = args.contains('--check');
  final directory = Directory(p.join('assets', 'i18n'));
  final masterFile = File(p.join(directory.path, 'en.json'));
  final master = jsonDecode(await masterFile.readAsString()) as Map<String, dynamic>;
  const encoder = JsonEncoder.withIndent('    ');

  for (final file in directory.listSync().whereType<File>().where((file) => p.extension(file.path) == '.json')) {
    // Slang analyze writes _missing_translations_*.json and
    // _unused_translations.json here; these are reports, not locale sources.
    if (p.basename(file.path).startsWith('_')) continue;
    final locale = p.basenameWithoutExtension(file.path);
    final categories = LocalizationPluralRules.categoriesFor(locale);
    final content = await file.readAsString();
    final Map<String, dynamic> target;
    try {
      final decoded = jsonDecode(content);
      if (decoded is! Map<String, dynamic>) throw const FormatException('Expected a translation object');
      target = decoded;
    } on FormatException catch (error) {
      stderr.writeln('Invalid JSON in ${file.path}: $error');
      exitCode = 65;
      continue;
    }
    final cleaned = _cleanAndSort(master, target, categories);
    final output = '${encoder.convert(cleaned)}\n';
    if (content == output) continue;
    if (checkOnly) {
      stdout.writeln('Cleanup needed: ${file.path}');
      if (exitCode == 0) exitCode = 1;
    } else {
      await file.writeAsString(output);
      stdout.writeln('Cleaned ${file.path}');
    }
  }
}

bool _isPluralMap(Map<String, dynamic> value) => value.isNotEmpty && value.keys.every(_pluralOrder.contains);

Map<String, dynamic> _cleanAndSort(Map<String, dynamic> master, Map<String, dynamic> target, Set<String> categories) {
  final result = <String, dynamic>{};
  for (final entry in master.entries) {
    final value = target[entry.key];
    if (entry.value is Map<String, dynamic> && value is Map<String, dynamic>) {
      final masterValue = entry.value as Map<String, dynamic>;
      final Map<String, dynamic> nested;
      if (_isPluralMap(masterValue)) {
        // Additional categories may be valid even when absent from English.
        // Keep real translations only, never clones of another category.
        nested = {
          for (final category in _pluralOrder)
            if (categories.contains(category) &&
                value[category] is String &&
                (value[category] as String).trim().isNotEmpty)
              category: value[category],
        };
        if (!nested.containsKey('other')) continue;
      } else {
        nested = _cleanAndSort(masterValue, value, categories);
      }
      if (nested.isNotEmpty) result[entry.key] = nested;
    } else if (entry.value is String && value is String && value.trim().isNotEmpty) {
      result[entry.key] = value;
    }
  }
  return result;
}
