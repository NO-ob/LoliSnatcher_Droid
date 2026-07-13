import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class ContentPolicy {
  const ContentPolicy._();

  static Set<BooruType> get blockedSourceHostsAndTypes => {
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

  static RegExp get blockedSourceNamePattern => RegExp(
    r'(^|[^a-z0-9])(?:rule[\W_]*34|r34|r34[\W_]*xxx|rule[\W_]*34[\W_]*xxx|porn|hentai|xxx|e[\W_]*hentai|xbooru|rule34hentai|rule34vault|paheal|ink[\W_]*bunny|yiff|nsfw)([^a-z0-9]|$)',
    caseSensitive: false,
  );

  static Set<String> get _blockedCompactSourceTerms => {
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

  static Set<String> get _blockedSourceHosts => {
    'aibooru.online',
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
    'xivbooru.com',
  };

  static List<String> get _blockedItemTagTerms {
    final terms = <String>{
      ...SettingsHandler.aiTags,
      ..._blockedAdultItemTags,
      ..._blockedMetadataItemTags,
      ..._blockedViolenceItemTags,
    }.toList()..sort();

    return terms;
  }

  static RegExp get _blockedItemTagPattern {
    final alternatives = _blockedItemTagTerms.map(RegExp.escape).join('|');
    return RegExp(
      r'(^|_|\(|\d)'
      '(?:$alternatives)'
      r'(\d|\)|_|$)',
      caseSensitive: false,
    );
  }

  static const List<String> _blockedAdultItemTags = [
    'anal',
    'anus',
    'areola',
    'ass',
    'assjob',
    'babydoll',
    'balls',
    'bdsm',
    'bisexual',
    'blowjob',
    'bondage',
    'boobs',
    'bottomless',
    'bra',
    'buttjob',
    'clitoris',
    'cock',
    'consanguinity',
    'crotch',
    'cum',
    'cunnilingus',
    'diaper',
    'dildo',
    'ejaculation',
    'erection',
    'explicit',
    'feetjob',
    'fellatio',
    'fetish',
    'flashing',
    'footjob',
    'futanari',
    'garter_belt',
    'garter_straps',
    'garter',
    'garterbelt',
    'gay',
    'genitals',
    'glansjob',
    'handjob',
    'hentai',
    'incest',
    'intersex',
    'kink',
    'lesbian',
    'lgbt',
    'lgbtq',
    'lgbtq+',
    'lgbtqia',
    'lingerie',
    'loli',
    'lube',
    'masturbation',
    'naizuri',
    'naked',
    'nipple',
    'nipples',
    'nsfw',
    'nude',
    'orgasm',
    'paizuri',
    'panties',
    'pantyshot',
    'penetration',
    'penis',
    'porn',
    'pubic',
    'pussy',
    'pussyjob',
    'queer',
    'questionable',
    'rape',
    'rule_34',
    'rule34',
    'scat',
    'scrotum',
    'semen',
    'sex_toy',
    'sex',
    'sextoy',
    'shota',
    'squirt',
    'squirting',
    'testicles',
    'thighjob',
    'thong',
    'transgender',
    'underwear',
    'urethra',
    'urinating',
    'urination',
    'urine',
    'vagina',
    'vaginal',
    'vibrator',
    'violation',
  ];

  static const List<String> _blockedMetadataItemTags = [
    'tagme',
    'untagged',
  ];

  static const List<String> _blockedViolenceItemTags = [
    'abuse',
    'amputation',
    'asphyxiation',
    'beating',
    'blood',
    'bloody',
    'body_horror',
    'bruise',
    'bruises',
    'cannibalism',
    'choking',
    'corpse',
    'death',
    'decapitation',
    'disembowelment',
    'dismemberment',
    'fighting',
    'gore',
    'guro',
    'guts',
    'injury',
    'murder',
    'mutilation',
    'necrophilia',
    'ryona',
    'self_harm',
    'severed_limb',
    'snuff',
    'strangulation',
    'suicide',
    'torture',
    'violence',
    'violent',
    'wound',
  ];

  static Set<String> get blockedItemRatings => {
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

    if (item.tagsList.length < 10) {
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

  static bool isTagAllowed(String tag) {
    if (!isLocked) {
      return true;
    }

    final normalized = tag.toLowerCase();
    return !_isBlockedSearchTag(normalized) && !_blockedItemTagPattern.hasMatch(normalized);
  }

  static bool _supportsSafeRatingTag(Booru booru) {
    final type = booru.type;
    if (type == null) {
      return false;
    }
    return type.isDanbooru || type.isE621 || type.isGelbooru || type.isGelbooruV1 || type.isMoebooru || type.isSankaku;
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
