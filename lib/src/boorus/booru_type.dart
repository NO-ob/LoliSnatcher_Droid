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
}
