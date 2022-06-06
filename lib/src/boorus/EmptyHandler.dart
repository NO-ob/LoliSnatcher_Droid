import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';

class EmptyHandler extends BooruHandler {
  // Dart constructors are weird so it has to call super with the args
  EmptyHandler(Booru booru, int limit) : super(booru, limit);
}
