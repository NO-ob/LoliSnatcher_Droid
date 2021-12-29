import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';

class ThumbBuild extends StatelessWidget {
  final int index;
  final int columnCount;
  final SearchGlobal searchGlobal;

  ThumbBuild(this.index, this.columnCount, this.searchGlobal, {Key? key}) : super(key: key);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  @override
  Widget build(BuildContext context) {
    BooruItem item = searchGlobal.booruHandler.filteredFetched[index];
    IconData itemIcon = ViewUtils.getFileIcon(item.mediaType);

    List<List<String>> parsedTags = settingsHandler.parseTagsList(item.tagsList, isCapped: false);
    bool isHated = parsedTags[0].length > 0;
    bool isLoved = parsedTags[1].length > 0;
    bool isSound = parsedTags[2].length > 0;
    bool isNoted = item.hasNotes == true;
    
    // reset the isHated value since we already check for it on every render
    item.isHated.value = isHated;

    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        alignment: settingsHandler.previewDisplay == "Square" ? Alignment.center : Alignment.bottomCenter,
        children: [
          CachedThumbBetter(item, index, searchGlobal, columnCount, true),
          // Image(
          //   image: ResizeImage(NetworkImage(item.thumbnailURL), width: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio / 3).round()),
          //   fit: BoxFit.cover,
          //   isAntiAlias: true,
          //   filterQuality: FilterQuality.medium,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // reserved for elements on the left side
                const SizedBox(),

                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.66),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                  ),
                  child: Obx(() =>  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text('  ${(index + 1)}  ', style: TextStyle(fontSize: 10, color: Colors.white)),

                      if(item.isFavourite.value == null)
                        Text('.'),

                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 200),
                        crossFadeState: (item.isFavourite.value == true || isLoved) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        firstChild: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: Icon(
                            item.isFavourite.value == true ? Icons.favorite : Icons.star,
                            color: item.isFavourite.value == true ? Colors.red : Colors.grey,
                            key: ValueKey<Color>(item.isFavourite.value == true ? Colors.red : Colors.grey),
                            size: 14,
                          )
                        ),
                        secondChild: const SizedBox(),
                      ),

                      if(item.isSnatched.value == true)
                        Icon(
                          Icons.save_alt,
                          color: Colors.white,
                          size: 14,
                        ),

                      if(isSound)
                        Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                          size: 14,
                        ),

                      if(isNoted)
                        Icon(
                          Icons.note_add,
                          color: Colors.white,
                          size: 14,
                        ),

                      Icon(
                        itemIcon,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  )),
                ),
              ]
            )
          )
        ]
      )
    );
  }
}