// ignore_for_file: constant_identifier_names

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
  R34Hentai,
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
    return [...values]
      ..remove(BooruType.Downloads)
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge)
      ..remove(BooruType.GelbooruAlike);
  }

  static List<BooruType> get detectable {
    return [...values]
      ..remove(BooruType.Downloads)
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge)
      ..remove(BooruType.Autodetect)
      ..remove(BooruType.Hydrus);
  }

  String get alias {
    switch (this) {
      case World:
        return 'World/XYZ';
      case IdolSankaku:
        return 'Sankaku Idol';
      default:
        return name;
    }
  }
}
