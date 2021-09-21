import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';

import '../ServiceHandler.dart';

class AboutPage extends StatelessWidget {
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
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                children: <Widget>[
                  Text("Contact: "),
                  SelectableText("no.aisu@protonmail.com"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                ),
                onPressed: (){
                  ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid");
                },
                child: Text('GitHub', style: TextStyle(color: Colors.white))
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("A big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv"),
            ),
            /*Container(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                ),
                onPressed: (){
                  ServiceHandler.launchURL("https://www.pixiv.net/en/users/28366691");
                },
                child: Text("Showers-U - Pixiv", style: TextStyle(color: Colors.white)),
              ),
            ),*/
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("A big thanks to NANI-SORE for fixing a bunch of bugs and adding some needed features"),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                ),
                onPressed: (){
                  ServiceHandler.launchURL("https://github.com/NANI-SORE");
                },
                child: Text("NANI-SORE - Github", style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("Latest version and full changelogs can be found at the Github Releases page:"),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                ),
                onPressed: (){
                  ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/releases");
                },
                child: Text("Releases", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
