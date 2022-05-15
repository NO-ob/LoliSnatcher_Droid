import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/libBooru/Tag.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';

class UntypedCollection {
  final List<String> tags;
  final int cooldown;
  final Booru booru;
  UntypedCollection(this.tags, this.cooldown, this.booru);
}

class TagHandler extends GetxController{
  Map<String,Tag> _tagMap = {};
  SettingsHandler settingsHandler;
  RxList<UntypedCollection> untypedQueue = RxList<UntypedCollection>([]);
  RxBool tagFetchActive = false.obs;

  TagHandler (this.settingsHandler){
    untypedQueue.listen((List<UntypedCollection> list) {
      tryGetTagTypes();
    });
  }

  bool hasTag(String tagString){
    if (_tagMap.containsKey(tagString)) {
      return true;
    }
    return false;
  }

  Tag getTag(String tagString){
    Tag? tag;
    if (hasTag(tagString)) {
      tag = _tagMap[tagString];
    }
    tag ??= Tag(tagString,tagString,TagType.none);
    return tag;
  }

  void putTag(Tag tag){
    _tagMap[tag.fullString] = tag;
  }

  void tryGetTagTypes() {
    if (!tagFetchActive.value) {
      if (untypedQueue.isNotEmpty) {
        getTagTypes(untypedQueue.removeLast());
      }
    }
  }

  Future getTagTypes(UntypedCollection untyped) async {
    Logger.Inst().log("Snatching tags: ${untyped.tags}", "TagHandler", "getTagTypes", LogTypes.tagHandlerInfo);
    tagFetchActive.value = true;
    List temp = BooruHandlerFactory().getBooruHandler([untyped.booru], null);
    BooruHandler booruHandler = temp[0];
    int tagCounter = 0;
    do {
      List<String> workingTags = [];
      int tagMax = (untyped.tags.length > 30) ? 100 : untyped.tags.length;

      for (int i = tagMax - 1; i > 0; i--){
        if (untyped.tags.isNotEmpty){
          String tag = untyped.tags.removeLast();
          if (!hasTag(tag) && !workingTags.contains(tag)){
            workingTags.add(tag);
            print("adding $tag");
          }
        }
      }
      if (workingTags.isNotEmpty){
        await Future.delayed(Duration(milliseconds: untyped.cooldown), () async{
          List<Tag> newTags = await booruHandler.genTagObjects(workingTags);
          for (int i = 0; i < newTags.length; i++){
            putTag(newTags[i]);
            //TODO write tag to database
            tagCounter ++;
          }
        });
      }
    } while (untyped.tags.isNotEmpty);
    Logger.Inst().log("Got $tagCounter tag types, untyped list length was: ${untyped.tags.length}", "TagHandler", "getTagTypes", LogTypes.tagHandlerInfo);
    tagFetchActive.value = false;
    tryGetTagTypes();
  }

  void addTagsWithType(List<String> tags, TagType type) async {
    for(int i = 0; i < tags.length; i++){
      if (!hasTag(tags[i])){
        putTag(Tag(tags[i],tags[i],type));
      } else if (type != TagType.none){
        if (getTag(tags[i]).tagType == TagType.none){
          putTag(Tag(tags[i],tags[i],type));
        }
      }
    }
  }

  void queue(List<String> untypedTags, Booru booru, int cooldown) {
    Logger.Inst().log("Added ${untypedTags.length} tags to queue from ${booru.name}", "TagHandler", "queue", LogTypes.tagHandlerInfo);
    if (untypedTags.isNotEmpty) {
      untypedQueue.add(UntypedCollection(untypedTags, cooldown, booru));
    }
  }

  Future<void> initialize() async {
      if (settingsHandler.path.isNotEmpty){
        await loadTags();
      }
      return;
  }
  Future<bool> checkForTagsFile() async {
    File tagFile = File(settingsHandler.path + "tags.json");
    return await tagFile.exists();
  }

  Future<void> loadTagsFile() async {
    File tagFile = File(settingsHandler.path + "tags.json");
    String settings = await tagFile.readAsString();
    // print('loadJSON $settings');
    loadFromJSON(settings);
    return;
  }

  Future<bool> loadTags() async {
      //TODO load tags from database
      if(await checkForTagsFile()) {
        await loadTagsFile();
      }
      return true;
  }

  Future<bool> loadFromJSON(String jsonString) async {
    List<Tag> tagList = (json.decode(jsonString) as List)
        .map((tagData) => Tag.fromJson(tagData))
        .toList();
    Logger.Inst().log("TagHandler got tags: ${tagList.length}", "TagHandler", "loadFromJSON", LogTypes.tagHandlerInfo);
    for (int i = 0; i < tagList.length; i++){
      _tagMap[tagList[i].fullString] = tagList[i];
    }
    return true;
  }

  List<Tag> toList(){
    List<Tag> tagList = [];
    _tagMap.forEach((key,value) => tagList.add(value));
    return tagList;
  }

  Future<bool> saveTags() async {
    await getPerms();
    if (settingsHandler.path == "") await settingsHandler.setConfigDir();
    await Directory(settingsHandler.path).create(recursive:true);
    File settingsFile = File(settingsHandler.path + "tags.json");
    var writer = settingsFile.openWrite();
    writer.write(jsonEncode(toList()));
    writer.close();
    return true;
  }
}

