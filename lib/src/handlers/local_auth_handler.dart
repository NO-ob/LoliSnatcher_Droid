// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:local_auth_windows/local_auth_windows.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

// TODO update messages

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

  ValueNotifier<bool?> isAuthenticated = ValueNotifier(null);
  bool manuallyLocked = false;
  ValueNotifier<bool> deviceSupportsBiometrics = ValueNotifier(false);

  int? lastLeaveTime, lastUnlockTime;

  bool get isSupportedPlatform => Platform.isAndroid || Platform.isIOS || Platform.isWindows;

  Future<void> init() async {
    deviceSupportsBiometrics.value = await canCheckBiometrics();
    await lock();
  }

  Future<bool> canCheckBiometrics() async {
    if (!isSupportedPlatform) return false;

    final LocalAuthentication auth = LocalAuthentication();
    return auth.canCheckBiometrics;
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
      final LocalAuthentication auth = LocalAuthentication();
      try {
        final bool authenticated = forceUnlock ||
            await auth.authenticate(
              localizedReason: 'Please authenticate to use Lolisnatcher',
              options: const AuthenticationOptions(
                stickyAuth: true,
                useErrorDialogs: true,
                biometricOnly: false,
              ),
              authMessages: [
                const IOSAuthMessages(
                  cancelButton: 'Cancel',
                  goToSettingsButton: 'Settings',
                  goToSettingsDescription: 'To enable biometric authentication, go to Settings',
                  localizedFallbackTitle: 'Use a Passcode',
                  lockOut: 'Too many failed attempts. Try again later.',
                ),
                const AndroidAuthMessages(
                  cancelButton: 'Cancel',
                  goToSettingsButton: 'Settings',
                  goToSettingsDescription: 'To enable biometric authentication, go to Settings',
                  biometricHint: 'Use biometrics or enter PIN',
                  biometricNotRecognized: 'Your biometrics could not be recognized',
                  biometricSuccess: 'Authentication successful',
                  biometricRequiredTitle: 'Authentication is required',
                  deviceCredentialsRequiredTitle: 'Device credentials are required',
                  deviceCredentialsSetupDescription: 'To enable biometric authentication, go to Settings',
                  signInTitle: 'Sign in',
                ),
                const WindowsAuthMessages(),
              ],
            );

        if (authenticated) {
          lastUnlockTime = DateTime.now().millisecondsSinceEpoch;
          lastLeaveTime = null;
        }
        await Future.delayed(const Duration(milliseconds: 300));
        isAuthenticated.value = authenticated;
      } catch (e, s) {
        // TODO handle all errors
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
    deviceSupportsBiometrics.value = await canCheckBiometrics();
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

    // lock if surpassed leaveTimeout since last leave and unlockDelay since last unlock (to avoid locking again because native auth screen is also considered a leave)
    if (leaveTimeoutMs != 0 && timeSinceLastLeave > leaveTimeoutMs && timeSinceLastUnlock > unlockDelayMs) {
      await lock();
    }
  }
}
