import 'dart:io';

import 'loc_build.dart';

/// This script will launch the analyzer for missing/unused translations in non-en locales
void main() async {
  if (await checkFvmAvailability()) {
    await Process.run('fvm', ['dart', 'run', 'slang', 'analyze', '--split-missing']); // , '--full' - add for code scan
  } else {
    await Process.run('dart', ['run', 'slang', 'analyze', '--split-missing']);
  }
}
