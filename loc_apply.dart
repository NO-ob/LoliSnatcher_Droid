import 'dart:io';

import 'loc_build.dart';

/// This script will apply changes in missing translations file to all non-en locales, to do this only for one locale, run 'dart run slang apply --locale={locale}'
Future<void> main() async {
  exitCode = await runSlang(['apply']);
}
