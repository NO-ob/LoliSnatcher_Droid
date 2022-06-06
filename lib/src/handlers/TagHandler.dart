import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/src/handlers/BooruHandler.dart';
import 'package:LoliSnatcher/src/handlers/BooruHandlerFactory.dart';
// import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/src/data/Tag.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';

class UntypedCollection {
  final List<String> tags;
  final int cooldown;
  final Booru booru;
  UntypedCollection(this.tags, this.cooldown, this.booru);
}

class TagHandler extends GetxController {
  static TagHandler get instance => Get.find<TagHandler>();


  final Map<String, Tag> _tagMap = {};
  Map<String, Tag> get tagMap => _tagMap;

  RxList<UntypedCollection> untypedQueue = RxList<UntypedCollection>([]);
  RxBool tagFetchActive = false.obs;

  TagHandler (){
    untypedQueue.listen((List<UntypedCollection> list) {
      tryGetTagTypes();
    });
  }

  bool hasTag(String tagString){
    return _tagMap.containsKey(tagString);
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
    while (untyped.tags.isNotEmpty) {
      List<String> workingTags = [];
      int tagMaxLimit = 100;
      int tagMax = (untyped.tags.length > tagMaxLimit) ? tagMaxLimit : untyped.tags.length;

      for (int i = 0; i < tagMax; i++) {
        if (untyped.tags.isNotEmpty){
          String tag = untyped.tags.removeLast();
          if (!hasTag(tag) && !workingTags.contains(tag)){
            workingTags.add(tag);
            // print("adding $tag");
          }
        }
      }

      if (workingTags.isNotEmpty){
        List<Tag> newTags = await booruHandler.genTagObjects(workingTags);
        for (Tag tag in newTags) {
          putTag(tag);
          //TODO write tag to database
          tagCounter ++;
        }
        await Future.delayed(Duration(milliseconds: untyped.cooldown), () async{});
      }
    }
    Logger.Inst().log("Got $tagCounter tag types, untyped list length was: ${untyped.tags.length}", "TagHandler", "getTagTypes", LogTypes.tagHandlerInfo);
    tagFetchActive.value = false;
    tryGetTagTypes();
  }

  void addTagsWithType(List<String> tags, TagType type) async {
    for(String tag in tags){
      if (!hasTag(tag)){
        putTag(Tag(tag, tag,type));
      } else if (type != TagType.none){
        if (getTag(tag).tagType == TagType.none){
          putTag(Tag(tag, tag, type));
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
      if (SettingsHandler.instance.path.isNotEmpty){
        await loadTags();
      }
      return;
  }
  Future<bool> checkForTagsFile() async {
    File tagFile = File("${SettingsHandler.instance.path}tags.json");
    return await tagFile.exists();
  }

  Future<void> loadTagsFile() async {
    File tagFile = File("${SettingsHandler.instance.path}tags.json");
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

  void removeTag(Tag tag){
    _tagMap.remove(tag.fullString);
  }

  Future<bool> saveTags() async {
    SettingsHandler settings = SettingsHandler.instance;
    await getPerms();
    if (settings.path == "") await settings.setConfigDir();
    await Directory(settings.path).create(recursive:true);
    File settingsFile = File("${settings.path}tags.json");
    var writer = settingsFile.openWrite();
    writer.write(jsonEncode(toList()));
    writer.close();
    return true;
  }
}

