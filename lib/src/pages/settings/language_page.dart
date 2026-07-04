import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:country_flags/country_flags.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({
    this.openSelectorOnStart = false,
    super.key,
  });

  final bool openSelectorOnStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SettingsAppBar(
        title: context.loc.settings.language.title,
      ),
      body: Center(
        child: ListView(
          children: [
            LanguageDropdown(openSelectorOnStart: openSelectorOnStart),
            const SizedBox(height: 24),
            SettingsButton(name: context.loc.settings.language.helpUsTranslate),
            SettingsButton(
              name: context.loc.settings.language.visitForDetails,
              useHtml: true,
              trailingIcon: const Icon(Icons.exit_to_app),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.all(8),
              child: POEditorProgressWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({
    this.openSelectorOnStart = false,
    super.key,
  });

  final bool openSelectorOnStart;

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsDropdown(
          value: locale,
          items: [
            null,
            ...AppLocaleExt.allowedValues,
          ],
          autoOpen: widget.openSelectorOnStart,
          onChanged: (newValue) async {
            locale = newValue;
            setState(() {});
            settingsHandler.locale.value = locale;
            await settingsHandler.setLocale(locale);
            // load boorus and force tab backup to avoid losing tabs from favs/dls
            await settingsHandler.loadBoorus();
            await settingsHandler.saveSettings(restate: false);
            unawaited(SearchHandler.instance.backupTabs());
            setState(() {});
          },
          title: context.loc.settings.language.title,
          itemBuilder: (e) {
            final usedLocale = e ?? AppLocaleUtils.findDeviceLocale();

            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: buildFlag(context, e),
                ),
                Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      e != null
                          ? (e == AppLocale.en ? '${e.localeName} (${e.localeCode})' : e.localeName)
                          : context.loc.settings.language.system,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (e != AppLocale.en)
                      Text(
                        '${usedLocale.englishName} (${usedLocale.localeCode})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
          selectedItemBuilder: (e) {
            final usedLocale = e ?? AppLocaleUtils.findDeviceLocale();

            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: buildFlag(context, usedLocale),
                ),
                Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      e != null
                          ? (e == AppLocale.en ? '${e.localeName} (${e.localeCode})' : e.localeName)
                          : context.loc.settings.language.system,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (e != AppLocale.en)
                      Text(
                        '${usedLocale.englishName} (${usedLocale.localeCode})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
        //
        Builder(
          builder: (context) {
            final usedLocale = locale ?? AppLocaleUtils.findDeviceLocale();

            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: usedLocale.translators == null
                  ? const SizedBox(width: double.infinity)
                  : SettingsButton(
                      name: context.loc.settings.about.localizers,
                      subtitle: Text(usedLocale.translators ?? ''),
                    ),
            );
          },
        ),
      ],
    );
  }
}

Widget buildFlag(BuildContext context, AppLocale? locale) {
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
    locale.languageCode,
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
        'en',
        theme: flagTheme,
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

extension AppLocaleExt on AppLocale {
  String get localeCode {
    return LocaleSettings.instance.translationMap[this]?.locale ?? '?';
  }

  String get localeName {
    return LocaleSettings.instance.translationMap[this]?.localeName ?? 'Loading...';
  }

  static List<AppLocale> get allowedValues => [
    // Other languages are disabled until they reach at least 80% of completion
    // en and ru first, others in alphabetical order
    //
    /* English */ AppLocale.en,
    /* Russian */ AppLocale.ruRu,
    //
    /* Chinese */ AppLocale.zhCn,
    /* German */ AppLocale.deDe,
    /* Japanese */ AppLocale.jaJp,
    /* Turkish */ AppLocale.trTr,
  ];

  String get englishName {
    switch (this) {
      case .en:
        return 'English';
      case .ruRu:
        return 'Russian';
      case .zhCn:
        return 'Chinese (Simplified)';
      case .nlNl:
        return 'Dutch';
      case .frFr:
        return 'French';
      case .deDe:
        return 'German';
      case .itIt:
        return 'Italian';
      case .jaJp:
        return 'Japanese';
      case .koKr:
        return 'Korean';
      case .plPl:
        return 'Polish';
      case .ptBr:
        return 'Portuguese (Brazil)';
      case .esEs:
        return 'Spanish';
      case .esMx:
        return 'Spanish (Mexico)';
      case .trTr:
        return 'Turkish';
    }
  }

  String? get translators {
    switch (this) {
      case .zhCn:
        return 'RnJ4';
      case .deDe:
        return 'Rin Kusu, Moddimation';
      case .jaJp:
        return 'stardust248397';
      case .trTr:
        return 'kyomoe';
      //
      default:
        return null;
    }
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

//

class POEditorProgressWidget extends StatefulWidget {
  const POEditorProgressWidget({
    super.key,
  });

  @override
  State<POEditorProgressWidget> createState() => _POEditorProgressWidgetState();
}

class _POEditorProgressWidgetState extends State<POEditorProgressWidget> {
  List<dynamic>? _languages;
  String? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLanguages();
  }

  Future<void> _fetchLanguages() async {
    setState(() {
      _error = null;
      if (_languages == null) {
        _isLoading = true;
      }
    });

    try {
      final response = await DioNetwork.post(
        'https://api.poeditor.com/v2/languages/list',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {
          'api_token': Constants.poeditorApiKey,
          'id': Constants.poeditorProjectId,
        },
      );

      final data = response.data;
      if (data['response']['status'] == 'success') {
        setState(() {
          _languages = data['result']['languages'];
          _isLoading = false;
        });
        _languages?.sort((a, b) {
          final String aName = a['name']?.toLowerCase() ?? '';
          final String bName = b['name']?.toLowerCase() ?? '';
          if (aName == 'english' && bName != 'english') return -1;
          if (bName == 'english' && aName != 'english') return 1;
          if (aName == 'russian' && bName != 'russian') return -1;
          if (bName == 'russian' && aName != 'russian') return 1;
          return aName.compareTo(bName);
        });
      } else {
        setState(() {
          _error = 'POEditor Error: ${data['response']['message']}';
          _isLoading = false;
        });
      }
    } on DioException catch (e) {
      setState(() {
        _error = 'Network Error: ${e.message}';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'An unexpected error occurred: $e';
        _isLoading = false;
      });
    } finally {
      if (_error != null) {
        Logger.Inst().log(
          _error,
          'POEditorProgressWidget',
          '_fetchLanguages',
          null,
          s: StackTrace.current,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => launchUrlString(
          Constants.translationURL,
          mode: LaunchMode.externalApplication,
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image(
                        image: NetworkImage('https://poeditor.com/public/images/favicons/mstile-144x144.png'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'POEditor',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(
                    Icons.exit_to_app,
                    size: 24,
                  ),
                ),
              ],
            ),
            //
            if (_error == null && _languages != null && _languages!.isNotEmpty)
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
            //
            Builder(
              builder: (context) {
                if (_isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (_error != null || _languages == null || _languages!.isEmpty) {
                  return const SizedBox.shrink();
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: _languages!.length,
                  itemBuilder: (context, index) {
                    final lang = _languages![index];
                    final String name = lang['name'] ?? '[UNKNOWN]';
                    double percentage = (lang['percentage'] as num?)?.toDouble() ?? 0.0;
                    if (percentage >= 99.5) {
                      // round up to 100 because there are some poeditor entries that require extra translations (i.e. one/few/many/other variants), but actually don't need them
                      percentage = 100.0;
                    }
                    final Color progressColor = switch (percentage) {
                      <= 30 => Colors.red,
                      <= 80 => Colors.yellow,
                      _ => Colors.green, // 80+% are considered good enough to enable the language
                    };

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              name,
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: (percentage * 100).toInt(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: progressColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: ((100 - percentage) * 100).toInt(),
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 64,
                            child: Text(
                              '${percentage.toStringAsFixed(percentage.truncate() == percentage ? 0 : 1)}%',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
