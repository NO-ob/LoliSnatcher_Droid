// ignore_for_file: constant_identifier_names

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum BooruType {
  Autodetect,
  //
  AGNPH,
  BooruOnRails,
  Danbooru,
  e621,
  //FurAffinity,
  Gelbooru,
  GelbooruV1,
  Hydrus,
  InkBunny,
  Moebooru,
  NyanPals,
  Philomena,
  Rainbooru,
  Realbooru,
  R34Hentai,
  R34US,
  Sankaku,
  IdolSankaku,
  Shimmie,
  Szurubooru,
  WildCritters,
  World,

  // [Special types]
  GelbooruAlike,
  Merge,
  Downloads,
  Favourites;

  static List<BooruType> get dropDownValues {
    final settingsHandler = SettingsHandler.instance;
    final isDebug = settingsHandler.isDebug.value;

    return [...values]
      ..remove(BooruType.Downloads)
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge)
      ..remove(BooruType.GelbooruAlike)
      ..remove(isDebug ? BooruType.NyanPals : null)
      ..remove(isDebug ? BooruType.WildCritters : null);
  }

  static List<BooruType> get detectable {
    return [...values]
      ..remove(BooruType.Autodetect)
      ..remove(BooruType.Downloads)
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Hydrus)
      ..remove(BooruType.Merge);
  }

  static List<BooruType> get saveable {
    return [...values]
      ..remove(BooruType.Autodetect)
      ..remove(BooruType.Downloads)
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge);
  }

  String get alias {
    switch (this) {
      case World:
        return 'World/XYZ/Vault';
      case IdolSankaku:
        return 'Sankaku Idol';
      default:
        return name;
    }
  }

  bool get isAutodetect => this == BooruType.Autodetect;
  bool get isAGNPH => this == BooruType.AGNPH;
  bool get isBooruOnRails => this == BooruType.BooruOnRails;
  bool get isDanbooru => this == BooruType.Danbooru;
  bool get isE621 => this == BooruType.e621;
  //bool get isFurAffinity => this == BooruType.FurAffinity;
  bool get isGelbooru => this == BooruType.Gelbooru;
  bool get isGelbooruV1 => this == BooruType.GelbooruV1;
  bool get isHydrus => this == BooruType.Hydrus;
  bool get isInkBunny => this == BooruType.InkBunny;
  bool get isMoebooru => this == BooruType.Moebooru;
  bool get isNyanPals => this == BooruType.NyanPals;
  bool get isPhilomena => this == BooruType.Philomena;
  bool get isRainbooru => this == BooruType.Rainbooru;
  bool get isRealbooru => this == BooruType.Realbooru;
  bool get isR34Hentai => this == BooruType.R34Hentai;
  bool get isR34US => this == BooruType.R34US;
  bool get isSankaku => this == BooruType.Sankaku;
  bool get isIdolSankaku => this == BooruType.IdolSankaku;
  bool get isShimmie => this == BooruType.Shimmie;
  bool get isSzurubooru => this == BooruType.Szurubooru;
  bool get isWildCritters => this == BooruType.WildCritters;
  bool get isWorld => this == BooruType.World;

  bool get isGelbooruAlike => this == BooruType.GelbooruAlike;
  bool get isMerge => this == BooruType.Merge;
  bool get isDownloads => this == BooruType.Downloads;
  bool get isFavourites => this == BooruType.Favourites;
  bool get isFavouritesOrDownloads => isFavourites || isDownloads;
}
