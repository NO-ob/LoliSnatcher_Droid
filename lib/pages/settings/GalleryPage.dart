import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class GalleryPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  GalleryPage(this.settingsHandler);
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool autoHideImageBar = false, autoPlay = true, loadingGif = false, useVolumeButtonsForScroll = false, shitDevice = false, disableVideo = false;
  String? galleryMode, galleryBarPosition, galleryScrollDirection;
  TextEditingController preloadController = new TextEditingController();
  TextEditingController scrollSpeedController = TextEditingController();
  @override
  void initState(){
    autoHideImageBar = widget.settingsHandler.autoHideImageBar;
    galleryMode = widget.settingsHandler.galleryMode;
    galleryBarPosition = widget.settingsHandler.galleryBarPosition;
    galleryScrollDirection = widget.settingsHandler.galleryScrollDirection;
    autoPlay = widget.settingsHandler.autoPlayEnabled;
    useVolumeButtonsForScroll = widget.settingsHandler.useVolumeButtonsForScroll;
    scrollSpeedController.text = widget.settingsHandler.volumeButtonsScrollSpeed.toString();
    
    preloadController.text = widget.settingsHandler.preloadCount.toString();
    shitDevice = widget.settingsHandler.shitDevice;
    disableVideo = widget.settingsHandler.disableVideo;
    loadingGif = widget.settingsHandler.loadingGif;
    super.initState();
  }
  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    widget.settingsHandler.autoHideImageBar = autoHideImageBar;
    widget.settingsHandler.galleryMode = galleryMode!;
    widget.settingsHandler.galleryBarPosition = galleryBarPosition!;
    widget.settingsHandler.galleryScrollDirection = galleryScrollDirection!;
    widget.settingsHandler.autoPlayEnabled = autoPlay;
    widget.settingsHandler.loadingGif = loadingGif;
    widget.settingsHandler.shitDevice = shitDevice;
    widget.settingsHandler.disableVideo = disableVideo;
    widget.settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    if (int.parse(scrollSpeedController.text) < 100){
      scrollSpeedController.text = 100.toString();
    }
    widget.settingsHandler.volumeButtonsScrollSpeed = int.parse(scrollSpeedController.text);

    if (int.parse(preloadController.text) < 0){
      preloadController.text = 0.toString();
    }
    widget.settingsHandler.preloadCount = int.parse(preloadController.text);
    // Set settingshandler values here
    bool result = await widget.settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Gallery View Preload :            "),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: preloadController,
                          //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Images to preload",
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
                // This dropdown is used to change the quality of the images displayed on the home page
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Gallery Quality :     "),
                    DropdownButton<String>(
                      value: galleryMode,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          galleryMode = newValue;
                        });
                      },
                      items: <String>["Sample","Full Res"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Gallery Quality",
                              [
                                Text("The gallery quality changes the resolution of images in the gallery viewer"),
                                Text(" - Sample - Medium resolution"),
                                Text(" - Full Res - Full resolution"),
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
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Gallery Scroll Direction :     "),
                    DropdownButton<String>(
                      value: galleryScrollDirection,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          galleryScrollDirection = newValue;
                        });
                      },
                      items: <String>["Horizontal", "Vertical"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    Text("Gallery Bar Position :     "),
                    DropdownButton<String>(
                      value: galleryBarPosition,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          galleryBarPosition = newValue;
                        });
                      },
                      items: <String>["Top", "Bottom"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Auto Hide Gallery Bar: "),
                    Checkbox(
                      value: autoHideImageBar,
                      onChanged: (newValue) {
                        setState(() {
                          autoHideImageBar = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Disable Video: "),
                    Checkbox(
                      value: disableVideo,
                      onChanged: (newValue) {
                        setState(() {
                          disableVideo = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Disable Video",
                              [
                                Text("Useful on low end devices that crash when trying to load videos."),
                                Text("Replaces video with some text that says Video disabled"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Video Auto Play: "),
                    Checkbox(
                      value: autoPlay,
                      onChanged: (newValue) {
                        setState(() {
                          autoPlay = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Kanna loading Gif: "),
                    Checkbox(
                      value: loadingGif,
                      onChanged: (newValue) {
                        setState(() {
                          loadingGif = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("My device is shit: "),
                    Checkbox(
                      value: shitDevice,
                      onChanged: (newValue) {
                        setState(() {
                          shitDevice = newValue!;
                          if (shitDevice){
                            preloadController.text = "0";
                            galleryMode = "Sample";
                            autoPlay = false;
                          }
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("My device is shit",
                              [
                                Text(" - Disables loading progress information"),
                                Text(" - Sets optimal settings for:"),
                                Text("    - Gallery Quality"),
                                Text("    - Gallery Preload"),
                                Text("    - Video Auto Play"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Use Volume Buttons for Scrolling: "),
                      Checkbox(
                        value: useVolumeButtonsForScroll,
                        onChanged: (newValue) {
                          setState(() {
                            useVolumeButtonsForScroll = newValue!;
                          });
                        },
                        activeColor: Get.context!.theme.primaryColor,
                      ),
                      IconButton(
                        icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                        onPressed: () {
                          Get.dialog(
                              InfoDialog("Volume Buttons Scrolling",
                                [
                                  Text(" - Volume Down - next item"),
                                  Text(" - Volume Up - previous item"),
                                  const SizedBox(height: 10),
                                  Text("On videos:"),
                                  Text(" - App Bar visible - controls volume"),
                                  Text(" - App Bar hidden - controls scrolling"),
                                ],
                                CrossAxisAlignment.start,
                              )
                          );
                        },
                      ),
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Buttons Scroll Speed :            "),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: scrollSpeedController,
                          //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Scroll Speed",
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
            ],
          ),
        ),
      ),
    );
  }
}
