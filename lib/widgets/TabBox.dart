import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/ScrollingText.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

class TabBox extends StatefulWidget {
  List<SearchGlobals> searchGlobals;
  int globalsIndex;
  TextEditingController searchTagsController;
  SettingsHandler settingsHandler;
  final Function setParentGlobalsIndex;
  TabBox(this.searchGlobals,this.globalsIndex,this.searchTagsController,this.settingsHandler,this.setParentGlobalsIndex);
  @override
  _TabBoxState createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxHeight: 40, minHeight: 20, minWidth: 100),
              padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
              decoration: BoxDecoration(
                color: Get.context!.theme.canvasColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Get.context!.theme.backgroundColor,
                  width: 1,
                ),
              ),
              child: DropdownButton<SearchGlobals>(
                isExpanded: true,
                value: widget.searchGlobals[widget.globalsIndex],
                icon: Icon(Icons.arrow_downward),
                underline: const SizedBox(),
                dropdownColor: Get.context!.theme.colorScheme.surface,
                onChanged: (SearchGlobals? newValue){
                  widget.searchTagsController.text = newValue?.tags ?? ''; // set search box text anyway
                  if (newValue != null && widget.searchGlobals.indexOf(newValue) != widget.globalsIndex){
                    // ...but change tab only if it exists(?) and if it's not a current one
                    setState(() {
                      //widget.globalsIndex = widget.searchGlobals.indexOf(newValue!);
                      widget.setParentGlobalsIndex(widget.searchGlobals.indexOf(newValue), null);
                    });
                  }
                },
                onTap: (){
                  // setState(() { });
                },
                items: widget.searchGlobals.map<DropdownMenuItem<SearchGlobals>>((SearchGlobals value){
                  bool isCurrent = widget.searchGlobals.indexOf(value) == widget.globalsIndex;
                  bool isNotEmptyBooru = value.selectedBooru != null && value.selectedBooru!.faviconURL != null;

                  // print(value.tags);
                  int? totalCount = value.booruHandler?.totalCount;
                  String totalCountText = (totalCount != null && totalCount > 0) ? " (${totalCount})" : "";
                  String tagText = "${value.tags == "" ? "[No Tags]" : value.tags}${totalCountText}";

                  return DropdownMenuItem<SearchGlobals>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: isCurrent
                      ? BoxDecoration(
                        border: Border.all(color: Get.context!.theme.accentColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )
                      : null,
                      child: Row(
                        children: [
                          isNotEmptyBooru
                            ? (value.selectedBooru!.type == "Favourites"
                              ? Icon(Icons.favorite, color: Colors.red, size: 18)
                              : Image.network(
                                value.selectedBooru!.faviconURL!,
                                width: 16,
                                errorBuilder: (_, __, ___) {
                                  return Icon(Icons.broken_image, size: 18);
                                }
                              )
                            )
                            : Icon(CupertinoIcons.question, size: 18),
                          const SizedBox(width: 3),
                          // Expanded(child: ScrollingText(tagText, 22, "infiniteWithPause", value.tags == "" ? Colors.grey : Colors.white)),
                          MarqueeText(
                            text: tagText,
                            fontSize: 16,
                            color: value.tags == "" ? Colors.grey : Colors.white,
                            startPadding: 5,
                          ),
                        ]
                      )
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      )
    );
  }
}
