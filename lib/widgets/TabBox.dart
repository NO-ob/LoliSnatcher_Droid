import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ScrollingText.dart';

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
              constraints: BoxConstraints(maxHeight: 30,minHeight: 20, minWidth: 100),
              padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
              decoration: BoxDecoration(
                color: Get.context!.theme.canvasColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Get.context!.theme.accentColor,
                  width: 1,
                ),
              ),
              child: DropdownButton<SearchGlobals>(
                underline: Container(height: 0,),
                isExpanded: true,
                value: widget.searchGlobals[widget.globalsIndex],
                icon: Icon(Icons.arrow_downward),
                onChanged: (SearchGlobals? newValue){
                  setState(() {
                    //widget.globalsIndex = widget.searchGlobals.indexOf(newValue!);
                    if (newValue != null){
                      widget.searchTagsController.text = newValue.tags!;
                      widget.setParentGlobalsIndex(widget.searchGlobals.indexOf(newValue));
                    }
                  });
                },
                onTap: (){
                  // setState(() { });
                },
                items: widget.searchGlobals.map<DropdownMenuItem<SearchGlobals>>((SearchGlobals value){
                  bool isNotEmptyBooru = value.selectedBooru != null && value.selectedBooru!.faviconURL != null;
                  print(value.tags);
                  String tagText = "${value.tags == "" ? "[No Tags]" : value.tags}";
                  return DropdownMenuItem<SearchGlobals>(
                    value: value,
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
                          Expanded(child: ScrollingText(tagText, 15, "infiniteWithPause", value.tags == "" ? Colors.grey : Colors.white)),
                        ]
                    ),
                  );
                }).toList(),
              ),
            ),
          ),


          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Get.context!.theme.accentColor,),
            onPressed: () {
              // add a new search global to the list
              setState((){
                widget.searchGlobals.add(new SearchGlobals(widget.searchGlobals[widget.globalsIndex].selectedBooru, widget.settingsHandler.defTags)); // Set selected booru
                // searchGlobals.add(new SearchGlobals(null, widget.settingsHandler.defTags)); // Set empty booru
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: Get.context!.theme.accentColor),
            onPressed: () {
              // Remove selected searchglobal from list and apply nearest to search bar
              setState((){
                if(widget.globalsIndex == widget.searchGlobals.length - 1 && widget.searchGlobals.length > 1){
                  widget.globalsIndex --;
                  widget.searchTagsController.text = widget.searchGlobals[widget.globalsIndex].tags!;
                  widget.searchGlobals.removeAt(widget.globalsIndex + 1);
                } else if (widget.searchGlobals.length > 1){
                  widget.searchTagsController.text = widget.searchGlobals[widget.globalsIndex + 1].tags!;
                  widget.searchGlobals.removeAt(widget.globalsIndex);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
