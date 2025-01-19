import 'package:flutter/material.dart';

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
                itemTitleBuilder: (e) => e?.localeName ?? context.loc.settings.language.systemLanguageOption,
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
  String get localeName {
    return LocaleSettings.instance.translationMap[this]?.locale ?? 'Loading...';
  }
}
