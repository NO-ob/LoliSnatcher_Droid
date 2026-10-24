import 'dart:io';

import 'loc_build.dart';

/// This script will launch the analyzer for missing/unused translations in non-en locales
Future<void> main() async {
  exitCode = await runSlang(['analyze', '--split-missing', '--full']);
}
