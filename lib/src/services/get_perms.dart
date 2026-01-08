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
        title: Text(context.loc.permissions.noAccessToCustomStorageDirectory),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.loc.permissions.pleaseSetStorageDirectoryAgain,
            ),
            if (extPath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(context.loc.permissions.currentPath(path: extPath)),
              ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              label: Text(context.loc.permissions.setDirectory),
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
                    title: Text(
                      context.loc.errorExclamation,
                      style: const TextStyle(fontSize: 20),
                    ),
                    content: Text(
                      context.loc.permissions.currentlyNotAvailableForThisPlatform,
                      style: const TextStyle(fontSize: 16),
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
              label: Text(context.loc.permissions.resetDirectory),
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
            Text(context.loc.permissions.afterResetFilesWillBeSavedToDefaultDirectory),
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
