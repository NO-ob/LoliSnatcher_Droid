import 'dart:convert';
import 'dart:io';

import 'package:flutter_socks_proxy/socks_proxy.dart';
import 'package:http_proxy/http_proxy.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/network_page.dart';

String systemProxyAddress = '';
bool addedRootCert = false;

Future<void> initProxy() async {
  final settingsHandler = SettingsHandler.instance;
  final proxyType = ProxyType.fromName(settingsHandler.proxyType);

  if (proxyType.isSystem && (Platform.isAndroid || Platform.isIOS)) {
    final HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    if (httpProxy.host?.isNotEmpty == true && httpProxy.port?.isNotEmpty == true) {
      systemProxyAddress = '${httpProxy.host}:${httpProxy.port}';
    }
  }

  if (Platform.isAndroid && !addedRootCert) {
    final List<int> cert = ascii.encode(_kIsrgRootX1);
    // add newer root certificate for older devices
    // won't do anything on devices that already have it
    SecurityContext.defaultContext.setTrustedCertificatesBytes(cert);
  }
  addedRootCert = true;

  SocksProxy.initProxy(
    onCreate: (client) => client.badCertificateCallback = (_, _, _) {
      return settingsHandler.allowSelfSignedCerts;
    },
    findProxy: (_) {
      final configAddress = getProxyConfigAddress();

      switch (proxyType) {
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

// ignore: leading_newlines_in_multiline_strings
const String _kIsrgRootX1 = '''-----BEGIN CERTIFICATE-----
MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4
WhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu
ZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY
MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK3oJHP0FDfzm54rVygc
h77ct984kIxuPOZXoHj3dcKi/vVqbvYATyjb3miGbESTtrFj/RQSa78f0uoxmyF+
0TM8ukj13Xnfs7j/EvEhmkvBioZxaUpmZmyPfjxwv60pIgbz5MDmgK7iS4+3mX6U
A5/TR5d8mUgjU+g4rk8Kb4Mu0UlXjIB0ttov0DiNewNwIRt18jA8+o+u3dpjq+sW
T8KOEUt+zwvo/7V3LvSye0rgTBIlDHCNAymg4VMk7BPZ7hm/ELNKjD+Jo2FR3qyH
B5T0Y3HsLuJvW5iB4YlcNHlsdu87kGJ55tukmi8mxdAQ4Q7e2RCOFvu396j3x+UC
B5iPNgiV5+I3lg02dZ77DnKxHZu8A/lJBdiB3QW0KtZB6awBdpUKD9jf1b0SHzUv
KBds0pjBqAlkd25HN7rOrFleaJ1/ctaJxQZBKT5ZPt0m9STJEadao0xAH0ahmbWn
OlFuhjuefXKnEgV4We0+UXgVCwOPjdAvBbI+e0ocS3MFEvzG6uBQE3xDk3SzynTn
jh8BCNAw1FtxNrQHusEwMFxIt4I7mKZ9YIqioymCzLq9gwQbooMDQaHWBfEbwrbw
qHyGO0aoSCqI3Haadr8faqU9GY/rOPNk3sgrDQoo//fb4hVC1CLQJ13hef4Y53CI
rU7m2Ys6xt0nUW7/vGT1M0NPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNV
HRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5tFnme7bl5AFzgAiIyBpY9umbbjANBgkq
hkiG9w0BAQsFAAOCAgEAVR9YqbyyqFDQDLHYGmkgJykIrGF1XIpu+ILlaS/V9lZL
ubhzEFnTIZd+50xx+7LSYK05qAvqFyFWhfFQDlnrzuBZ6brJFe+GnY+EgPbk6ZGQ
3BebYhtF8GaV0nxvwuo77x/Py9auJ/GpsMiu/X1+mvoiBOv/2X/qkSsisRcOj/KK
NFtY2PwByVS5uCbMiogziUwthDyC3+6WVwW6LLv3xLfHTjuCvjHIInNzktHCgKQ5
ORAzI4JMPJ+GslWYHb4phowim57iaztXOoJwTdwJx4nLCgdNbOhdjsnvzqvHu7Ur
TkXWStAmzOVyyghqpZXjFaH3pO3JLF+l+/+sKAIuvtd7u+Nxe5AW0wdeRlN8NwdC
jNPElpzVmbUq4JUagEiuTDkHzsxHpFKVK7q4+63SM1N95R1NbdWhscdCb+ZAJzVc
oyi3B43njTOQ5yOf+1CceWxG1bQVs5ZufpsMljq4Ui0/1lvh+wjChP4kqKOJ2qxq
4RgqsahDYVvTH9w7jXbyLeiNdd8XM2w9U/t7y0Ff/9yi0GE44Za4rF2LN9d11TPA
mRGunUHBcnWEvgJBQl9nJEiU0Zsnvgc/ubhPgXRR4Xq37Z0j4r7g1SgEEzwxA57d
emyPxgcYxn/eR44/KJ4EBs+lVDR3veyJm+kXQ99b21/+jh5Xos1AnX5iItreGCc=
-----END CERTIFICATE-----''';
