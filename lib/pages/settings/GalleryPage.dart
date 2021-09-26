import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage();
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final SettingsHandler settingsHandler = Get.find();
  bool autoHideImageBar = false, autoPlay = true, loadingGif = false, useVolumeButtonsForScroll = false, shitDevice = false, disableVideo = false;
  late String galleryMode, galleryBarPosition, galleryScrollDirection, zoomButtonPosition;
  List<List<String>>? buttonOrder;
  TextEditingController preloadController = TextEditingController();
  TextEditingController scrollSpeedController = TextEditingController();
  TextEditingController galleryAutoScrollController = TextEditingController();

  @override
  void initState(){
    autoHideImageBar = settingsHandler.autoHideImageBar;
    galleryMode = settingsHandler.galleryMode;
    galleryBarPosition = settingsHandler.galleryBarPosition;
    buttonOrder = settingsHandler.buttonOrder;
    galleryScrollDirection = settingsHandler.galleryScrollDirection;
    zoomButtonPosition = settingsHandler.zoomButtonPosition;
    autoPlay = settingsHandler.autoPlayEnabled;
    useVolumeButtonsForScroll = settingsHandler.useVolumeButtonsForScroll;
    scrollSpeedController.text = settingsHandler.volumeButtonsScrollSpeed.toString();
    galleryAutoScrollController.text = settingsHandler.galleryAutoScrollTime.toString();
    preloadController.text = settingsHandler.preloadCount.toString();
    shitDevice = settingsHandler.shitDevice;
    disableVideo = settingsHandler.disableVideo;
    loadingGif = settingsHandler.loadingGif;
    super.initState();
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.autoHideImageBar = autoHideImageBar;
    settingsHandler.galleryMode = galleryMode;
    settingsHandler.galleryBarPosition = galleryBarPosition;
    settingsHandler.buttonOrder = buttonOrder!;
    settingsHandler.galleryScrollDirection = galleryScrollDirection;
    settingsHandler.zoomButtonPosition = zoomButtonPosition;
    settingsHandler.autoPlayEnabled = autoPlay;
    settingsHandler.loadingGif = loadingGif;
    settingsHandler.shitDevice = shitDevice;
    settingsHandler.disableVideo = disableVideo;
    settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    if (int.parse(scrollSpeedController.text) < 100){
      scrollSpeedController.text = "100";
    }
    if (int.parse(galleryAutoScrollController.text) < 800){
      galleryAutoScrollController.text = "800";
    }
    settingsHandler.volumeButtonsScrollSpeed = int.parse(scrollSpeedController.text);
    settingsHandler.galleryAutoScrollTime = int.parse(galleryAutoScrollController.text);
    if (int.parse(preloadController.text) < 0){
      preloadController.text = 0.toString();
    }
    settingsHandler.preloadCount = int.parse(preloadController.text);
    // Set settingshandler values here
    bool result = await settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color oddItemColor = theme.colorScheme.secondary.withOpacity(0.25);
    final Color evenItemColor = theme.colorScheme.secondary.withOpacity(0.15);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: preloadController,
                title: 'Gallery View Preload',
                hintText: "Images to preload",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if(parse > 4) {
                    return 'Please enter a value less than 5';
                  } else {
                    return null;
                  }
                }
              ),
              SettingsDropdown(
                selected: galleryMode,
                values: settingsHandler.map['galleryMode']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    galleryMode = newValue ?? settingsHandler.map['galleryMode']?['default'];
                  });
                },
                title: 'Gallery Quality',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
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
              ),
              SettingsDropdown(
                selected: galleryScrollDirection,
                values: settingsHandler.map['galleryScrollDirection']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    galleryScrollDirection = newValue ?? settingsHandler.map['galleryScrollDirection']?['default'];
                  });
                },
                title: 'Gallery Scroll Direction',
              ),
              SettingsDropdown(
                selected: galleryBarPosition,
                values: settingsHandler.map['galleryBarPosition']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    galleryBarPosition = newValue ?? settingsHandler.map['galleryBarPosition']?['default'];
                  });
                },
                title: 'Gallery Bar Position',
              ),
              SettingsDropdown(
                selected: zoomButtonPosition,
                values: settingsHandler.map['zoomButtonPosition']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    zoomButtonPosition = newValue ?? settingsHandler.map['zoomButtonPosition']?['default'];
                  });
                },
                title: 'Zoom Button Position',
              ),
              SettingsToggle(
                value: autoHideImageBar,
                onChanged: (newValue) {
                  setState(() {
                    autoHideImageBar = newValue;
                  });
                },
                title: 'Auto Hide Gallery Bar',
              ),



              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Column(
                    children: [
                        SettingsButton(
                          name: 'Toolbar Buttons Order',
                          drawBottomBorder: false,
                          trailingIcon: IconButton(
                            icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                            onPressed: () {
                              Get.dialog(
                                  InfoDialog("Buttons Order",
                                    [
                                      Text("Long press to change item order."),
                                      Text("First 4 buttons from this list will be always visible on Toolbar."),
                                      Text("Other buttons will be in overflow (three dots) menu."),
                                    ],
                                    CrossAxisAlignment.start,
                                  )
                              );
                            },
                        )
                      ),
                      ReorderableListView(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for (int index = 0; index < buttonOrder!.length; index++)
                            ListTile(
                              onTap: () {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    "Long Press to move items",
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  leadingIcon: Icons.warning_amber,
                                  leadingIconColor: Colors.yellow,
                                  sideColor: Colors.yellow,
                                );
                              },
                              key: Key('$index'),
                              tileColor: index.isOdd ? oddItemColor : evenItemColor,
                              title: Text('${buttonOrder![index][1]}'),
                              trailing: Icon(Icons.menu),
                            ),
                        ],
                        onReorder: (int oldIndex, int newIndex) {
                          setState(() {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            final List<String> item = buttonOrder!.removeAt(oldIndex);
                            buttonOrder!.insert(newIndex, item);
                          });
                        },
                      )
                    ]
                  )
              ),


              SettingsToggle(
                value: disableVideo,
                onChanged: (newValue) {
                  setState(() {
                    disableVideo = newValue;
                  });
                },
                title: 'Disable Video',
                drawTopBorder: true, // instead of border in reorder list
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
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
              ),
              SettingsToggle(
                value: autoPlay,
                onChanged: (newValue) {
                  setState(() {
                    autoPlay = newValue;
                  });
                },
                title: 'Video Auto Play',
              ),


              // TODO rework into loading element variant (small, verbose, gif...)
              // TODO ...or remove completely, this gif is like 20% of the app's size
              SettingsToggle(
                value: loadingGif,
                onChanged: (newValue) {
                  setState(() {
                    loadingGif = newValue;
                  });
                },
                title: 'Kanna loading Gif',
              ),
              SettingsToggle(
                value: shitDevice,
                onChanged: (newValue) {
                  setState(() {
                    shitDevice = newValue;
                    if (shitDevice){
                      preloadController.text = "0";
                      galleryMode = "Sample";
                      autoPlay = false;
                      // TODO set thumbnails quality to low?
                    }
                  });
                },
                title: 'Low Performance Mode',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    Get.dialog(
                        InfoDialog("Low Performance Mode",
                          [
                            Text(" - Recommended for old devices and devices with RAM < 2GB"),
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
              ),
              //////////////////////////////////////////


              SettingsToggle(
                value: useVolumeButtonsForScroll,
                onChanged: (newValue) {
                  setState(() {
                    useVolumeButtonsForScroll = newValue;
                  });
                },
                title: 'Use Volume Buttons for Scrolling',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
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
              ),
              SettingsTextInput(
                controller: scrollSpeedController,
                title: 'Buttons Scroll Speed',
                hintText: "Scroll Speed",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if(parse < 100) {
                    return 'Please enter a value bigger than 100';
                  } else {
                    return null;
                  }
                }
              ),
              SettingsTextInput(
                controller: scrollSpeedController,
                title: 'Auto Scroll Timeout (ms)',
                hintText: "Auto Scroll Timeout",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else {
                    return null;
                  }
                },
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    Get.dialog(
                        InfoDialog("AutoScroll / Slideshow",
                          [
                            Text("[WIP] Videos and gifs must be scrolled manually for now"),
                          ],
                          CrossAxisAlignment.start,
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
