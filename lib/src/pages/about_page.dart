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
        title: const Text('LoliSnatcher'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.',
              ),
            ),
            SettingsButton(
              name: 'LoliSnatcher on Github',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                launchUrlString(
                  'https://github.com/NO-ob/LoliSnatcher_Droid',
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            const DiscordButton(overrideText: 'Visit our Discord Server'),
            SettingsButton(
              name: 'Contact: ${Constants.email}',
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
                  title: const Text('Copied!', style: TextStyle(fontSize: 20)),
                  content: const Text('Email address copied to clipboard'),
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
              child: const Text('A big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv'),
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
              child: const Text('Developers:'),
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
              child: const Text('Latest version and full changelogs can be found at the Github Releases page:'),
            ),
            SettingsButton(
              name: 'Releases',
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
              name: 'Licenses',
              icon: const Icon(Icons.document_scanner),
              action: () {
                showLicensePage(context: context, applicationName: 'LoliSnatcher');
              },
            ),
          ],
        ),
      ),
    );
  }
}
