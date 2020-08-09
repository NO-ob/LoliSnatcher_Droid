import 'package:flutter/material.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Snatcher")
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("Loli Snatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo."),),
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
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Theme.of(context).accentColor),
                ),
                onPressed: (){
                  _launchURL("https://github.com/NO-ob/LoliSnatcher_Droid");
                },
                child: Text("GitHub"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Text("A Big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv"),),
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Theme.of(context).accentColor,),
                ),
                onPressed: (){
                  _launchURL("https://www.pixiv.net/en/users/28366691");
                },
                child: Text("Showers-U - Pixiv"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// function from url_launcher pub.dev page

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}