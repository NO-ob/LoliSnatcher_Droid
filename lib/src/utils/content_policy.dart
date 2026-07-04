import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class ContentPolicy {
  const ContentPolicy._();

  static const Set<BooruType> blockedSourceHostsAndTypes = {
    .AGNPH,
    .IdolSankaku,
    .InkBunny,
    .NyanPals,
    .R34Hentai,
    .R34US,
    .Realbooru,
    .WildCritters,
    .World,
  };

  static final RegExp blockedSourceNamePattern = RegExp(
    r'(^|[^a-z0-9])(?:rule[\W_]*34|r34|r34[\W_]*xxx|rule[\W_]*34[\W_]*xxx|porn|hentai|xxx|e[\W_]*hentai|xbooru|rule34hentai|rule34vault|paheal|ink[\W_]*bunny|yiff|nsfw)([^a-z0-9]|$)',
    caseSensitive: false,
  );

  static const Set<String> _blockedCompactSourceTerms = {
    'hentai',
    'inkbunny',
    'nsfw',
    'paheal',
    'porn',
    'r34',
    'rule34',
    'xbooru',
    'xxx',
    'yiff',
  };

  static const Set<String> _blockedSourceHosts = {
    'agn.ph',
    'booru.allthefallen.moe',
    'booru.xxx',
    'e-hentai.org',
    'exhentai.org',
    'inkbunny.net',
    'realbooru.com',
    'rule34.paheal.net',
    'rule34.us',
    'rule34.world',
    'rule34.xxx',
    'rule34.xyz',
    'rule34hentai.net',
    'rule34vault.com',
    'xbooru.com',
  };

  static final RegExp _blockedItemTagPattern = RegExp(
    r'(^|_)(?:anal|anus|areola|ass|balls|bdsm|blowjob|bondage|boobs|breast|breasts|clitoris|consanguinity|crotch|cum|cunnilingus|dildo|ejaculation|erection|explicit|fellatio|genitals|handjob|hentai|incest|masturbation|naked|nipple|nipples|nsfw|nude|orgasm|paizuri|penetration|penis|porn|pubic|pussy|questionable|rape|rule_?34|scrotum|semen|sex|sex_?toy|testicles|vagina|vibrator|violation)(_|$)',
    caseSensitive: false,
  );

  static const Set<String> blockedItemRatings = {
    'adult',
    'e',
    'explicit',
    'm',
    'mature',
    'nsfw',
    'q',
    'questionable',
    'sensitive',
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

    return _hasBlockedSourceName(sourceText);
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
    return booru.type?.isDanbooru == true ||
        booru.type?.isE621 == true ||
        booru.type?.isGelbooruV1 == true ||
        booru.type?.isMoebooru == true ||
        booru.type?.isSankaku == true ||
        booru.type?.isGelbooru == true;
  }

  static bool _isSafeRatingTag(String tag) {
    return tag == 'rating:safe' || tag == 'rating:general' || tag == 'rating:s';
  }

  static bool _isBlockedSearchTag(String tag) {
    final String clean = tag.replaceFirst(RegExp('^[-~]'), '');
    return blockedItemRatings.contains(clean) || _blockedItemTagPattern.hasMatch(clean);
  }

  static bool _hasBlockedSourceName(String sourceText) {
    if (blockedSourceNamePattern.hasMatch(sourceText)) {
      return true;
    }

    final compact = sourceText.toLowerCase().replaceAll(RegExp('[^a-z0-9]+'), '');
    return _blockedCompactSourceTerms.any(compact.contains);
  }

  static String _hostOf(String? input) {
    if (input == null || input.trim().isEmpty) {
      return '';
    }

    final String normalized = input.trim().contains('://') ? input.trim() : 'https://${input.trim()}';
    return Uri.tryParse(normalized)?.host.toLowerCase() ?? '';
  }
}
