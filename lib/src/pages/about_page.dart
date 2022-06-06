import 'dart:core';

import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/handlers/service_handler.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String email = 'no.aisu@protonmail.com';

    return Scaffold(
      appBar: AppBar(
          title: const Text("LoliSnatcher")
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10,10,10,10),
              child: const Text("LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo."),
            ),
            SettingsButton(
              name: 'Contact: $email',
              icon: const Icon(Icons.email),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("mailto:$email");
                // Clipboard.setData(ClipboardData(text: email));
                // ServiceHandler.displayToast('Email copied to clipboard!');
              }
            ),
            SettingsButton(
              name: 'Github',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid");
              }
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10,10,10,10),
              child: const Text("A big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv"),
            ),

            EnvironmentConfig.isFromStore ? Container() : SettingsButton(
              name: 'Showers-U - Pixiv',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://www.pixiv.net/en/users/28366691");
              }
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10,10,10,10),
              child: const Text("A big thanks to NANI-SORE for fixing a bunch of bugs and adding some needed features"),
            ),
            SettingsButton(
              name: 'NANI-SORE - Github',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NANI-SORE");
              }
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10,10,10,10),
              child: const Text("Latest version and full changelogs can be found at the Github Releases page:"),
            ),
            SettingsButton(
              name: 'Releases',
              icon: const Icon(Icons.public),
              trailingIcon: const Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/releases");
              }
            ),
            SettingsButton(
              name: 'Licenses',
              icon: const Icon(Icons.document_scanner),
              action: () {
                showLicensePage(context: context, applicationName: 'LoliSnatcher');
              }
            ),
          ],
        ),
      ),
    );
  }
}
