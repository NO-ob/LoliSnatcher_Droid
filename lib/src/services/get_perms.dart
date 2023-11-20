import 'dart:io' show Platform;

import 'package:permission_handler/permission_handler.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';

// TODO expand to have more control over permissions

/// This launches the permissions dialogue to get storage permissions from the user
///
/// it is called before every operation which would require writing to storage which is why its in its own function
///
/// The dialog will not show if the user has already accepted perms or android sdk is below 33
Future<bool> getPerms() async {
  if ((Platform.isAndroid && await ServiceHandler.getAndroidSDKVersion() < 33) || Platform.isIOS) {
    return Permission.storage.request().isGranted;
  }
  return true;
  // print(Platform.environment['HOME']);
}
