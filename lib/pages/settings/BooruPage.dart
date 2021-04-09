import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';
import 'BooruEditPage.dart';

// ignore: must_be_immutable
class BooruPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  BooruPage(this.settingsHandler);
  @override
  _BooruPageState createState() => _BooruPageState();
}

class _BooruPageState extends State<BooruPage> {
  final defaultTagsController = TextEditingController();
  final limitController = TextEditingController();
  Booru? selectedBooru;
  @override
  void initState(){
    super.initState();
    defaultTagsController.text = widget.settingsHandler.defTags;
    limitController.text = widget.settingsHandler.limit.toString();
  }
  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    widget.settingsHandler.defTags = defaultTagsController.text;
    if (int.parse(limitController.text) > 100){
      limitController.text = "100";
    } else if (int.parse(limitController.text) < 5){
      limitController.text = "5";
    }
    widget.settingsHandler.prefBooru = selectedBooru!.name!;
    widget.settingsHandler.limit = int.parse(limitController.text);
    bool result = await widget.settingsHandler.saveSettings();
    if (selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){selectedBooru = widget.settingsHandler.booruList.elementAt(0);}
    return result;
  }
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Booru/Search"),
          ),
          body: Center(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Default Tags:"),
                      Container(width: 10),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10,0,0,0),
                          child: TextField(
                            controller: defaultTagsController,
                            decoration: InputDecoration(
                              hintText:"Tags searched when app opens",
                              contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(50),
                                gapPadding: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Limit:"),
                      Container(width: 10),
                      new Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10,0,0,0),
                          child: TextField(
                            controller: limitController,
                            //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              hintText: "Images to fetch per page 10-100",
                              contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(50),
                                gapPadding: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Booru:    "),
                      FutureBuilder(
                        future: BooruSelector(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                            return snapshot.data;
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                        onPressed: () {
                          Get.dialog(
                              InfoDialog("Booru",
                                [
                                  Text("The booru selected here will be set as default after saving"),
                                  Text("The default booru will be first to appear in the dropdown boxes"),
                                ],
                                CrossAxisAlignment.start,
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10,10,10,10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20),
                              side: BorderSide(color: Get.context!.theme.accentColor),
                            ),
                          ),
                          onPressed: (){
                            if(selectedBooru != null){
                              Get.to(() => booruEdit(selectedBooru!,widget.settingsHandler));
                            }
                          },
                          child: Text("Edit", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10,10,10,10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20),
                              side: BorderSide(color: Get.context!.theme.accentColor),
                            ),
                          ),
                          onPressed: (){
                            //Open the booru editor on a new page with default values
                            if(widget.settingsHandler.appMode == "Desktop"){
                              Get.dialog(Dialog(
                                child: Container(
                                  width: 500,
                                  child: booruEdit(new Booru("New","","","",""),widget.settingsHandler),
                                ),
                              ));
                            } else {
                              Get.to(() => booruEdit(new Booru("New","","","",""),widget.settingsHandler));
                            }
                          },
                          child: Text("Add new", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10,10,10,10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20),
                              side: BorderSide(color: Get.context!.theme.accentColor),
                            ),
                          ),
                          onPressed: (){
                            // Open the booru edtor page but with default values
                            if (widget.settingsHandler.deleteBooru(selectedBooru!)){
                              setState(() {
                                ServiceHandler.displayToast("Booru Deleted! \n Dropdown will update on search");
                                //Get.snackbar("Booru Deleted!","Dropdown will update on search",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                              });
                            }
                          },
                          child: Text("Delete", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  /**
   * This is the same as the drop down used in the Home widget. The reason the code is reused instead of having a global widget is that
   * it cant update the state of the parent widget if it is outside of the class.
   */
  Future BooruSelector() async {
    if(widget.settingsHandler.booruList.isEmpty){
      await widget.settingsHandler.getBooru();
    }
    if (selectedBooru == null){
      selectedBooru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru? newValue){
          print(newValue!.baseURL);
          setState((){
            selectedBooru = newValue;
            //widget.settingsHandler.prefBooru = newValue.name!;
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                (value.type == "Favourites"
                    ? Icon(Icons.favorite, color: Colors.red, size: 18)
                    : Image.network(
                    value.faviconURL!,
                    width: 16,
                    errorBuilder: (_, __, ___) {
                      return Icon(Icons.broken_image, size: 18);
                    }
                )
                ),
                Text(" ${value.name!}"),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
