import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

class TabBox extends StatefulWidget {
  TabBox();
  @override
  _TabBoxState createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = Get.find();

    return Obx(() {
      List<SearchGlobal> list = searchHandler.list;
      int index = searchHandler.index.value;

      if(list.length == 0) {
        return Text('Add Boorus in Settings');
      }

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
                  color: Get.theme.canvasColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Get.theme.backgroundColor,
                    width: 1,
                  ),
                ),
                child: DropdownButton<SearchGlobal>(
                  isExpanded: true,
                  value: list[index],
                  icon: Icon(Icons.arrow_downward),
                  underline: const SizedBox(),
                  dropdownColor: Get.theme.cardColor,
                  onChanged: (SearchGlobal? newValue){
                    // searchHandler.searchTextController.text = newValue?.tags ?? ''; // set search box text anyway
                    if (newValue != null && list.indexOf(newValue) != index){
                      // ...but change tab only if it exists(?) and if it's not a current one
                      searchHandler.changeTabIndex(list.indexOf(newValue));
                    }
                  },
                  onTap: (){
                    // setState(() { });
                  },
                  items: list.map<DropdownMenuItem<SearchGlobal>>((SearchGlobal value){
                    bool isCurrent = list.indexOf(value) == index;
                    bool isNotEmptyBooru = value.selectedBooru.value.faviconURL != null;

                    // print(value.tags);
                    int? totalCount = value.booruHandler.totalCount.value;
                    String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
                    String tagText = "${value.tags == "" ? "[No Tags]" : value.tags}$totalCountText";

                    return DropdownMenuItem<SearchGlobal>(
                      value: value,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: isCurrent
                        ? BoxDecoration(
                          border: Border.all(color: Get.theme.accentColor, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        )
                        : null,
                        child: Row(
                          children: [
                            isNotEmptyBooru
                              ? (value.selectedBooru.value.type == "Favourites"
                                ? Icon(Icons.favorite, color: Colors.red, size: 18)
                                : CachedFavicon(value.selectedBooru.value.faviconURL!)
                              )
                              : Icon(CupertinoIcons.question, size: 18),
                            const SizedBox(width: 3),
                            // Expanded(child: ScrollingText(tagText, 22, "infiniteWithPause", value.tags == "" ? Colors.grey : Colors.white)),
                            MarqueeText(
                              text: tagText,
                              fontSize: 16,
                              color: value.tags == "" ? Colors.grey : null,
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
    });
  }
}
