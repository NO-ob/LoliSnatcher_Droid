import 'dart:io';

import 'loc_build.dart';

/// This script will apply changes in missing translations file to all non-en locales, to do this only for one locale, run 'dart run slang apply --locale={locale}'
void main() async {
  if (await checkFvmAvailability()) {
    await Process.run('fvm', ['dart', 'run', 'slang', 'apply']);
  } else {
    await Process.run('dart', ['run', 'slang', 'apply']);
  }
}
