import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/src/utils/tools.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/CommentsDialog.dart';
import 'package:LoliSnatcher/widgets/NotesRenderer.dart';
import 'package:LoliSnatcher/src/data/Tag.dart';
import 'package:LoliSnatcher/src/handlers/TagHandler.dart';

class TagView extends StatefulWidget {
  const TagView({Key? key}) : super(key: key);

  @override
  State<TagView> createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  List<List<String>> hatedAndLovedTags = [];
  ScrollController scrollController = ScrollController();

  late BooruItem item;
  late List<String> tags;
  bool? sortTags;
  late StreamSubscription<BooruItem> itemSubscription;

  @override
  void initState() {
    super.initState();
    searchHandler.searchTextController.addListener(onTextChanged);

    item = searchHandler.viewedItem.value;
    // copy tags to avoid changing the original array
    tags = [...item.tagsList];
    parseTags();
    groupTagsList();
    itemSubscription = searchHandler.viewedItem.listen((BooruItem item) {
      // print('item changed to $item');
      this.item = item;
      tags = [...item.tagsList];
      parseTags();
      sortTagsList();
      groupTagsList();
    });
  }

  @override
  void dispose() {
    searchHandler.searchTextController.removeListener(onTextChanged);
    itemSubscription.cancel();
    super.dispose();
  }

  void parseTags() {
    hatedAndLovedTags = settingsHandler.parseTagsList(tags, isCapped: false);
    setState(() {});
  }

  void sortTagsList() {
    if (sortTags == null) {
      tags = [...item.tagsList];
      groupTagsList();
    } else {
      tags.sort((a, b) => sortTags == true ? a.compareTo(b) : b.compareTo(a));
    }
    setState(() {});
  }

  void groupTagsList() {
    Map<TagType, List<String>> tagMap = {};
    List<String> groupedTags = [];
    for (int i = 0; i < TagType.values.length; i++) {
      tagMap[TagType.values[i]] = [];
    }

    for (int i = 0; i < tags.length; i++) {
      if (tagHandler.hasTag(tags[i])) {
        tagMap[tagHandler.getTag(tags[i]).tagType]?.add(tags[i]);
      } else {
        tagMap[TagType.none]?.add(tags[i]);
      }
    }
    tagMap.forEach((key, value) => {
      //print("Type: $key Tags: $value")
    });
    for (var value in tagMap.values) {
      groupedTags.addAll(value);
    }
    tags = groupedTags;
    setState(() {});
  }

  void onTextChanged() {
    setState(() {});
  }

  Widget infoBuild() {
    final String fileName = Tools.getFileName(item.fileURL);
    final String fileRes =
        (item.fileWidth != null && item.fileHeight != null) ? '${item.fileWidth?.toInt() ?? ''}x${item.fileHeight?.toInt() ?? ''}' : '';
    final String fileSize = item.fileSize != null ? Tools.formatBytes(item.fileSize!, 2) : '';
    final String hasNotes = item.hasNotes != null ? item.hasNotes.toString() : '';
    final String itemId = item.serverId ?? '';
    final String rating = item.rating ?? '';
    final String score = item.score ?? '';
    final String md5 = item.md5String ?? '';
    final List<String> sources = item.sources ?? [];
    final bool tagsAvailable = tags.isNotEmpty;
    String postDate = item.postDate ?? '';
    final String postDateFormat = item.postDateFormat ?? '';
    String formattedDate = '';
    if (postDate.isNotEmpty && postDateFormat.isNotEmpty) {
      try {
        // no timezone support in DateFormat? see: https://stackoverflow.com/questions/56189407/dart-parse-date-timezone-gives-unimplementederror/56190055
        // remove timezones from strings until they fix it
        DateTime parsedDate;
        if (postDateFormat == "unix") {
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(postDate) * 1000);
        } else {
          postDate = postDate.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateFormat(postDateFormat).parseLoose(postDate).toLocal();
        }
        // print(postDate);
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
      } catch (e) {
        print('Date Parse Error :: $postDate $postDateFormat :: $e');
      }
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          // infoText('Filename', fileName),
          infoText('ID', itemId),
          infoText('Rating', rating),
          infoText('Score', score),
          infoText('Resolution', fileRes),
          infoText('Size', fileSize),
          infoText('MD5', md5),
          infoText('Has Notes', hasNotes, canCopy: false),
          infoText('Posted', formattedDate),
          commentsButton(),
          notesButton(),
          sourcesList(sources),
          if (tagsAvailable)
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.grey[800],
            ),
          if (tagsAvailable)
            infoText(
              'Tags',
              ' ',
              canCopy: false,
            ),
          if (tagsAvailable)
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Transform(
                alignment: Alignment.center,
                transform: sortTags == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
                child: IconButton(
                  icon: Icon((sortTags == true || sortTags == false) ? Icons.sort : Icons.sort_by_alpha),
                  onPressed: () {
                    if (sortTags == true) {
                      sortTags = false;
                    } else if (sortTags == false) {
                      sortTags = null;
                    } else {
                      sortTags = true;
                    }
                    sortTagsList();
                  },
                ),
              ),
            ),
        ],
        addAutomaticKeepAlives: false,
      ),
    );
  }

  Widget commentsButton() {
    final bool hasSupport = searchHandler.currentBooruHandler.hasCommentsSupport;
    final bool hasComments = item.hasComments == true;
    final IconData icon = hasComments ? CupertinoIcons.text_bubble_fill : CupertinoIcons.text_bubble;

    if (!hasSupport || item.fileURL.isEmpty) {
      return const SizedBox();
    }

    return SettingsButton(
      name: 'Comments',
      icon: Icon(icon),
      action: () {
        SettingsPageOpen(
          context: context,
          page: () => CommentsDialog(searchHandler.viewedItem.value),
        ).open();
      },
      drawBottomBorder: false,
    );
  }

  Widget notesButton() {
    final bool hasSupport = searchHandler.currentBooruHandler.hasNotesSupport;
    final bool hasNotes = item.hasNotes == true;

    if (!hasSupport || !hasNotes) {
      return const SizedBox();
    }

    return Obx(() {
      if (item.notes.isNotEmpty) {
        return SettingsButton(
          name: '${viewerHandler.showNotes.value ? 'Hide' : 'Show'} Notes (${item.notes.length})',
          icon: const Icon(Icons.note_add),
          action: () {
            viewerHandler.showNotes.toggle();
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return NotesDialog(searchHandler.viewedItem.value);
              },
            );
          },
          drawBottomBorder: false,
        );
      } else {
        return SettingsButton(
          name: 'Load notes',
          icon: const Icon(Icons.note_add),
          action: () async {
            item.notes.value = await searchHandler.currentBooruHandler.fetchNotes(item.serverId!);
          },
          drawBottomBorder: false,
        );
      }
    });
  }

  Widget sourcesList(List<String> sources) {
    sources = sources.where((link) => link.trim().isNotEmpty).toList();
    if (sources.isNotEmpty) {
      return Column(
        children: [
          Divider(height: 2, thickness: 2, color: Colors.grey[800]),
          infoText(Tools.pluralize('Source', sources.length), ' ', canCopy: false),
          Column(
            children: sources
                .map(
                  (link) => ListTile(
                    onLongPress: () {
                      ServiceHandler.vibrate();
                      Clipboard.setData(ClipboardData(text: link));
                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: const Text("Copied source to clipboard!", style: TextStyle(fontSize: 20)),
                        content: Text(link, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.copy,
                        sideColor: Colors.green,
                      );
                    },
                    onTap: () {
                      ServiceHandler.launchURL(link);
                    },
                    title: Text(link, overflow: TextOverflow.ellipsis),
                  ),
                )
                .toList(),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget infoText(String title, String data, {bool canCopy = true}) {
    if (data.isNotEmpty) {
      return ListTile(
        onTap: () {
          if (canCopy) {
            Clipboard.setData(ClipboardData(text: data));
            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: Text(
                "Copied $title to clipboard!",
                style: const TextStyle(fontSize: 20),
              ),
              content: Text(
                data,
                style: const TextStyle(fontSize: 16),
              ),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
          }
        },
        title: Row(
          children: [
            Text('$title: ', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
            Expanded(child: Text(data, overflow: TextOverflow.ellipsis)),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  void tagDialog({
    required String tag,
    required bool isHated,
    required bool isLoved,
    required bool isInSearch,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SettingsDialog(
          contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          contentItems: [
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: MarqueeText(
                  key: ValueKey(tag),
                  text: tag,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  isExpanded: false,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 6,
                  height: 24,
                  color: tagHandler.getTag(tag).getColour(),
                ),
                const SizedBox(width: 10),
                Text(
                  tagHandler.getTag(tag).tagType.toString(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text("Copy"),
              onTap: () {
                Clipboard.setData(ClipboardData(text: tag));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: const Text(
                    "Copied to clipboard!",
                    style: TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    tag,
                    style: const TextStyle(fontSize: 16),
                  ),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop(true);
              },
            ),
            if (isInSearch)
              ListTile(
                leading: const Icon(Icons.remove),
                title: const Text("Remove from Search"),
                onTap: () {
                  searchHandler.removeTagFromSearch(tag);
                  Navigator.of(context).pop(true);
                },
              ),
            if (!isInSearch)
              ListTile(
                leading: const Icon(Icons.add, color: Colors.green),
                title: const Text("Add to Search"),
                onTap: () {
                  searchHandler.addTagToSearch(tag);

                  FlashElements.showSnackbar(
                    context: context,
                    duration: const Duration(seconds: 2),
                    title: const Text(
                      "Added to search bar:",
                      style: TextStyle(fontSize: 20),
                    ),
                    content: Text(
                      tag,
                      style: const TextStyle(fontSize: 16),
                    ),
                    leadingIcon: Icons.add,
                    sideColor: Colors.green,
                  );

                  Navigator.of(context).pop(true);
                },
              ),
            if (!isInSearch)
              ListTile(
                leading: const Icon(Icons.add, color: Colors.red),
                title: const Text("Add to Search (Exclude)"),
                onTap: () {
                  searchHandler.addTagToSearch('-$tag');

                  FlashElements.showSnackbar(
                    context: context,
                    duration: const Duration(seconds: 2),
                    title: const Text(
                      "Added to search bar (Exclude):",
                      style: TextStyle(fontSize: 20),
                    ),
                    content: Text(
                      tag,
                      style: const TextStyle(fontSize: 16),
                    ),
                    leadingIcon: Icons.add,
                    sideColor: Colors.green,
                  );

                  Navigator.of(context).pop(true);
                },
              ),
            if (!isHated && !isLoved)
              ListTile(
                leading: const Icon(Icons.star, color: Colors.yellow),
                title: const Text("Add to Loved"),
                onTap: () {
                  settingsHandler.addTagToList('loved', tag);
                  parseTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (!isHated && !isLoved)
              ListTile(
                leading: const Icon(CupertinoIcons.eye_slash, color: Colors.red),
                title: const Text("Add to Hated"),
                onTap: () {
                  settingsHandler.addTagToList('hated', tag);
                  parseTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (isLoved)
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Remove from Loved"),
                onTap: () {
                  settingsHandler.removeTagFromList('loved', tag);
                  parseTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (isHated)
              ListTile(
                leading: const Icon(CupertinoIcons.eye_slash),
                title: const Text("Remove from Hated"),
                onTap: () {
                  settingsHandler.removeTagFromList('hated', tag);
                  parseTags();
                  Navigator.of(context).pop(true);
                },
              ),
          ],
        );
      },
    );
  }

  Widget tagsBuild() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        tagsItemBuilder,
        addAutomaticKeepAlives: false,
        childCount: tags.length,
      ),
    );
  }

  Widget tagsItemBuilder(BuildContext context, int index) {
    String currentTag = tags[index];

    bool isHated = hatedAndLovedTags[0].contains(currentTag);
    bool isLoved = hatedAndLovedTags[1].contains(currentTag);
    bool isSound = hatedAndLovedTags[2].contains(currentTag);
    bool isInSearch = searchHandler.searchTextController.text
            .toLowerCase()
            .split(' ')
            .indexWhere((tag) => tag == currentTag.toLowerCase() || tag == '-${currentTag.toLowerCase()}') !=
        -1;

    List<TagInfoIcon> tagIconAndColor = [];
    if (isSound) tagIconAndColor.add(TagInfoIcon(Icons.volume_up_rounded, Theme.of(context).colorScheme.onBackground));
    if (isHated) tagIconAndColor.add(TagInfoIcon(CupertinoIcons.eye_slash, Colors.red));
    if (isLoved) tagIconAndColor.add(TagInfoIcon(Icons.star, Colors.yellow));
    if (isInSearch) tagIconAndColor.add(TagInfoIcon(Icons.search, Theme.of(context).colorScheme.onBackground));

    if (currentTag != '') {
      return Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 10.0, color: tagHandler.getTag(currentTag).getColour())),
          ),
          child: ListTile(
              onTap: () {
                tagDialog(
                  tag: currentTag,
                  isHated: isHated,
                  isLoved: isLoved,
                  isInSearch: isInSearch,
                );
              },
              title: Row(children: [
                MarqueeText(
                  key: ValueKey(currentTag),
                  text: tagHandler.getTag(currentTag).displayString,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  isExpanded: true,
                ),
                if (tagIconAndColor.isNotEmpty) ...[
                  ...tagIconAndColor.map((t) => Icon(t.icon, color: t.color)),
                  const SizedBox(width: 5),
                ],
                IconButton(
                  icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                  onPressed: () {
                    searchHandler.addTagToSearch(currentTag);
                    FlashElements.showSnackbar(
                      context: context,
                      duration: const Duration(seconds: 2),
                      title: const Text("Added to current tab:", style: TextStyle(fontSize: 20)),
                      content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                      leadingIcon: Icons.add,
                      sideColor: Colors.green,
                    );
                  },
                ),
                GestureDetector(
                  onLongPress: () async {
                    ServiceHandler.vibrate();
                    if (settingsHandler.appMode.value == AppMode.MOBILE && viewerHandler.inViewer.value) {
                      Navigator.of(context).pop(true); // exit drawer
                      Navigator.of(context).pop(true); // exit viewer
                    }
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      searchHandler.addTabByString(currentTag, switchToNew: true);
                    });
                  },
                  child: IconButton(
                    icon: Icon(Icons.fiber_new, color: Theme.of(context).colorScheme.secondary),
                    onPressed: () {
                      searchHandler.addTabByString(currentTag);

                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: const Text("Added new tab:", style: TextStyle(fontSize: 20)),
                        content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.fiber_new,
                        sideColor: Colors.green,
                      );
                    },
                  ),
                ),
              ])),
        ),
        Divider(
          color: Colors.grey[800],
          height: 1,
          thickness: 1,
        ),
      ]);
    } else {
      // Render nothing if currentTag is an empty string
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Scrollbar(
        controller: scrollController,
        child: DesktopScrollWrap(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              infoBuild(),
              tagsBuild(),
            ],
          ),
        ),
      ),
    );
  }
}


// TODO move to own/model file
class TagInfoIcon {
  final IconData icon;
  final Color color;

  TagInfoIcon(this.icon, this.color);
}