// import 'dart:async';
// import 'dart:io';

// import 'package:get/get.dart';

// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';
// import 'package:local_auth_windows/local_auth_windows.dart';
// import 'package:local_auth/local_auth.dart';

// TODO test this more

// class LocalAuthHandler extends GetxController {
//   static LocalAuthHandler get instance => Get.find<LocalAuthHandler>();

//   LocalAuthHandler() {
//     getInitialBiometricsState();
//     // _timer = Timer.periodic(const Duration(minutes: 1), (timer) { });
//   }

//   RxnBool isLoggedIn = RxnBool(null);
//   RxnBool deviceSupportsBiometrics = RxnBool(null);

//   int lastLeaveTime = DateTime.now().millisecondsSinceEpoch;

//   bool get isSupportedPlatform => Platform.isAndroid || Platform.isIOS || Platform.isWindows;

//   void getInitialBiometricsState() async {
//     deviceSupportsBiometrics.value = await canCheckBiometrics();
//     logout();
//   }

//   Future<bool> canCheckBiometrics() async {
//     if (!isSupportedPlatform) return false;

//     final LocalAuthentication auth = LocalAuthentication();
//     return auth.canCheckBiometrics;
//   }

//   final IOSAuthMessages iosMessages = const IOSAuthMessages(
//     cancelButton: 'Cancel',
//     goToSettingsButton: 'Settings',
//     goToSettingsDescription: 'To enable fingerprint authentication, go to Settings',
//     localizedFallbackTitle: 'Use a Passcode',
//     lockOut: 'Too many failed attempts. Try again later.',
//   );

//   final AndroidAuthMessages androidMessages = const AndroidAuthMessages(
//     cancelButton: 'Cancel',
//     goToSettingsButton: 'Settings',
//     goToSettingsDescription: 'To enable fingerprint authentication, go to Settings',
//     biometricHint: 'Scan your fingerprint',
//     biometricNotRecognized: 'Your fingerprint could not be recognized',
//     biometricSuccess: 'Authentication successful',
//     biometricRequiredTitle: 'Authentication is required',
//     deviceCredentialsRequiredTitle: 'Device credentials are required',
//     deviceCredentialsSetupDescription: 'To enable fingerprint authentication, go to Settings',
//     signInTitle: 'Sign in',
//   );

//   final WindowsAuthMessages windowsMessages = const WindowsAuthMessages();

//   Future<void> authenticate() async {
//     if (deviceSupportsBiometrics.value == true) {
//       final LocalAuthentication auth = LocalAuthentication();
//       final bool authenticated = await auth.authenticate(
//         localizedReason: 'Please authenticate to use Lolisnatcher',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           useErrorDialogs: true,
//           biometricOnly: false,
//         ),
//         authMessages: [
//           iosMessages,
//           androidMessages,
//           windowsMessages,
//         ],
//       );
//       isLoggedIn.value = authenticated;
//     } else {
//       isLoggedIn.value = true;
//     }
//     return;
//   }

//   void logout() async {
//     isLoggedIn.value = true;
//     return;

//     if (deviceSupportsBiometrics.value == true) {
//       isLoggedIn.value = false; // SettingsHandler.instance.enableLockscreen ? false : true;
//     } else {
//       isLoggedIn.value = true;
//     }
//   }

//   void onLeave() {
//     lastLeaveTime = DateTime.now().millisecondsSinceEpoch;
//   }

//   void onReturn() async {
//     const int oneMinute = 60 * 1000;
//     final int timeSinceLastLeave = DateTime.now().millisecondsSinceEpoch - lastLeaveTime;
//     if (timeSinceLastLeave > oneMinute) {
//       logout();
//       await authenticate();
//     }
//   }
// }
