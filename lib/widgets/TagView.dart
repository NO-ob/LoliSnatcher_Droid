import 'package:intl/intl.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/Tools.dart';

class TagView extends StatefulWidget {
  BooruItem booruItem;
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  TagView(this.booruItem, this.searchGlobals, this.settingsHandler);
  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  List<List<String>> hatedAndLovedTags = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    hatedAndLovedTags = widget.settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: false);
  }

  Widget infoBuild() {
    final String fileName = Tools.getFileName(widget.booruItem.fileURL);
    final String fileRes = (widget.booruItem.fileWidth != null && widget.booruItem.fileHeight != null) ? '${widget.booruItem.fileWidth?.toInt() ?? ''}x${widget.booruItem.fileHeight?.toInt() ?? ''}' : '';
    final String fileSize = widget.booruItem.fileSize != null ? Tools.formatBytes(widget.booruItem.fileSize!, 2) : '';
    final String hasNotes = widget.booruItem.hasNotes != null ? widget.booruItem.hasNotes.toString() : '';
    final String itemId = widget.booruItem.serverId ?? '';
    final String rating = widget.booruItem.rating ?? '';
    final String score = widget.booruItem.score ?? '';
    final List<String> sources = widget.booruItem.sources ?? []; //TODO
    String postDate = widget.booruItem.postDate ?? '';
    final String postDateFormat = widget.booruItem.postDateFormat ?? '';
    String formattedDate = '';
    if(postDate.isNotEmpty && postDateFormat.isNotEmpty) {
      try {
        // no timezone support in DateFormat? see: https://stackoverflow.com/questions/56189407/dart-parse-date-timezone-gives-unimplementederror/56190055
        // remove timezones from strings until they fix it
        DateTime parsedDate;
        if(postDateFormat == "unix"){
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(postDate) * 1000);
        } else {
          postDate = postDate.replaceAll(new RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateFormat(postDateFormat).parseLoose(postDate).toLocal();
        }
        // print(postDate);
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
      } catch(e) {
        print('$postDate $postDateFormat');
        print(e);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // infoText('Filename', fileName),
        infoText('ID', itemId),
        infoText('Rating', rating),
        infoText('Score', score),
        infoText('Resolution', fileRes),
        infoText('Size', fileSize),
        infoText('Has Notes', hasNotes, canCopy: false),
        infoText('Posted', formattedDate),
        sourcesList(sources),
        Divider(height: 10, thickness: 2, color: Colors.grey),
        infoText('Tags', ' ', canCopy: false),
      ]
    );
  }

  Widget sourcesList(List<String> sources) {
    sources = sources.where((link) => link.trim().isNotEmpty).toList();
    if(sources.isNotEmpty) {
      return Container(
        padding: EdgeInsets.only(left: 5),
        child: Column(
          children: [
            Divider(height: 10, thickness: 2, color: Colors.grey),
            infoText(sources.length == 1 ? 'Source' : 'Sources', ' ', canCopy: false),
            Column(children: 
              sources.map((link) => TextButton(
                onPressed: () {
                  ServiceHandler.launchURL(link);
                },
                child: Text(link, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))
              )).toList()
            )
          ],
        )
      );
    } else {
      return const SizedBox();
    }
  }

  Widget infoText(String title, String data, {bool canCopy = true}) {
    if(data.isNotEmpty) {
      return Container(
        padding: EdgeInsets.only(left: 5),
        child: TextButton(
          onPressed: () {
            if(canCopy) {
              Clipboard.setData(new ClipboardData(text: data));
              ServiceHandler.displayToast('Copied $title to clipboard!');
            }
          },
          child: Row(children: [
            Text('$title: ', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900)),
            Expanded(child: Text(data, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
          ])
        )
      );
    } else {
      return const SizedBox();
    }
  }

  Widget tagsBuild() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), // required to allow singlechildscrollview to take control of scrolling
      shrinkWrap: true,
      itemCount: widget.booruItem.tagsList.length,
      itemBuilder: (BuildContext context, int index) {
        String currentTag = widget.booruItem.tagsList[index];

        bool isHated = hatedAndLovedTags[0].contains(currentTag);
        bool isLoved = hatedAndLovedTags[1].contains(currentTag);
        bool isSound = hatedAndLovedTags[2].contains(currentTag);

        List<dynamic> tagIconAndColor = [];
        if (isSound) tagIconAndColor.add([Icons.volume_up_rounded, Colors.white]);
        if (isHated) tagIconAndColor.add([CupertinoIcons.eye_slash, Colors.red]);
        if (isLoved) tagIconAndColor.add([Icons.star, Colors.yellow]);

        if (currentTag != '') {
          return Column(children: <Widget>[
            Row(
              children: [
                const SizedBox(width: 5),
                if(tagIconAndColor.length > 0)
                  ...[
                    ...tagIconAndColor.map((t) => Icon(t[0], color: t[1])),
                    const SizedBox(width: 5),
                  ],

                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    onLongPress: () {
                      Clipboard.setData(new ClipboardData(text: currentTag));
                      ServiceHandler.displayToast('"${currentTag}" copied to clipboard!');
                    },
                    child: MarqueeText(
                      text: currentTag,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      startPadding: 0,
                      isExpanded: false,
                    )
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Get.context!.theme.accentColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.searchGlobals.selectedBooru!.type == "Hydrus"){
                        widget.searchGlobals.addTag.value = ", " + currentTag;
                      } else {
                        widget.searchGlobals.addTag.value = " " + currentTag;
                      }
                    });
                    ServiceHandler.displayToast("Added to search:\n"+ currentTag);
                    //Get.snackbar("Added to search", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.fiber_new,
                      color: Get.context!.theme.accentColor),
                  onPressed: () {
                    setState(() {
                      widget.searchGlobals.newTab.value = currentTag;
                    });
                    ServiceHandler.displayToast("Added new tab:\n" + currentTag);
                    //Get.snackbar("Added new tab", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 2,
            ),
          ]);
        } else {
          // Render nothing if currentTag is an empty string
          return const SizedBox();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Scrollbar(
        controller: scrollController,
        interactive: false,
        thickness: 4,
        radius: Radius.circular(10),
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              infoBuild(),
              tagsBuild(),
            ]
          )
        )
      )
    );
  }
}
