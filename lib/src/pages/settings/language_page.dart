import 'package:flutter/material.dart';

import 'package:country_flags/country_flags.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  AppLocale? locale;

  @override
  void initState() {
    super.initState();

    LocaleSettings.instance.loadAllLocales().then((_) {
      setState(() {});
    });

    locale = settingsHandler.locale.value;
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.locale.value = locale;
    await settingsHandler.setLocale(locale);
    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Widget buildFlag(AppLocale? locale) {
    if (locale == null) {
      return const Icon(
        Icons.settings,
      );
    } else {
      if (locale.localeCode == '?') {
        return const CircularProgressIndicator();
      }

      const double width = 36, height = 24;

      Widget firstFlag = CountryFlag.fromLanguageCode(
        locale.localeCode,
        width: width,
        height: height,
        shape: const RoundedRectangle(6),
      );
      Widget? secondFlag;
      switch (locale) {
        case AppLocale.en:
          firstFlag = CountryFlag.fromLanguageCode(
            'en-us',
            width: width,
            height: height,
            shape: const RoundedRectangle(6),
          );
          secondFlag = CountryFlag.fromLanguageCode(
            locale.localeCode,
            width: width,
            height: height,
            shape: const RoundedRectangle(6),
          );
          break;
        default:
          break;
      }

      if (secondFlag == null) {
        return firstFlag;
      } else {
        return Stack(
          children: [
            firstFlag,
            ClipPath(
              clipper: _SecondLanguageFlagClipper(),
              child: secondFlag,
            ),
          ],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(context.loc.settings.language.title),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                value: locale,
                items: const [
                  null,
                  ...AppLocale.values,
                ],
                onChanged: (newValue) async {
                  locale = newValue;
                  setState(() {});
                  await settingsHandler.setLocale(locale);
                  setState(() {});
                },
                title: context.loc.settings.language.title,
                itemBuilder: (e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      e?.localeName ?? context.loc.settings.language.systemLanguageOption,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: buildFlag(e),
                    ),
                  ],
                ),
              ),
              // TODO Add "Help us translate" block here with link
            ],
          ),
        ),
      ),
    );
  }
}

extension AppLocaleExt on AppLocale {
  String get localeCode {
    return LocaleSettings.instance.translationMap[this]?.locale ?? '?';
  }

  String get localeName {
    return LocaleSettings.instance.translationMap[this]?.localeName ?? 'Loading...';
  }
}

class _SecondLanguageFlagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
