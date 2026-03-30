import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

enum ProxyType with SettingsEnum<ProxyType> {
  direct,
  system,
  http,
  socks5,
  socks4,
  ;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format is already lowercase so no change needed
  @override
  String toJson() {
    switch (this) {
      case ProxyType.direct:
        return 'direct';
      case ProxyType.system:
        return 'system';
      case ProxyType.http:
        return 'http';
      case ProxyType.socks5:
        return 'socks5';
      case ProxyType.socks4:
        return 'socks4';
    }
  }

  static ProxyType fromString(String name) {
    switch (name) {
      case 'direct':
        return ProxyType.direct;
      case 'system':
        return ProxyType.system;
      case 'http':
        return ProxyType.http;
      case 'socks5':
        return ProxyType.socks5;
      case 'socks4':
        return ProxyType.socks4;
    }
    return defaultValue;
  }

  static ProxyType get defaultValue => ProxyType.direct;

  bool get isDirect => this == ProxyType.direct;
  bool get isSystem => this == ProxyType.system;
  bool get isHttp => this == ProxyType.http;
  bool get isSocks5 => this == ProxyType.socks5;
  bool get isSocks4 => this == ProxyType.socks4;

  @override
  String get locName {
    return toJson().capitalizeFirst;
  }
}
