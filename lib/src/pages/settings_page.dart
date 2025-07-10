import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:talker/talker.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/about_page.dart';
import 'package:lolisnatcher/src/pages/loli_sync_page.dart';
import 'package:lolisnatcher/src/pages/settings/backup_restore_page.dart';
import 'package:lolisnatcher/src/pages/settings/booru_page.dart';
import 'package:lolisnatcher/src/pages/settings/database_page.dart';
import 'package:lolisnatcher/src/pages/settings/debug_page.dart';
import 'package:lolisnatcher/src/pages/settings/gallery_page.dart';
import 'package:lolisnatcher/src/pages/settings/language_page.dart';
import 'package:lolisnatcher/src/pages/settings/network_page.dart';
import 'package:lolisnatcher/src/pages/settings/performance_page.dart';
import 'package:lolisnatcher/src/pages/settings/privacy_page.dart';
import 'package:lolisnatcher/src/pages/settings/save_cache_page.dart';
import 'package:lolisnatcher/src/pages/settings/tags_filters_page.dart';
import 'package:lolisnatcher/src/pages/settings/theme_page.dart';
import 'package:lolisnatcher/src/pages/settings/user_interface_page.dart';
import 'package:lolisnatcher/src/pages/settings/video_page.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/discord_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/mascot_image.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

/// Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> _onPopInvoked(BuildContext context, bool didPop, _) async {
    if (didPop) {
      return;
    }

    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final bool result = await settingsHandler.saveSettings(restate: true);
    await settingsHandler.loadSettings();
    // await settingsHandler.getBooru();
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> _onWillPop() async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final bool result = await settingsHandler.saveSettings(restate: true);
    await settingsHandler.loadSettings();
    // await settingsHandler.getBooru();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async => _onPopInvoked(context, didPop, result),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(context.loc.settings.title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _onWillPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsButton(
                name: context.loc.settings.language.title,
                icon: const Icon(Icons.translate_rounded),
                page: () => const LanguageSettingsPage(),
              ),
              SettingsButton(
                name: context.loc.settings.booru.title,
                icon: const Icon(Icons.image_search),
                page: () => const BooruPage(),
              ),
              SettingsButton(
                name: context.loc.settings.interface.title,
                icon: const Icon(Icons.grid_on),
                page: () => const UserInterfacePage(),
              ),
              SettingsButton(
                name: context.loc.settings.theme.title,
                icon: const Icon(Icons.palette),
                page: () => const ThemePage(),
              ),
              SettingsButton(
                name: context.loc.settings.viewer.title,
                icon: const Icon(Icons.view_carousel),
                page: () => const GalleryPage(),
              ),
              SettingsButton(
                name: context.loc.settings.video.title,
                icon: const Icon(Icons.video_settings),
                page: () => const VideoSettingsPage(),
              ),
              SettingsButton(
                name: context.loc.settings.downloadsAndCache,
                icon: const Icon(Icons.sd_storage_sharp),
                page: () => const SaveCachePage(),
              ),
              SettingsButton(
                name: context.loc.settings.tagFilters.title,
                icon: const Icon(CupertinoIcons.tag),
                page: () => const TagsFiltersPage(),
              ),
              SettingsButton(
                name: context.loc.settings.database.title,
                icon: const Icon(Icons.list_alt),
                page: () => const DatabasePage(),
              ),
              SettingsButton(
                name: context.loc.settings.backupAndRestore.title,
                icon: const Icon(Icons.restore_page),
                page: () => const BackupRestorePage(),
              ),
              SettingsButton(
                name: context.loc.settings.network.title,
                icon: const Icon(Icons.wifi),
                page: () => const NetworkPage(),
              ),
              SettingsButton(
                name: context.loc.settings.privacy.title,
                icon: const FaIcon(
                  FontAwesomeIcons.userShield,
                  size: 20,
                ),
                page: () => const PrivacyPage(),
              ),
              SettingsButton(
                name: 'Performance',
                icon: const Icon(
                  Icons.speed,
                  size: 20,
                ),
                page: () => const PerformancePage(),
              ),
              SettingsButton(
                name: context.loc.settings.sync.title,
                icon: const Icon(Icons.sync),
                action: settingsHandler.dbEnabled
                    ? null
                    : () {
                        FlashElements.showSnackbar(
                          context: context,
                          title: Text(
                            context.loc.errorExclamation,
                            style: const TextStyle(fontSize: 20),
                          ),
                          content: Text(
                            context.loc.settings.sync.dbError,
                          ),
                          leadingIcon: Icons.error_outline,
                          leadingIconColor: Colors.red,
                          sideColor: Colors.red,
                        );
                      },
                page: settingsHandler.dbEnabled ? () => const LoliSyncPage() : null,
              ),
              const DiscordButton(),
              SettingsButton(
                name: context.loc.settings.about.title,
                icon: const Icon(Icons.info_outline),
                page: () => const AboutPage(),
              ),
              SettingsButton(
                name: context.loc.settings.checkForUpdates.title,
                icon: const Icon(Icons.update),
                action: () {
                  settingsHandler.checkUpdate(withMessage: true);
                },
              ),
              if (Logger.viewController != null)
                SettingsButton(
                  name: 'Share logs',
                  icon: const Icon(Icons.print),
                  trailingIcon: const Icon(Icons.exit_to_app),
                  action: () async {
                    await showDialog(
                      context: context,
                      builder: (_) => SettingsDialog(
                        title: Text(
                          'Logs',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Share logs to external app?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '[WARNING]: Logs may contain sensitive information, share with caution!',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        actionButtons: [
                          const CancelButton(withIcon: true),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.check),
                            label: const Text('Ok'),
                            onPressed: () async {
                              await Logger.viewController?.downloadLogsFile(
                                Logger.talker.history.text(
                                  timeFormat: Logger.talker.settings.timeFormat,
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              SettingsButton(
                name: context.loc.settings.help.title,
                icon: const Icon(Icons.help_center_outlined),
                action: () {
                  launchUrlString(
                    Constants.wikiURL,
                    mode: LaunchMode.externalApplication,
                  );
                },
                trailingIcon: const Icon(Icons.exit_to_app),
              ),
              Obx(() {
                if (settingsHandler.isDebug.value) {
                  return SettingsButton(
                    name: context.loc.settings.debug.title,
                    icon: const Icon(Icons.developer_mode),
                    page: () => const DebugPage(),
                  );
                }

                return const SizedBox.shrink();
              }),
              const VersionButton(),
              const MascotImage(),
            ],
          ),
        ),
      ),
    );
  }
}

class VersionButton extends StatefulWidget {
  const VersionButton({super.key});

  @override
  State<VersionButton> createState() => _VersionButtonState();
}

class _VersionButtonState extends State<VersionButton> {
  int debugTaps = 0;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final String verText =
        '${context.loc.settings.version}: ${Constants.updateInfo.versionName} (${Constants.updateInfo.buildNumber})';

    const String buildTypeText = EnvironmentConfig.isFromStore
        ? '/ Play'
        : (EnvironmentConfig.isTesting ? '/ Test' : (kDebugMode ? '/ Debug' : ''));

    return SettingsButton(
      name: '$verText $buildTypeText'.trim(),
      icon: const Icon(null), // to align with other items
      action: () {
        if (settingsHandler.isDebug.value) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              context.loc.settings.debug.alreadyEnabledSnackbarMsg,
              style: const TextStyle(fontSize: 18),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.yellow,
            sideColor: Colors.yellow,
          );
        } else {
          debugTaps++;
          if (debugTaps > 5) {
            settingsHandler.isDebug.value = true;
            FlashElements.showSnackbar(
              context: context,
              title: Text(
                context.loc.settings.debug.enabledSnackbarMsg,
                style: const TextStyle(fontSize: 18),
              ),
              leadingIcon: Icons.warning_amber,
              leadingIconColor: Colors.green,
              sideColor: Colors.green,
            );
          }
        }

        setState(() {});
      },
      onLongPress: () {
        if (!settingsHandler.isDebug.value) {
          return;
        }
        //
        debugTaps = 0;
        settingsHandler.isDebug.value = false;
        FlashElements.showSnackbar(
          context: context,
          title: Text(
            context.loc.settings.debug.disabledSnackbarMsg,
            style: const TextStyle(fontSize: 18),
          ),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.yellow,
          sideColor: Colors.yellow,
        );
      },
      drawBottomBorder: false,
    );
  }
}
