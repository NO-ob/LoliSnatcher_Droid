import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';

class TagChip extends StatelessWidget {

  TagChip({
    Key? key,
    this.tagString = "",
    required this.gestureDetector
  }) : super(key: key);

  final String tagString;
  final GestureDetector gestureDetector;
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  Widget getTagPin(String content){
    return Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white
        ),
        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
        child:Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.purple,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    String stringContent = tagString;
    List<Widget> tagPins = [];

    if (stringContent.startsWith(RegExp(r"\d+#"))) {
      print("matched int#");
      String multiIndex = stringContent.split("#")[0];
      stringContent = stringContent.split("#")[1];
      tagPins.add(getTagPin(multiIndex));
    }

    Map<String,String> modifierMap = searchHandler.currentBooruHandler.tagModifierMap;

    modifierMap.forEach((modifier, displayValue) {
      if(stringContent.startsWith(modifier)){
        stringContent = stringContent.replaceFirst(modifier, "");
        tagPins.add(getTagPin(displayValue));
      }
    });

    final bool isExclude = stringContent.startsWith('-');
    if(isExclude) {
      stringContent = stringContent.substring(1);
    }


    return Container(
      decoration: BoxDecoration(
        color: isExclude ? Get.theme.colorScheme.error : Colors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 0, 3),
              child: Row(
                children: tagPins + [
                  Text(
                    stringContent,
                    style: TextStyle(
                      fontSize: 16,
                      color: isExclude ? Get.theme.colorScheme.onError : Colors.white,
                    ),
                  ),
                ],
              )
          ),
        gestureDetector,
      ]
      ),
    );
  }
}