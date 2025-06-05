import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
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
  // do a check again if user set new directory, just in case
  if (hasAccess) hasAccess = await checkStorageAvailability();
  return hasAccess;
}

Future<bool> showStorageNeedsUpdateDialog() async {
  final String extPath = SettingsHandler.instance.extPathOverride;
  final res = await showDialog(
    context: NavigationHandler.instance.navContext,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('No access to custom storage directory'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please set storage directory again to grant the app access to it',
            ),
            if (extPath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Current path: $extPath'),
              ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              label: const Text('Set directory'),
              icon: const Icon(Icons.settings),
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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              label: const Text('Reset directory'),
              icon: const Icon(Icons.refresh),
              style: ElevatedButtonTheme.of(context).style!.copyWith(
                backgroundColor: const WidgetStatePropertyAll(Colors.redAccent),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () async {
                SettingsHandler.instance.extPathOverride = '';
                await SettingsHandler.instance.saveSettings(restate: false);
                Navigator.of(context).pop(true);
              },
            ),
            const Text('After reset files will be saved to default system directory'),
            const SizedBox(height: 24),
            const CancelButton(
              withIcon: true,
              returnData: false,
            ),
          ],
        ),
      );
    },
  );

  if (res is bool) {
    return res;
  }

  return false;
}
