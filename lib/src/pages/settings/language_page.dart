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
    const double width = 36, height = 24;

    if (locale == null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          Icons.settings,
          size: 20,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      );
    }

    if (locale.localeCode == '?') {
      return const CircularProgressIndicator();
    }

    const flagTheme = ImageTheme(
      width: width,
      height: height,
      shape: RoundedRectangle(6),
    );

    Widget firstFlag = CountryFlag.fromLanguageCode(
      locale.localeCode,
      theme: flagTheme,
    );
    Widget? secondFlag;
    switch (locale) {
      case AppLocale.en:
        firstFlag = CountryFlag.fromLanguageCode(
          'en-us',
          theme: flagTheme,
        );
        secondFlag = CountryFlag.fromLanguageCode(
          locale.localeCode,
          theme: flagTheme,
        );
        break;
      case AppLocale.dev:
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.developer_board,
            size: 20,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        );
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
                items:
                    const [
                          null,
                          ...AppLocale.values,
                        ]
                        .where(
                          // don't show dev loc when not in debug (unless it's already selected)
                          (e) => e?.name != 'dev' || settingsHandler.isDebug.value || locale?.name == e?.name,
                        )
                        .toList(),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: buildFlag(e),
                    ),
                    Text(
                      e?.localeName ?? context.loc.settings.language.system,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SettingsButton(name: context.loc.settings.language.helpUsTranslate),
              SettingsButton(
                name: context.loc.settings.language.visitForDetails,
                useHtml: true,
                trailingIcon: const Icon(Icons.exit_to_app),
              ),
              // TODO Add weblate widget
              const Placeholder(fallbackHeight: 300),
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
