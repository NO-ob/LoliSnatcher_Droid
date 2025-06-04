import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

// TODO expand to have more control over permissions
// TODO handle denied permissions with a dialog blocking further action, check everywhere getPerms is used

/// This launches the permissions dialogue to get storage permissions from the user
///
/// it is called before every operation which would require writing to storage which is why its in its own function
///
/// The dialog will not show if the user has already accepted perms or android sdk is below 33
Future<bool> getStoragePermission() async {
  if ((Platform.isAndroid && await ServiceHandler.getAndroidSDKVersion() < 33) || Platform.isIOS) {
    return Permission.storage.request().isGranted;
  }
  return true;
  // print(Platform.environment['HOME']);
}

Future<bool> checkStorageAvailability() async {
  final extPath = SettingsHandler.instance.extPathOverride;
  if (extPath.isEmpty) {
    return true;
  }

  return ServiceHandler.testSAFPersistence(extPath);
}

Future<bool> setPermissions() async {
  bool hasAccess = await getStoragePermission();
  if (!hasAccess) return false;

  hasAccess = await checkStorageAvailability();
  if (!hasAccess) hasAccess = await showStorageNeedsUpdateDialog();
  return hasAccess;
}

Future<bool> showStorageNeedsUpdateDialog() async {
  final String extPath = SettingsHandler.instance.extPathOverride;
  // TODO better dialog style
  final res = await showDialog(
    context: NavigationHandler.instance.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('No access to custom storage directory'),
        content: Text(
          'Please set storage directory again to give access to the app \n ${extPath.isEmpty ? '' : '\nCurrent path: $extPath \n'}'
              .trim(),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Set storage directory'),
            onPressed: () async {
              SettingsHandler.instance.extPathOverride = '';
              if (Platform.isAndroid) {
                final String newPath = await ServiceHandler.setExtDir();
                SettingsHandler.instance.extPathOverride = newPath;
                await SettingsHandler.instance.saveSettings(restate: false);
                Navigator.of(context).pop(true);
              } else {
                FlashElements.showSnackbar(
                  context: context,
                  title: const Text(
                    'Error!',
                    style: TextStyle(fontSize: 20),
                  ),
                  content: const Text(
                    'Currently not available for this platform',
                    style: TextStyle(fontSize: 16),
                  ),
                  leadingIcon: Icons.error_outline,
                  leadingIconColor: Colors.red,
                  sideColor: Colors.red,
                );
                Navigator.of(context).pop(false);
              }
            },
          ),
        ],
      );
    },
  );

  if (res is bool) {
    return res;
  }

  return false;
}
