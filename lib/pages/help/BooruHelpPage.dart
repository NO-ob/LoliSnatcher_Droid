
import 'package:LoliSnatcher/widgets/TextExpander.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooruHelpPage extends StatefulWidget {
  BooruHelpPage();
  @override
  _BooruHelpPageState createState() => _BooruHelpPageState();
}

class _BooruHelpPageState extends State<BooruHelpPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Booru Help"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10,10,10,10),
          width: double.infinity,
          child: ListView(
            children: [
                  TextExpander(title: "Adding a booru", bodyList: [
                    Text("Go to the add booru page: Settings > Booru/Search > Add New."),
                    Text("Put a name for this booru in the name field."),
                    Text("Put a url for this booru in the url field."),
                    Text("Press the test button."),
                    Text("After the test is done a save button will show up click this and the booru is added."),
                    Text("After exiting out of settings page the booru should show in the dropdown after pressing search a few times.")
                  ]),
                  TextExpander(title: "Fix no data returned popup", bodyList: [
                    Text("The first thing to check when getting this error is that the url is correct if is and it's not working you may need to login to the booru."),
                    Text("You will need to get your api key to use your account."),
                    Text("To find this you will need to login or signup to the booru website and go to the settings page."),
                    Text("Different boorus use different login methods some will give you just an api key and some will also give you a userid."),
                    Text("If the site only gives you an api key put that into the API Key field in the app."),
                    Text("Then put your website username into apps User ID field."),
                    Text("If the site also gives you a user id put that into the apps User ID Field instead of your username."),
                    Text("You can then hit the test button and the save button should then show up."),
                    Text("If you get the same error about no data the booru may not be supported."),
                    Text("You can ask for support by opening an issue on github or sending an email."),
                    Text("You can find the email address and github link in Settings > About."),
                  ]),
                  TextExpander(title: "Change the default booru:", bodyList: [Text("Go to the add booru/search page: Settings > Booru/Search"),
                    Text("Select the booru you would like to be the default in the dropdown box."),
                    Text("After selecting it back out of the page to save your settings."),
                    Text("After pressing the search button a few times the booru should now be the default."),
                    Text("If it doesn't change just restart the app.")
                  ]),
                  TextExpander(title: "Tips", bodyList: [
                    Text("Holding the mute button in the video player will keep videos muted for the current app session")
                  ]),
                  ],
                ),
              ),
          );
  }
}
