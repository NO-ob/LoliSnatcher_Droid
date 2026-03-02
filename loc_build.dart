import 'dart:io';

void main() async {
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
