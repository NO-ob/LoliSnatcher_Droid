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

bool _isPluralMap(Map map) {
  const pluralKeys = ['zero', 'one', 'two', 'few', 'many', 'other'];
  if (map.isEmpty) return false;

  for (final key in map.keys) {
    if (!pluralKeys.contains(key.toString())) return false;
  }
  return true;
}

Map<String, dynamic> _cleanAndSort(Map master, Map target) {
  final Map<String, dynamic> result = {};

  for (final key in master.keys) {
    final keyStr = key.toString();

    if (target.containsKey(key)) {
      final masterValue = master[key];
      final targetValue = target[key];

      if (masterValue is Map && targetValue is Map) {
        if (_isPluralMap(masterValue)) {
          final Map<String, dynamic> pluralResult = {};
          const pluralOrder = ['zero', 'one', 'two', 'few', 'many', 'other'];

          final targetOther = targetValue['other'];
          final hasOther = targetOther != null && targetOther != '';

          for (final pk in pluralOrder) {
            final tVal = targetValue[pk];

            if (tVal != null && tVal != '') {
              pluralResult[pk] = tVal;
            } else if (hasOther) {
              // Target is missing the key, but we have 'other' to use as a base.
              // Enforce the standard 'one', 'few', 'many', 'other' set.
              // Also restore 'zero' or 'two' if they existed in the master en.json.
              if (['one', 'few', 'many', 'other'].contains(pk) || masterValue.containsKey(pk)) {
                pluralResult[pk] = targetOther;
              }
            }
          }

          if (pluralResult.isNotEmpty) {
            result[keyStr] = pluralResult;
          }
        } else {
          final nestedResult = _cleanAndSort(masterValue, targetValue);
          if (nestedResult.isNotEmpty) {
            result[keyStr] = nestedResult;
          }
        }
      } else {
        if (targetValue != '') {
          result[keyStr] = targetValue;
        }
      }
    }
  }

  if (keepDeprecatedKeys) {
    for (final key in target.keys) {
      final keyStr = key.toString();
      if (!master.containsKey(key)) {
        final targetValue = target[key];

        if (targetValue is Map) {
          final cleanedOrphan = _filterEmptyStrings(targetValue);
          if (cleanedOrphan.isNotEmpty) {
            result[keyStr] = cleanedOrphan;
          }
        } else if (targetValue != '') {
          result[keyStr] = targetValue;
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
    final keyStr = key.toString();

    if (value is Map) {
      final nested = _filterEmptyStrings(value);
      if (nested.isNotEmpty) result[keyStr] = nested;
    } else if (value != '') {
      result[keyStr] = value;
    }
  }
  return result;
}
