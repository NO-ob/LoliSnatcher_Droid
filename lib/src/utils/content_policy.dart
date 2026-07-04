import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class ContentPolicy {
  const ContentPolicy._();

  static const Set<BooruType> blockedSourceHostsAndTypes = {
    .AGNPH,
    .NyanPals,
    .Realbooru,
    .R34Hentai,
    .R34US,
    .IdolSankaku,
    .WildCritters,
    .World,
  };

  static final RegExp blockedSourceNamePattern = RegExp(
    r'(^|[^a-z0-9])(?:rule[\W_]*34|r34|porn|hentai|xxx|e[\W_]*hentai|xbooru|rule34hentai|paheal)([^a-z0-9]|$)',
    caseSensitive: false,
  );

  static const Set<String> _blockedSourceHosts = {
    'booru.allthefallen.moe',
    'e-hentai.org',
    'exhentai.org',
    'rule34.paheal.net',
    'rule34.us',
    'rule34.world',
    'rule34.xxx',
    'rule34.xyz',
    'rule34hentai.net',
    'xbooru.com',
  };

  static final RegExp _blockedItemTagPattern = RegExp(
    r'(^|_)(?:sex|cum|penis|vagina|pussy|nude|naked|nipples|breasts|boobs|areola|masturbation|fellatio|blowjob|handjob|paizuri|anal|rape|incest|bdsm|bondage|explicit|questionable|nsfw|porn|hentai|rule_?34)(_|$)',
    caseSensitive: false,
  );

  static const Set<String> blockedItemRatings = {
    'e',
    'explicit',
    'q',
    'questionable',
    'sensitive',
    'nsfw',
    'adult',
  };

  static bool get isFromStore {
    return EnvironmentConfig.isFromStore;
  }

  static bool get isLocked {
    return isFromStore && !SettingsHandler.instance.expandedSourceCompatibilityEnabled;
  }

  static bool get canOpenWebview => !isLocked;

  static bool isBooruAllowed(Booru? booru) {
    if (!isLocked || booru == null) {
      return true;
    }

    return !isRestrictedSource(booru);
  }

  static bool isRestrictedSource(Booru? booru) {
    if (booru == null || booru.type?.isFavouritesOrDownloads == true) {
      return false;
    }

    if (booru.type == null) {
      return true;
    }

    return isKnownRestrictedSource(booru);
  }

  static bool isKnownRestrictedSource(Booru? booru) {
    if (booru == null || booru.type?.isFavouritesOrDownloads == true || booru.type == null) {
      return false;
    }

    if (blockedSourceHostsAndTypes.contains(booru.type)) {
      return true;
    }

    final String host = _hostOf(booru.baseURL);
    if (_blockedSourceHosts.any((blocked) => host == blocked || host.endsWith('.$blocked'))) {
      return true;
    }

    final String sourceText = [
      booru.name ?? '',
      booru.baseURL ?? '',
      host,
    ].join(' ');

    return blockedSourceNamePattern.hasMatch(sourceText);
  }

  static bool isBooruTypeAllowed(BooruType? type) {
    if (!isLocked) {
      return true;
    }

    if (type == null) {
      return false;
    }

    return !blockedSourceHostsAndTypes.contains(type);
  }

  static List<Booru> filterBoorus(Iterable<Booru> boorus) {
    if (!isLocked) {
      return boorus.toList();
    }

    return boorus.where(isBooruAllowed).toList();
  }

  static String safeSearchTagsFor(Booru booru, String rawTags) {
    if (!isLocked || booru.type?.isFavouritesOrDownloads == true) {
      return rawTags;
    }

    final List<String> tags = rawTags.trim().split(RegExp(r'\s+')).where((tag) => tag.isNotEmpty).toList();
    final List<String> filtered = [];
    var hasSafeRating = false;

    for (final tag in tags) {
      final normalized = tag.toLowerCase();
      if (normalized.startsWith('rating:')) {
        if (_isSafeRatingTag(normalized)) {
          filtered.add(tag);
          hasSafeRating = true;
        }
        continue;
      }

      if (_isBlockedSearchTag(normalized)) {
        continue;
      }

      filtered.add(tag);
    }

    if (!hasSafeRating && _supportsSafeRatingTag(booru)) {
      filtered.insert(0, 'rating:safe');
    }

    return filtered.join(' ').trim();
  }

  static bool isItemAllowed(Booru booru, BooruItem item) {
    if (!isLocked || booru.type?.isFavouritesOrDownloads == true) {
      return true;
    }

    if (!isBooruAllowed(booru)) {
      return false;
    }

    final String rating = (item.rating ?? '').trim().toLowerCase();
    if (rating.isNotEmpty && blockedItemRatings.contains(rating)) {
      return false;
    }

    for (final tag in item.tagsList) {
      final String tagText = tag.fullString.toLowerCase();
      if (_isBlockedSearchTag(tagText) || _blockedItemTagPattern.hasMatch(tagText)) {
        return false;
      }
    }

    return true;
  }

  static bool _supportsSafeRatingTag(Booru booru) {
    return booru.type?.isGelbooru == true ||
        booru.type?.isDanbooru == true ||
        booru.type?.isSankaku == true ||
        booru.type?.isFavouritesOrDownloads == true;
  }

  static bool _isSafeRatingTag(String tag) {
    return tag == 'rating:safe' || tag == 'rating:general' || tag == 'rating:s';
  }

  static bool _isBlockedSearchTag(String tag) {
    final String clean = tag.replaceFirst(RegExp('^[-~]'), '');
    return blockedItemRatings.contains(clean) || _blockedItemTagPattern.hasMatch(clean);
  }

  static String _hostOf(String? input) {
    if (input == null || input.trim().isEmpty) {
      return '';
    }

    final String normalized = input.trim().contains('://') ? input.trim() : 'https://${input.trim()}';
    return Uri.tryParse(normalized)?.host.toLowerCase() ?? '';
  }
}
