import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:lolisnatcher/src/utils/logger.dart';

class ConnectivityHandler {
  ConnectivityHandler._();

  static ConnectivityHandler get instance => GetIt.I<ConnectivityHandler>();

  static ConnectivityHandler register() {
    if (!GetIt.instance.isRegistered<ConnectivityHandler>()) {
      GetIt.instance.registerSingleton(
        ConnectivityHandler._(),
        dispose: (handler) => handler.dispose(),
      );
    }
    return instance;
  }

  final RxBool isOnline = true.obs;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _debounceTimer;
  Timer? _periodicCheckTimer;
  bool _hasNetworkInterface = true;

  Future<void> initialize() async {
    try {
      final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
      await _updateConnectivityStatus(result);

      await _subscription?.cancel();
      _subscription = _connectivity.onConnectivityChanged.listen(
        (List<ConnectivityResult> result) {
          _debounceTimer?.cancel();
          _debounceTimer = Timer(const Duration(seconds: 2), () {
            _updateConnectivityStatus(result);
          });
        },
        onError: (Object error) {
          Logger.Inst().log(
            'Connectivity stream error: $error',
            'ConnectivityHandler',
            'initialize',
            LogTypes.exception,
          );
          _setOnline(true);
        },
      );
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to initialize connectivity monitoring: $e',
        'ConnectivityHandler',
        'initialize',
        LogTypes.exception,
        s: s,
      );
      // Fail open - assume online on error
      _setOnline(true);
    }
  }

  Future<bool> _verifyInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com').timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<void> _updateConnectivityStatus(List<ConnectivityResult> results) async {
    final bool hasConnection = results.any((result) => result != ConnectivityResult.none);
    _hasNetworkInterface = hasConnection;

    if (!hasConnection) {
      _setOnline(false);
      _stopPeriodicCheck();
      return;
    }

    final bool hasInternet = await _verifyInternetAccess();
    _setOnline(hasInternet);

    _startPeriodicCheck();
  }

  void _setOnline(bool value) {
    if (isOnline.value != value) {
      isOnline.value = value;

      Logger.Inst().log(
        'Connectivity changed: ${value ? "Online" : "Offline"}',
        'ConnectivityHandler',
        '_setOnline',
        null,
      );
    }
  }

  void _startPeriodicCheck() {
    _stopPeriodicCheck();
    _periodicCheckTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      if (!_hasNetworkInterface) {
        _stopPeriodicCheck();
        return;
      }
      final bool hasInternet = await _verifyInternetAccess();
      _setOnline(hasInternet);
    });
  }

  void _stopPeriodicCheck() {
    _periodicCheckTimer?.cancel();
    _periodicCheckTimer = null;
  }

  Future<bool> checkNow() async {
    final bool hasInternet = await _verifyInternetAccess();
    _setOnline(hasInternet);
    return hasInternet;
  }

  void dispose() {
    _debounceTimer?.cancel();
    _stopPeriodicCheck();
    _subscription?.cancel();
  }
}
