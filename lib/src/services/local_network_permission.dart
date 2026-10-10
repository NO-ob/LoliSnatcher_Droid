import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class LocalNetworkPermission {
  LocalNetworkPermission._();

  static Future<bool>? _pendingRequest;
  static bool _promptDeferred = false;

  static bool isLocalUrl(String url) {
    final normalized = url.contains('://') ? url : 'http://$url';
    final uri = Uri.tryParse(normalized);
    if (uri == null || !{'http', 'https'}.contains(uri.scheme)) return false;

    final host = uri.host.toLowerCase();
    if (host.isEmpty) return false;
    if (host == 'localhost' ||
        host.endsWith('.localhost') ||
        host.endsWith('.local') ||
        host.endsWith('.lan') ||
        host.endsWith('.home.arpa') ||
        !host.contains('.')) {
      return true;
    }

    final address = InternetAddress.tryParse(host);
    if (address == null) return false;
    if (address.isLoopback || address.isLinkLocal) return true;

    final bytes = address.rawAddress;
    if (address.type == InternetAddressType.IPv4) {
      return bytes[0] == 10 ||
          (bytes[0] == 172 && bytes[1] >= 16 && bytes[1] <= 31) ||
          (bytes[0] == 192 && bytes[1] == 168);
    }
    return address.type == InternetAddressType.IPv6 && (bytes[0] & 0xfe) == 0xfc;
  }

  static Future<bool> ensureForUrl(String url, {bool retry = false}) async {
    if (!Platform.isAndroid || !isLocalUrl(url)) return true;
    return request(retry: retry);
  }

  static Future<bool> request({bool retry = false}) {
    if (retry) _promptDeferred = false;
    return _pendingRequest ??= _requestWithExplanation().whenComplete(() {
      _pendingRequest = null;
    });
  }

  static Future<bool> _requestWithExplanation() async {
    if (await ServiceHandler.hasLocalNetworkPermission()) {
      _promptDeferred = false;
      return true;
    }
    if (_promptDeferred) return false;

    final context = NavigationHandler.instance.navigatorKey.currentContext;
    if (context == null) return false;

    final shouldContinue = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.loc.permissions.localNetworkExplanationTitle),
        content: Text(dialogContext.loc.permissions.localNetworkExplanation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(dialogContext.loc.later),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(dialogContext.loc.confirm),
          ),
        ],
      ),
    );
    if (shouldContinue != true) {
      _promptDeferred = true;
      return false;
    }

    final granted = await ServiceHandler.requestLocalNetworkPermission();
    _promptDeferred = !granted;
    return granted;
  }
}
