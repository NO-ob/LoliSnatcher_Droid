import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/backup_restore_page.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/pages/settings/language_page.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_view.dart';

class MediaPreviews extends StatefulWidget {
  const MediaPreviews({super.key});

  @override
  State<MediaPreviews> createState() => _MediaPreviewsState();
}

class _MediaPreviewsState extends State<MediaPreviews> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final ValueNotifier<bool> booruListFilled = ValueNotifier(false), tabListFilled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    booruListFilled.value = settingsHandler.booruList.isNotEmpty;
    settingsHandler.booruList.addListener(booruListener);

    tabListFilled.value = searchHandler.tabs.isNotEmpty;
    searchHandler.tabs.addListener(tabListener);
  }

  void booruListener() {
    booruListFilled.value = settingsHandler.booruList.isNotEmpty;
  }

  void tabListener() {
    tabListFilled.value = searchHandler.tabs.isNotEmpty;
  }

  @override
  void dispose() {
    settingsHandler.booruList.removeListener(booruListener);
    searchHandler.tabs.removeListener(tabListener);
    super.dispose();
  }

  void openPage(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  Future<void> openArticle(String url) async {
    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    settingsHandler.themeMode.value = mode;
    await settingsHandler.saveSettings(restate: false);
  }

  Widget buildEmptyState(BuildContext context) {
    final loc = context.loc.mediaPreviews;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool wide = constraints.maxWidth >= 640;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.image_search_rounded,
                              size: 40,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        loc.onboardingTitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        loc.onboardingSubtitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _ThemeModeToggle(
                        onChanged: setThemeMode,
                      ),
                      const SizedBox(height: 12),
                      _LanguageSettingsTile(
                        onTap: () => openPage(const LanguageSettingsPage(openSelectorOnStart: true)),
                      ),
                      const SizedBox(height: 28),
                      _OnboardingActionGrid(
                        wide: wide,
                        children: [
                          _OnboardingActionTile(
                            title: loc.addBooruAction,
                            subtitle: loc.addBooruActionSubtitle,
                            icon: Icons.add_photo_alternate_outlined,
                            filled: true,
                            onTap: () => openPage(BooruEdit(Booru('New', null, '', '', ''))),
                          ),
                          _OnboardingActionTile(
                            title: loc.restoreBackupAction,
                            subtitle: loc.restoreBackupActionSubtitle,
                            icon: Icons.restore_page_outlined,
                            onTap: () => openPage(const BackupRestorePage()),
                          ),
                          _OnboardingActionTile(
                            title: loc.openSettingsAction,
                            subtitle: loc.openSettingsActionSubtitle,
                            icon: Icons.settings_outlined,
                            onTap: () => openPage(const SettingsPage()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.dividerColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Text(
                                loc.helpSectionTitle,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            _ArticleLinkTile(
                              title: loc.booruSourcesArticle,
                              subtitle: loc.booruSourcesArticleSubtitle,
                              onTap: () => openArticle(Constants.booruSourcesWikiURL),
                            ),
                            const Divider(height: 1, indent: 16, endIndent: 16),
                            _ArticleLinkTile(
                              title: loc.backupRestoreArticle,
                              subtitle: loc.backupRestoreArticleSubtitle,
                              onTap: () => openArticle(Constants.backupRestoreWikiURL),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('image previews build $booruListFilled $tabListFilled');

    return ListenableBuilder(
      listenable: Listenable.merge([booruListFilled, tabListFilled]),
      builder: (context, _) {
        final booruListFilledVal = booruListFilled.value;
        final tabListFilledVal = tabListFilled.value;

        // no booru configs
        if (!booruListFilledVal) {
          return buildEmptyState(context);
        }

        // temp message while restoring tabs (or for some reason initial tab was not created)
        if (!tabListFilledVal) {
          return Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                ValueListenableBuilder(
                  valueListenable: searchHandler.isRestored,
                  builder: (context, isRestored, child) {
                    if (searchHandler.isRestored.value) {
                      return const SizedBox.shrink();
                    }

                    return child!;
                  },
                  child: Text(context.loc.mediaPreviews.restoringPreviousSession),
                ),
              ],
            ),
          );
        }

        // render thumbnails grid
        return const WaterfallView();
      },
    );
  }
}

class _LanguageSettingsTile extends StatelessWidget {
  const _LanguageSettingsTile({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final settingsHandler = SettingsHandler.instance;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Obx(
          () {
            final AppLocale? locale = settingsHandler.locale.value;
            final AppLocale usedLocale = locale ?? AppLocaleUtils.findDeviceLocale();
            final String localeTitle = locale == null
                ? context.loc.settings.language.system
                : locale == AppLocale.en
                ? '${locale.localeName} (${locale.localeCode})'
                : locale.localeName;

            return Material(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    children: [
                      buildFlag(context, usedLocale),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.loc.settings.language.title + (usedLocale == AppLocale.en ? '' : ' / Language'),
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              localeTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ThemeModeToggle extends StatelessWidget {
  const _ThemeModeToggle({
    required this.onChanged,
  });

  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final settingsHandler = SettingsHandler.instance;
    final loc = context.loc.settings.theme;

    return Center(
      child: Obx(
        () => SizedBox(
          height: kMinInteractiveDimension,
          child: SegmentedButton<ThemeMode>(
            style: const ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size.fromHeight(kMinInteractiveDimension)),
              minimumSize: WidgetStatePropertyAll(Size(0, kMinInteractiveDimension)),
            ),
            showSelectedIcon: false,
            selected: {settingsHandler.themeMode.value},
            onSelectionChanged: (selection) => onChanged(selection.first),
            segments: [
              ButtonSegment(
                value: ThemeMode.system,
                icon: const Icon(Icons.brightness_auto_outlined),
                label: _SegmentLabel(loc.system),
              ),
              ButtonSegment(
                value: ThemeMode.light,
                icon: const Icon(Icons.light_mode_outlined),
                label: _SegmentLabel(loc.light),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: const Icon(Icons.dark_mode_outlined),
                label: _SegmentLabel(loc.dark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SegmentLabel extends StatelessWidget {
  const _SegmentLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimension,
      child: Align(
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}

class _OnboardingActionGrid extends StatelessWidget {
  const _OnboardingActionGrid({
    required this.wide,
    required this.children,
  });

  final bool wide;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (!wide) {
      return Column(
        spacing: 12,
        children: children,
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          for (final child in children) Expanded(child: child),
        ],
      ),
    );
  }
}

class _OnboardingActionTile extends StatelessWidget {
  const _OnboardingActionTile({
    required this.title,
    required this.icon,
    required this.onTap,
    this.subtitle,
    this.filled = false,
  });

  final String title;

  final IconData icon;
  final VoidCallback onTap;
  final String? subtitle;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Color background = filled ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest;
    final Color foreground = filled ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 110),
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: background,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: foreground, size: 24),
                      const Spacer(),
                      Icon(Icons.chevron_right, color: foreground),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: foreground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(color: foreground),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleLinkTile extends StatelessWidget {
  const _ArticleLinkTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: const Icon(Icons.article_outlined),
        title: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(title),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.open_in_new),
        onTap: onTap,
      ),
    );
  }
}
