import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
// import 'package:lolisnatcher/libBooru/DBHandler.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class UntypedCollection {
  UntypedCollection(this.tags, this.cooldown, this.booru);
  final List<String> tags;
  final int cooldown;
  final Booru booru;
}

class TagHandler extends GetxController {
  static TagHandler get instance => Get.find<TagHandler>();

  int prevLength = 0;
  final Map<String, Tag> _tagMap = {};
  Map<String, Tag> get tagMap => _tagMap;

  RxList<UntypedCollection> untypedQueue = RxList<UntypedCollection>([]);
  RxBool tagFetchActive = false.obs;
  bool tagSaveActive = false;
  TagHandler() {
    untypedQueue.listen((List<UntypedCollection> list) {
      tryGetTagTypes();
    });
  }

  bool hasTag(String tagString) {
    return _tagMap.containsKey(tagString);
  }

  /// Check if tag is in the tag map and if it is - check if it is not outdated/stale
  bool hasTagAndNotStale(String tagString, {int staleTime = Constants.tagStaleTime}) {
    if (hasTag(tagString)) {
      final bool isNotStale = _tagMap[tagString]!.updatedAt >= (DateTime.now().millisecondsSinceEpoch - staleTime);
      return isNotStale;
    } else {
      return false;
    }
  }

  Tag getTag(String tagString) {
    Tag? tag;
    if (hasTag(tagString)) {
      tag = _tagMap[tagString];
    }
    tag ??= Tag(tagString, tagType: TagType.none);
    return tag;
  }

  Future<void> putTag(Tag tag, {bool useDB = true}) async{
    // TODO sanitize tagString?
    if(tag.fullString.isEmpty) {
      return;
    }

    _tagMap[tag.fullString] = tag;

    if (SettingsHandler.instance.dbEnabled && useDB){
      await SettingsHandler.instance.dbHandler.updateTagsFromObjects([tag]);
    }
    return;
  }

  void tryGetTagTypes() {
    if (!tagFetchActive.value) {
      if (untypedQueue.isNotEmpty) {
        getTagTypes(untypedQueue.removeLast());
      }
    }
  }

  Future getTagTypes(UntypedCollection untyped) async {
    if (SettingsHandler.instance.tagTypeFetchEnabled){
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
          if (untyped.tags.isNotEmpty) {
            String tag = untyped.tags.removeLast();
            if (!hasTagAndNotStale(tag) && !workingTags.contains(tag)) {
              workingTags.add(tag);
              // print("adding $tag");
            }
          }
        }

        if (workingTags.isNotEmpty) {
          List<Tag> newTags = await booruHandler.genTagObjects(workingTags);
          for (Tag tag in newTags) {
            await putTag(tag);

            //TODO write tag to database
            tagCounter ++;
          }
          await Future.delayed(Duration(milliseconds: untyped.cooldown), () async{});
        }
      }
      Logger.Inst().log("Got $tagCounter tag types, untyped list length was: ${untyped.tags.length}", "TagHandler", "getTagTypes", LogTypes.tagHandlerInfo);
      tagFetchActive.value = false;
    }
    tryGetTagTypes();
  }

  /// Stores given tags list with given type, if tag is already in the tag map - update it's type, but only if the type was "none"
  void addTagsWithType(List<String> tags, TagType type) async {
    for(String tag in tags) {
      if (!hasTagAndNotStale(tag)) {
        await putTag(Tag(tag, tagType: type));
      } else if (type != TagType.none) {
        if (getTag(tag).tagType == TagType.none) {
          await putTag(Tag(tag, tagType: type));
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
    if (SettingsHandler.instance.path.isNotEmpty) {
      await loadTags();
    }
    return;
  }

  Future<bool> loadTags() async {
    if (SettingsHandler.instance.dbEnabled){
      List<Tag> tags = await SettingsHandler.instance.dbHandler.getAllTags();
      for (Tag tag in tags){
        await putTag(tag, useDB: false);
      }
    } else {
      if (await checkForTagsFile()) {
        await loadTagsFile();
      }
    }

    return true;
  }

  Future<bool> checkForTagsFile() async {
    File tagFile = File("${SettingsHandler.instance.path}tags.json");
    return await tagFile.exists();
  }

  Future<void> loadTagsFile() async {
    File tagFile = File("${SettingsHandler.instance.path}tags.json");
    String jsonString = await tagFile.readAsString();
    // print('loadJSON $settings');
    await loadFromJSON(jsonString);
    return;
  }



  Future<bool> loadFromJSON(String jsonString) async {
      try {
        List jsonList = jsonDecode(jsonString);
        for (Map<String, dynamic> rawTag in jsonList) {
          try {
            Tag tagObject = Tag.fromJson(rawTag);
            await putTag(tagObject);
          } catch (e) {
            Logger.Inst().log(
                "Error parsing tag: $rawTag", "TagHandler", "loadFromJSON",
                LogTypes.exception);
          }
        }
        return true;
      } catch (e) {
        Logger.Inst().log(
            "Error loading tags from JSON: $e", "TagHandler", "loadFromJSON",
            LogTypes.exception);
        return false;
      }
  }

  List<Tag> toList() {
    List<Tag> tagList = [];
    _tagMap.forEach((key,value) => tagList.add(value));
    return tagList;
  }

  void removeTag(Tag tag) {
    _tagMap.remove(tag.fullString);
  }

  Future<void> saveTags() async {
    tagSaveActive = true;
    SettingsHandler settings = SettingsHandler.instance;
    SearchHandler searchHandler = SearchHandler.instance;
    await getPerms();
    Logger.Inst().log("=============================================================", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    Logger.Inst().log("BOORU: ${searchHandler.currentBooruHandler.booru.name}", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    Logger.Inst().log("FETCHED COUNT: ${searchHandler.currentBooruHandler.fetched.length}", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    Logger.Inst().log("PREVIOUS TAG COUNT: $prevLength", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    Logger.Inst().log("TAG COUNT BEFORE SAVE: ${tagMap.entries.length}", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    prevLength = tagMap.entries.length;
    if(settings.dbEnabled){
      //await settings.dbHandler.updateTagsFromObjects(toList());
    } else {try{
      if (settings.path == "") await settings.setConfigDir();
      await Directory(settings.path).create(recursive:true);
      File tagFile = File("${settings.path}tags.json");
      var writer = tagFile.openWrite();
      writer.write(jsonEncode(toList()));
      await writer.flush();
      await writer.close();
      if(!settings.ignoreLogTypes.contains(LogTypes.tagHandlerInfo)){
        Logger.Inst().log("TAG.JSON SIZE: ${File("${SettingsHandler.instance.path}tags.json").lengthSync() / 1024} KB", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
      }
      Logger.Inst().log("=============================================================", "TagHandler", "saveTags", LogTypes.tagHandlerInfo,);
    }catch(e){
      Logger.Inst().log("FAILED TO WRITE TAG FILE", "TagHandler", "saveTags", LogTypes.exception,);
      Logger.Inst().log("e.toString()", "TagHandler", "saveTags", LogTypes.exception,);
    }}
    tagSaveActive = false;
    return;
  }
}

