import 'package:flutter/cupertino.dart';

import 'libBooru/BooruHandler.dart';
import 'libBooru/Booru.dart';
import 'libBooru/BooruItem.dart';
import 'package:get/get.dart';


class SearchGlobals{
  String tags = "";
  Booru selectedBooru;
  int pageNum = 0;
  double scrollPosition = 0;
  BooruHandler booruHandler;
  String handlerType;
  ValueNotifier addTag = ValueNotifier("");
  ValueNotifier newTab = ValueNotifier("noListener");
  List selected = new List();
  SearchGlobals(this.selectedBooru,this.tags);
  @override
  String toString() {
    return ("tags: $tags selectedBooru: ${selectedBooru.toString()} pageNum: $pageNum booruHandler: $booruHandler handlerType: $handlerType");
  }
  List<BooruItem> getSelected(){
    List<BooruItem> selectedItems = new List();
    for (int i=0; i < selected.length; i++){
      print(booruHandler.fetched.elementAt(selected[i]));
      selectedItems.add(booruHandler.fetched.elementAt(selected[i]));
    }
    return selectedItems;
  }
}
