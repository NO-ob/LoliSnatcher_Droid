// ignore_for_file: constant_identifier_names

enum BooruType {
  AutoDetect,
  // 
  AGNPH,
  BooruOnRails,
  Danbooru,
  e621,
  //FurAffinity,
  Gelbooru,
  GelbooruV1,
  Hydrus,
  IdolSankaku,
  InkBunny,
  Moebooru,
  NyanPals,
  Philomena,
  Rainbooru,
  R34Hentai,
  Sankaku,
  Shimmie,
  Szurubooru,
  WildCritters,
  World,

  // Special
  GelbooruAlike,
  Merge,
  Favourites;

  static List<BooruType> get dropDownValues {
    return [...values]
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge)
      ..remove(BooruType.GelbooruAlike);
  }

  static List<BooruType> get detectable {
    return [...values]
      ..remove(BooruType.Favourites)
      ..remove(BooruType.Merge)
      ..remove(BooruType.AutoDetect)
      ..remove(BooruType.Hydrus);
  }

  String get alias {
    switch (this) {
      case World:
        return 'World/XYZ';
      default:
        return name;
    }
  }
}
