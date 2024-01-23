import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class UntypedCollection {
  UntypedCollection(this.tags, this.cooldown, this.booru);
  final List<String> tags;
  final int cooldown;
  final Booru booru;
}

class TagHandler extends GetxController {
  TagHandler() {
    untypedQueue.listen((List<UntypedCollection> list) {
      tryGetTagTypes();
    });
  }
  static TagHandler get instance => Get.find<TagHandler>();

  int prevLength = 0;
  final Map<String, Tag> _tagMap = {};
  Map<String, Tag> get tagMap => _tagMap; // TODO read only (or is it?)

  RxList<UntypedCollection> untypedQueue = RxList<UntypedCollection>([]);
  RxBool tagFetchActive = false.obs;
  bool tagSaveActive = false;

  bool hasTag(String tagString) {
    return tagMap.containsKey(tagString.toLowerCase());
  }

  /// Check if tag is in the tag map and if it is - check if it is not outdated/stale
  bool hasTagAndNotStale(String tagString, {int staleTime = Constants.tagStaleTime}) {
    if (hasTag(tagString)) {
      final bool isNotStale = getTag(tagString).updatedAt >= (DateTime.now().millisecondsSinceEpoch - staleTime);
      return isNotStale;
    } else {
      return false;
    }
  }

  Tag getTag(String tagString) {
    tagString = tagString.toLowerCase();
    Tag? tag;
    if (hasTag(tagString)) {
      tag = tagMap[tagString];
    }
    return tag ?? Tag(tagString, tagType: TagType.none);
  }

  Future<void> putTag(
    Tag tag, {
    required bool dbEnabled,
    bool useDB = true,
    bool preferTypeIfNone = false,
  }) async {
    // TODO sanitize tagString?
    if (tag.fullString.isEmpty) {
      return;
    }
    tag.fullString = tag.fullString.toLowerCase();
    if (preferTypeIfNone && hasTag(tag.fullString)) {
      if (getTag(tag.fullString).tagType != TagType.none && tag.tagType == TagType.none) {
        Logger.Inst().log(
          'Skipped tag ${tag.fullString}',
          'TagHandler',
          'putTag',
          LogTypes.tagHandlerInfo,
        );
        return;
      }
    }
    _tagMap[tag.fullString] = tag;

    if (dbEnabled && useDB) {
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
    if (SettingsHandler.instance.tagTypeFetchEnabled) {
      final bool dbEnabled = SettingsHandler.instance.dbEnabled;

      Logger.Inst().log('Snatching tags: ${untyped.tags}', 'TagHandler', 'getTagTypes', LogTypes.tagHandlerInfo);
      tagFetchActive.value = true;
      final List temp = BooruHandlerFactory().getBooruHandler([untyped.booru], null);

      BooruHandler booruHandler = temp[0];
      if (booruHandler.shouldPopulateTags == false) {
        // if current booru doesn't support tag data, use other booru (if available) that supports it
        final boorusWithTagPopulation =
            SettingsHandler.instance.booruList.where((b) => (BooruHandlerFactory().getBooruHandler([b], null)[0] as BooruHandler?)?.shouldPopulateTags == true);
        booruHandler = boorusWithTagPopulation.isEmpty ? temp[0] : BooruHandlerFactory().getBooruHandler([boorusWithTagPopulation.first], null)[0];
      }

      int tagCounter = 0;
      while (untyped.tags.isNotEmpty) {
        final List<String> workingTags = [];
        const int tagMaxLimit = 100;
        final int tagMax = (untyped.tags.length > tagMaxLimit) ? tagMaxLimit : untyped.tags.length;

        for (int i = 0; i < tagMax; i++) {
          if (untyped.tags.isNotEmpty) {
            final String tag = untyped.tags.removeLast();
            if (!hasTagAndNotStale(tag) && !workingTags.contains(tag)) {
              workingTags.add(tag);
            }
          }
        }

        if (workingTags.isNotEmpty) {
          final List<Tag> newTags = await booruHandler.genTagObjects(workingTags);
          for (final Tag tag in newTags) {
            await putTag(tag, dbEnabled: dbEnabled);

            //TODO write tag to database
            tagCounter++;
          }
          await Future.delayed(Duration(milliseconds: untyped.cooldown), () async {});
        }
      }
      Logger.Inst().log(
        'Got $tagCounter tag types, untyped list length was: ${untyped.tags.length}',
        'TagHandler',
        'getTagTypes',
        LogTypes.tagHandlerInfo,
      );
      tagFetchActive.value = false;
    }
    tryGetTagTypes();
  }

  /// Stores given tags list with given type, if tag is already in the tag map - update it's type, but only if the type was "none"
  Future<void> addTagsWithType(List<String> tags, TagType type) async {
    final dbEnabled = SettingsHandler.instance.dbEnabled;

    for (final String tag in tags) {
      if (!hasTagAndNotStale(tag)) {
        await putTag(Tag(tag, tagType: type), dbEnabled: dbEnabled);
      } else if (type != TagType.none) {
        if (getTag(tag).tagType == TagType.none) {
          await putTag(Tag(tag, tagType: type), dbEnabled: dbEnabled);
        }
      }
    }
  }

  void queue(List<String> untypedTags, Booru booru, int cooldown) {
    Logger.Inst().log('Added ${untypedTags.length} tags to queue from ${booru.name}', 'TagHandler', 'queue', LogTypes.tagHandlerInfo);
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
    try {
      final bool dbEnabled = SettingsHandler.instance.dbEnabled;
      if (dbEnabled) {
        final List<Tag> tags = await SettingsHandler.instance.dbHandler.getAllTags();
        for (final Tag tag in tags) {
          await putTag(tag, useDB: false, dbEnabled: dbEnabled);
        }
      } else {
        if (await checkForTagsFile()) {
          await loadTagsFile();
        }
      }
    } catch (e) {
      Logger.Inst().log('Error loading tags: $e', 'TagHandler', 'loadTags', LogTypes.exception);
    }

    return true;
  }

  Future<bool> checkForTagsFile() {
    final File tagFile = File('${SettingsHandler.instance.path}tags.json');
    return tagFile.exists();
  }

  Future<void> loadTagsFile() async {
    final File tagFile = File('${SettingsHandler.instance.path}tags.json');
    final String jsonString = await tagFile.readAsString();
    await loadFromJSON(jsonString);
    return;
  }

  Future<bool> loadFromJSON(String jsonString, {bool preferTagTypeIfNone = false}) async {
    try {
      final bool dbEnabled = SettingsHandler.instance.dbEnabled;

      final List jsonList = jsonDecode(jsonString);
      for (final Map<String, dynamic> rawTag in jsonList) {
        try {
          final Tag tagObject = Tag.fromJson(rawTag);
          await putTag(
            tagObject,
            preferTypeIfNone: preferTagTypeIfNone,
            dbEnabled: dbEnabled,
          );
        } catch (e) {
          Logger.Inst().log(
            'Error parsing tag: $rawTag',
            'TagHandler',
            'loadFromJSON',
            LogTypes.exception,
          );
        }
      }
      return true;
    } catch (e) {
      Logger.Inst().log(
        'Error loading tags from JSON: $e',
        'TagHandler',
        'loadFromJSON',
        LogTypes.exception,
      );
      return false;
    }
  }

  List<Tag> toList() {
    final List<Tag> tagList = [];
    tagMap.forEach((key, value) => tagList.add(value));
    return tagList;
  }

  void removeTag(Tag tag) {
    _tagMap.remove(tag.fullString);
  }

  Future<void> saveTags() async {
    tagSaveActive = true;
    final SettingsHandler settings = SettingsHandler.instance;
    await getPerms();
    prevLength = tagMap.entries.length;
    if (settings.dbEnabled) {
      //await settings.dbHandler.updateTagsFromObjects(toList());
    } else {
      try {
        if (settings.path == '') {
          await settings.setConfigDir();
        }
        await Directory(settings.path).create(recursive: true);
        final File tagFile = File('${settings.path}tags.json');
        final writer = tagFile.openWrite();
        writer.write(jsonEncode(toList()));
        await writer.flush();
        await writer.close();
      } catch (e) {
        Logger.Inst().log('FAILED TO WRITE TAG FILE: $e', 'TagHandler', 'saveTags', LogTypes.exception);
      }
    }
    tagSaveActive = false;
    return;
  }
}
