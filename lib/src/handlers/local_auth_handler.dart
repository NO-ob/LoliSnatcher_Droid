// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

class LocalAuthHandler {
  LocalAuthHandler() {
    init();
  }

  static LocalAuthHandler get instance => GetIt.instance<LocalAuthHandler>();

  static LocalAuthHandler register() {
    if (!GetIt.instance.isRegistered<LocalAuthHandler>()) {
      GetIt.instance.registerSingleton(LocalAuthHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<LocalAuthHandler>();

  final LocalAuthentication auth = LocalAuthentication();

  ValueNotifier<bool?> isAuthenticated = ValueNotifier(null);
  bool manuallyLocked = false;
  ValueNotifier<bool> deviceSupportsBiometrics = ValueNotifier(false);

  int? lastLeaveTime, lastUnlockTime;

  bool get isSupportedPlatform => Platform.isAndroid || Platform.isIOS || Platform.isWindows;

  Future<void> init() async {
    await canCheckBiometrics();
    await lock();
  }

  Future<void> canCheckBiometrics() async {
    bool result = false;
    if (isSupportedPlatform) {
      result = await auth.canCheckBiometrics || await auth.isDeviceSupported();
    }
    deviceSupportsBiometrics.value = result;
  }

  Future<void> authenticate({
    bool initial = false,
    bool forceUnlock = false,
  }) async {
    if (!forceUnlock && initial && manuallyLocked) {
      manuallyLocked = false;
      return;
    }

    if (isAuthenticated.value == true) {
      return;
    }

    if (deviceSupportsBiometrics.value == true) {
      try {
        final bool authenticated =
            forceUnlock ||
            await auth.authenticate(
              localizedReason: NavigationHandler.instance.navContext.loc.authentication.pleaseAuthenticateToUseTheApp,
              persistAcrossBackgrounding: true,
              biometricOnly: false,
            );

        if (authenticated) {
          lastUnlockTime = DateTime.now().millisecondsSinceEpoch;
          lastLeaveTime = null;
        }
        await Future.delayed(const Duration(milliseconds: 300));
        isAuthenticated.value = authenticated;
      } on LocalAuthException catch (e, s) {
        Logger.Inst().log(
          e.description ?? e.code.name,
          'LocalAuthHandler',
          'authenticate',
          LogTypes.exception,
          s: s,
        );

        final context = NavigationHandler.instance.navContext;
        switch (e.code) {
          case LocalAuthExceptionCode.noBiometricHardware:
            FlashElements.showSnackbar(
              title: Text(context.loc.authentication.noBiometricHardwareAvailable),
              leadingIcon: Icons.warning_amber,
            );
            break;
          case LocalAuthExceptionCode.temporaryLockout:
          case LocalAuthExceptionCode.biometricLockout:
            FlashElements.showSnackbar(
              title: Text(context.loc.authentication.temporaryLockout),
              leadingIcon: Icons.warning_amber,
            );
            break;
          // TODO handle all errors
          default:
            FlashElements.showSnackbar(
              title: Text(context.loc.authentication.somethingWentWrong(error: e.code.name)),
              leadingIcon: Icons.warning_amber,
            );
            break;
        }
      } on Object catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LocalAuthHandler',
          'authenticate',
          LogTypes.exception,
          s: s,
        );
      }
    } else {
      lastUnlockTime = DateTime.now().millisecondsSinceEpoch;
      lastLeaveTime = null;
      isAuthenticated.value = true;
    }
    return;
  }

  Future<void> lock({
    bool manually = false,
  }) async {
    await canCheckBiometrics();
    final bool shouldLock = deviceSupportsBiometrics.value && SettingsHandler.instance.useLockscreen.value;

    if (!shouldLock) {
      lastUnlockTime = DateTime.now().millisecondsSinceEpoch;
    } else {
      manuallyLocked = manually;
    }

    lastLeaveTime = null;
    isAuthenticated.value = !shouldLock;
  }

  void onLeave() {
    lastLeaveTime ??= DateTime.now().millisecondsSinceEpoch;
  }

  Future<void> onReturn() async {
    if (lastLeaveTime == null) {
      return;
    }
    await Future.delayed(const Duration(milliseconds: 10));
    final int leaveTimeoutMs = 1000 * SettingsHandler.instance.autoLockTimeout;
    final int timeSinceLastLeave = DateTime.now().millisecondsSinceEpoch - (lastLeaveTime ?? 0);

    const int unlockDelayMs = 1000;
    final int timeSinceLastUnlock = DateTime.now().millisecondsSinceEpoch - (lastUnlockTime ?? 0);

    // lock if leaveTimeoutMs passed since last leave and unlockDelayMs since last unlock (to avoid locking again because native auth screen is also considered a leave)
    if (leaveTimeoutMs != 0 && timeSinceLastLeave > leaveTimeoutMs && timeSinceLastUnlock > unlockDelayMs) {
      await lock();
    }
  }
}
