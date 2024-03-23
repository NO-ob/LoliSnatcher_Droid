import 'dart:io';

import 'package:flutter_socks_proxy/socks_proxy.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:system_network_proxy/system_network_proxy.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/network_page.dart';

String systemProxyAddress = '';

Future<void> initProxy() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    SystemNetworkProxy.init();
    systemProxyAddress = await SystemNetworkProxy.getProxyServer();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    final HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    if (httpProxy.host?.isNotEmpty == true && httpProxy.port?.isNotEmpty == true) {
      systemProxyAddress = '${httpProxy.host}:${httpProxy.port}';
    }
  }

  SocksProxy.initProxy(
    onCreate: (client) => client.badCertificateCallback = (_, __, ___) {
      return SettingsHandler.instance.allowSelfSignedCerts;
    },
    findProxy: (_) {
      final configAddress = getProxyConfigAddress();

      switch (ProxyType.fromName(SettingsHandler.instance.proxyType)) {
        case ProxyType.direct:
          return 'DIRECT';
        case ProxyType.system:
          return systemProxyAddress.isEmpty ? 'DIRECT' : 'PROXY $systemProxyAddress; DIRECT';
        case ProxyType.http:
          return configAddress.isEmpty ? 'DIRECT' : 'PROXY $configAddress; DIRECT';
        case ProxyType.socks5:
          return configAddress.isEmpty ? 'DIRECT' : 'SOCKS5 $configAddress; DIRECT';
        case ProxyType.socks4:
          return configAddress.isEmpty ? 'DIRECT' : 'SOCKS4 $configAddress; DIRECT';
      }
    },
  );
}

String getProxyConfigAddress() {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  if (settingsHandler.proxyAddress.isNotEmpty) {
    if (settingsHandler.proxyUsername.isEmpty && settingsHandler.proxyPassword.isEmpty) {
      return settingsHandler.proxyAddress;
    } else {
      return '${settingsHandler.proxyUsername}:${settingsHandler.proxyPassword}@${settingsHandler.proxyAddress}';
    }
  } else {
    return '';
  }
}
