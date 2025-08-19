import 'dart:convert';
import 'dart:io';

void main() async {
  // Copy en values to dev
  // dev loc is used to check for hardcoded texts that weren't translated yet
  final File enJsonFile = File('assets/i18n/en.json');
  final Map<String, dynamic> enJson = json.decode(await enJsonFile.readAsString());

  final File devJsonFile = File('assets/i18n/dev.json');
  final Map<String, dynamic> devJson = <String, dynamic>{};

  void deepCopy(Map<String, dynamic> target, Map<String, dynamic> source) {
    source.forEach((String key, dynamic value) {
      // skip comment/doc entries (start with @)
      if (!key.startsWith('@')) {
        if (value is String) {
          String usedValue = value;
          switch (key) {
            case 'locale':
              usedValue = 'dev';
              break;
            case 'localeName':
              usedValue = 'Dev';
              break;
            default:
              usedValue = '{$value}';
              break;
          }
          target[key] = usedValue;
        } else if (value is Map<String, dynamic>) {
          target[key] = <String, dynamic>{};
          deepCopy(target[key] as Map<String, dynamic>, value);
        }
      }
    });
  }

  deepCopy(devJson, enJson);
  await devJsonFile.writeAsString(
    const JsonEncoder.withIndent('    ').convert(devJson),
  );

  if (await checkFvmAvailability()) {
    await Process.run('fvm', ['dart', 'run', 'slang']);
  } else {
    await Process.run('dart', ['run', 'slang']);
  }
}

/// Check if fvm is installed
Future<bool> checkFvmAvailability() async {
  bool fvmAvailable = false;
  try {
    await Process.run('fvm', ['--version']);
    fvmAvailable = true;
  } catch (e) {
    // ignore: empty_catches
  }
  return fvmAvailable;
}
