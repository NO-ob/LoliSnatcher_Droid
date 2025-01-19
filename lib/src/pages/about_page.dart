import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/discord_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.appName),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(context.loc.settings.about.appDescription),
            ),
            SettingsButton(
              name: context.loc.settings.about.appOnGitHub,
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  Constants.githubURL,
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            DiscordButton(overrideText: context.loc.visitOurDiscord),
            SettingsButton(
              name: '${context.loc.settings.about.contact}: ${Constants.email}',
              icon: const Icon(Icons.email),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  'mailto:${Constants.email}',
                  mode: LaunchMode.externalApplication,
                );
              },
              onLongPress: () {
                Clipboard.setData(const ClipboardData(text: Constants.email));
                FlashElements.showSnackbar(
                  context: context,
                  title: Text(
                    context.loc.copied,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Text(context.loc.settings.about.emailCopied),
                  sideColor: Colors.green,
                  leadingIcon: Icons.check,
                  leadingIconColor: Colors.green,
                  duration: const Duration(seconds: 2),
                );
              },
            ),
            //
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(context.loc.settings.about.logoArtistThanks),
            ),
            if (!EnvironmentConfig.isFromStore)
              SettingsButton(
                name: 'Showers-U - Pixiv',
                icon: const Icon(Icons.public),
                trailingIcon: const Icon(Icons.exit_to_app),
                action: () {
                  launchUrlString(
                    'https://www.pixiv.net/en/users/28366691',
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            //
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('${context.loc.settings.about.developers}:'),
            ),
            SettingsButton(
              name: 'NO-ob - Github',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  'https://github.com/NO-ob',
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            SettingsButton(
              name: 'NANI-SORE - Github',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  'https://github.com/NANI-SORE',
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            //
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(context.loc.settings.about.releasesMsg),
            ),
            SettingsButton(
              name: context.loc.settings.about.releases,
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  'https://github.com/NO-ob/LoliSnatcher_Droid/releases',
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            SettingsButton(
              name: context.loc.settings.about.licenses,
              icon: const Icon(Icons.document_scanner),
              action: () {
                showLicensePage(
                  context: context,
                  applicationName: context.loc.appName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
