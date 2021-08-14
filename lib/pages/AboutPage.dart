import 'package:flutter/material.dart';
import 'dart:core';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class AboutPage extends StatelessWidget {
  final String email = 'no.aisu@protonmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("LoliSnatcher")
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("Loli Snatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo."),
            ),
            SettingsButton(
              name: 'Contact: $email',
              icon: Icon(Icons.email),
              trailingIcon: Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("mailto:$email");
                // Clipboard.setData(ClipboardData(text: email));
                // ServiceHandler.displayToast('Email copied to clipboard!');
              }
            ),
            SettingsButton(
              name: 'Github',
              icon: Icon(Icons.public),
              trailingIcon: Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid");
              }
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("A big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv"),
            ),
            SettingsButton(
              name: 'Showers-U - Pixiv',
              icon: Icon(Icons.public),
              trailingIcon: Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://www.pixiv.net/en/users/28366691");
              }
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("A big thanks to NANI-SORE for fixing a bunch of bugs and adding some needed features"),
            ),
            SettingsButton(
              name: 'NANI-SORE - Github',
              icon: Icon(Icons.public),
              trailingIcon: Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NANI-SORE");
              }
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("Latest version and full changelogs can be found at the Github Releases page:"),
            ),
            SettingsButton(
              name: 'Releases',
              icon: Icon(Icons.public),
              trailingIcon: Icon(Icons.exit_to_app),
              action: () {
                ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/releases");
              }
            ),
          ],
        ),
      ),
    );
  }
}
