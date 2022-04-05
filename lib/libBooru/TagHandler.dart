import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Tag.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';

class TagHandler extends GetxController{
  Map<String,Tag> _tagMap = {};
  SettingsHandler settingsHandler;
  // Needs to be moved to settings at some point
  TagHandler (this.settingsHandler);

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
    tag ??= Tag("","",TagType.none);
    return tag;
  }

  void putTag(Tag tag){
    _tagMap[tag.fullString] = tag;
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
      if(await checkForTagsFile()) {
        await loadTagsFile();
      }
      return true;
  }

  Future<bool> loadFromJSON(String jsonString) async {
    List<Tag> tagList = (json.decode(jsonString) as List)
        .map((tagData) => Tag.fromJson(tagData))
        .toList();
    print("TagHandler got tags: ${tagList.length}");
    print("TagHandler got tags: ${tagList.length}");
    print("TagHandler got tags: ${tagList.length}");
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

