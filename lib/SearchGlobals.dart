import 'package:flutter/cupertino.dart';

import 'libBooru/BooruHandler.dart';
import 'libBooru/Booru.dart';
import 'package:get/get.dart';


class SearchGlobals{
  String tags = "";
  Booru selectedBooru;
  int pageNum = 0;
  double scrollPosition = 0;
  BooruHandler booruHandler;
  String handlerType;
  ValueNotifier newTab = ValueNotifier("noListener");
  SearchGlobals(this.selectedBooru,this.tags);
}
