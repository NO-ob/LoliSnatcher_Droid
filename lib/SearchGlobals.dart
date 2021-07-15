import 'package:flutter/cupertino.dart';

import 'libBooru/BooruHandler.dart';
import 'libBooru/Booru.dart';
import 'libBooru/BooruItem.dart';
import 'package:get/get.dart';


class SearchGlobals{
  String tags = "";
  Booru? selectedBooru;
  Booru? secondaryBooru;
  int pageNum = 0;
  double scrollPosition = 0;
  BooruHandler? booruHandler;
  String? handlerType;
  ValueNotifier<String?> addTag = ValueNotifier("");
  ValueNotifier<String?> removeTab = ValueNotifier("");
  ValueNotifier<String?> newTab = ValueNotifier("noListener");
  ValueNotifier<bool> displayAppbar = ValueNotifier(true);
  ValueNotifier<int> viewedIndex = ValueNotifier(0);
  ValueNotifier<BooruItem> currentItem = ValueNotifier(new BooruItem(
    fileURL: "",
    sampleURL: "",
    thumbnailURL: "",
    tagsList: [],
    postURL: ""
  ));
  List selected = [];
  SearchGlobals(this.selectedBooru,this.tags);
  @override
  String toString() {
    return ("tags: $tags selectedBooru: ${selectedBooru.toString()} pageNum: $pageNum booruHandler: $booruHandler handlerType: $handlerType");
  }
  List<BooruItem> getSelected(){
    List<BooruItem>? selectedItems = [];
    for (int i=0; i < selected.length; i++){
      selectedItems.add(booruHandler!.fetched.elementAt(selected[i]));
    }
    return selectedItems;
  }
}
