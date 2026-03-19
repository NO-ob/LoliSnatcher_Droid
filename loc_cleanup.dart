import 'dart:io';
import 'dart:convert';

// Configuration: Set to true if you want to keep keys that are in target files
// but missing from en.json (they will be pushed to the bottom of the file).
const bool keepDeprecatedKeys = false;

void main() async {
  const directoryPath = 'assets/i18n';
  final dir = Directory(directoryPath);

  if (!dir.existsSync()) {
    print('Directory $directoryPath does not exist.');
    return;
  }

  final enFile = File('$directoryPath/en.json');
  if (!enFile.existsSync()) {
    print('en.json not found in $directoryPath.');
    return;
  }

  final String enContent = await enFile.readAsString();
  final Map<String, dynamic> masterMap = jsonDecode(enContent);

  const encoder = JsonEncoder.withIndent('    ');

  final files = dir.listSync().whereType<File>().where((file) {
    return file.path.endsWith('.json') && !file.path.endsWith('en.json');
  });

  for (final file in files) {
    print('Cleaning up ${file.path}...');
    final String content = await file.readAsString();

    Map<String, dynamic> targetMap;
    try {
      targetMap = jsonDecode(content);
    } catch (e) {
      print('Skipping ${file.path}: Invalid JSON.');
      continue;
    }

    final cleanedMap = _cleanAndSort(masterMap, targetMap);
    await file.writeAsString(encoder.convert(cleanedMap));
  }

  print('Cleanup finished.');
}

Map<String, dynamic> _cleanAndSort(Map master, Map target) {
  final Map<String, dynamic> result = {};

  for (final key in master.keys) {
    if (target.containsKey(key)) {
      final masterValue = master[key];
      final targetValue = target[key];

      if (masterValue is Map && targetValue is Map) {
        final nestedResult = _cleanAndSort(masterValue, targetValue);
        if (nestedResult.isNotEmpty) {
          result[key.toString()] = nestedResult;
        }
      } else {
        if (targetValue != '') {
          result[key.toString()] = targetValue;
        }
      }
    }
  }

  if (keepDeprecatedKeys) {
    for (final key in target.keys) {
      if (!master.containsKey(key)) {
        final targetValue = target[key];

        if (targetValue is Map) {
          final cleanedOrphan = _filterEmptyStrings(targetValue);
          if (cleanedOrphan.isNotEmpty) {
            result[key.toString()] = cleanedOrphan;
          }
        } else if (targetValue != '') {
          result[key.toString()] = targetValue;
        }
      }
    }
  }

  return result;
}

Map<String, dynamic> _filterEmptyStrings(Map target) {
  final Map<String, dynamic> result = {};
  for (final key in target.keys) {
    final value = target[key];
    if (value is Map) {
      final nested = _filterEmptyStrings(value);
      if (nested.isNotEmpty) result[key.toString()] = nested;
    } else if (value != '') {
      result[key.toString()] = value;
    }
  }
  return result;
}
