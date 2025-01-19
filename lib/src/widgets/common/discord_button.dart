import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DiscordButton extends StatelessWidget {
  const DiscordButton({
    this.overrideText,
    super.key,
  });

  final String? overrideText;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    if (EnvironmentConfig.isFromStore) {
      // don't render the button if app is installed from the store
      return const SizedBox.shrink();
    }

    return Obx(() {
      final String discordURL = settingsHandler.discordURL.value;

      return SettingsButton(
        name: overrideText ?? context.loc.discord,
        icon: const FaIcon(
          FontAwesomeIcons.discord,
          size: 20,
        ),
        action: () {
          launchUrlString(
            discordURL,
            mode: LaunchMode.externalApplication,
          );
        },
        trailingIcon: const Icon(Icons.exit_to_app),
      );
    });
  }
}
