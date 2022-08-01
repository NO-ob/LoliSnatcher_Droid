import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DiscordButton extends StatelessWidget {
  const DiscordButton({
    Key? key,
    this.overrideText,
  }) : super(key: key);

  final String? overrideText;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    if (EnvironmentConfig.isFromStore) {
      // don't render the button if app is installed from the store
      return Container();
    }

    return Obx(() {
      final String discordURL = settingsHandler.discordURL.value;

      return SettingsButton(
        name: overrideText ?? 'Discord',
        icon: const FaIcon(FontAwesomeIcons.discord),
        action: () {
          ServiceHandler.launchURL(discordURL);
        },
        trailingIcon: const Icon(Icons.exit_to_app),
      );
    });
  }
}
