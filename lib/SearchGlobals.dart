import 'libBooru/BooruHandler.dart';
import 'libBooru/Booru.dart';



class SearchGlobals{
  String tags = "rating:safe";
  Booru selectedBooru;
  int pageNum = 0;
  double scrollPosition = 0;
  BooruHandler booruHandler;
  String handlerType;

}