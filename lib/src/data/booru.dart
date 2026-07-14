import 'dart:convert';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

class Booru {
  Booru(
    this.name,
    this.type,
    this.faviconURL,
    this.baseURL,
    this.defTags,
  );

  Booru.unknown() : this(null, null, null, null, null);

  Booru.withKey(
    this.name,
    this.type,
    this.faviconURL,
    this.baseURL,
    this.defTags,
    this.apiKey,
    this.userID,
  );

  Booru.fromJSON(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    setFromMap(json);
  }

  Booru.fromMap(Map<String, dynamic> json) {
    setFromMap(json);
  }

  Booru.fromLink(String link) {
    final String jsonString = String.fromCharCodes(base64Decode(link.split('?')[1]));
    final Map<String, dynamic> json = jsonDecode(jsonString);
    setFromMap(json);
  }

  String? name = '', faviconURL = '', baseURL = '', apiKey = '', userID = '', defTags = '';
  BooruType? type;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type?.name,
      'faviconURL': faviconURL,
      'baseURL': baseURL,
      'defTags': defTags,
      'apiKey': apiKey,
      'userID': userID,
    };
  }

  String toLink(bool withSensitiveData) {
    final Map json = toJson();
    if (withSensitiveData == false) {
      json.remove('apiKey');
      json.remove('userID');
    }
    final String jsonString = jsonEncode(json);
    return 'https://www.loli.snatcher?${base64UrlEncode(jsonString.codeUnits)}';
  }

  void setFromMap(Map<String, dynamic> json) {
    name = json['name']?.toString();
    type = BooruType.values.firstWhereOrNull((e) => e.name.toLowerCase() == json['type']?.toString().toLowerCase());
    faviconURL = json['faviconURL']?.toString();
    baseURL = json['baseURL']?.toString();
    defTags = json['defTags']?.toString();
    apiKey = json['apiKey']?.toString();
    userID = json['userID']?.toString();
  }

  @override
  String toString() {
    return 'Name: $name, Type: $type, BaseURL: $baseURL, FaviconURL: $faviconURL, APIKey: $apiKey, UserID: $userID';
  }

  bool matchesIdentity(Booru? other) {
    if (identical(this, other)) {
      return true;
    }
    if (other == null) {
      return false;
    }

    final thisName = name?.trim();
    final otherName = other.name?.trim();
    if (thisName?.isNotEmpty == true && otherName?.isNotEmpty == true) {
      return thisName == otherName;
    }

    final thisBaseUrl = _normalizedBaseURL(baseURL);
    final otherBaseUrl = _normalizedBaseURL(other.baseURL);
    return type != null && type == other.type && thisBaseUrl != null && thisBaseUrl == otherBaseUrl;
  }

  static String? _normalizedBaseURL(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed.endsWith('/') ? trimmed.substring(0, trimmed.length - 1) : trimmed;
  }

  Booru copyWith({
    String? name,
    BooruType? type,
    String? faviconURL,
    String? baseURL,
    String? defTags,
    String? apiKey,
    String? userID,
  }) {
    return Booru.withKey(
      name ?? this.name,
      type ?? this.type,
      faviconURL ?? this.faviconURL,
      baseURL ?? this.baseURL,
      defTags ?? this.defTags,
      apiKey ?? this.apiKey,
      userID ?? this.userID,
    );
  }
}
