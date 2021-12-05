import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/CommentsDialog.dart';

class TagView extends StatefulWidget {
  BooruItem booruItem;
  TagView(this.booruItem);
  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  List<List<String>> hatedAndLovedTags = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchHandler.searchTextController.addListener(onTextChanged);
    parseTags();
  }

  @override
  void dispose() {
    searchHandler.searchTextController.removeListener(onTextChanged);
    super.dispose();
  }

  void parseTags() {
    hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: false);
    setState(() { });
  }

  void onTextChanged() {
    setState(() { });
  }

  Widget infoBuild() {
    final String fileName = Tools.getFileName(widget.booruItem.fileURL);
    final String fileRes = (widget.booruItem.fileWidth != null && widget.booruItem.fileHeight != null) ? '${widget.booruItem.fileWidth?.toInt() ?? ''}x${widget.booruItem.fileHeight?.toInt() ?? ''}' : '';
    final String fileSize = widget.booruItem.fileSize != null ? Tools.formatBytes(widget.booruItem.fileSize!, 2) : '';
    final String hasNotes = widget.booruItem.hasNotes != null ? widget.booruItem.hasNotes.toString() : '';
    final String itemId = widget.booruItem.serverId ?? '';
    final String rating = widget.booruItem.rating ?? '';
    final String score = widget.booruItem.score ?? '';
    final List<String> sources = widget.booruItem.sources ?? [];
    final bool tagsAvailable = widget.booruItem.tagsList.length > 0;
    String postDate = widget.booruItem.postDate ?? '';
    final String postDateFormat = widget.booruItem.postDateFormat ?? '';
    String formattedDate = '';
    if(postDate.isNotEmpty && postDateFormat.isNotEmpty) {
      try {
        // no timezone support in DateFormat? see: https://stackoverflow.com/questions/56189407/dart-parse-date-timezone-gives-unimplementederror/56190055
        // remove timezones from strings until they fix it
        DateTime parsedDate;
        if(postDateFormat == "unix"){
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(postDate) * 1000);
        } else {
          postDate = postDate.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateFormat(postDateFormat).parseLoose(postDate).toLocal();
        }
        // print(postDate);
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
      } catch(e) {
        print('$postDate $postDateFormat');
        print(e);
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
          infoText('Has Notes', hasNotes, canCopy: false),
          infoText('Posted', formattedDate),
          commentsButton(),
          sourcesList(sources),
          if(tagsAvailable) Divider(height: 2, thickness: 2, color: Colors.grey[800]),
          if(tagsAvailable) infoText('Tags', ' ', canCopy: false),
        ],
        addAutomaticKeepAlives: false,
      ),
    );
  }

  Widget commentsButton() {
    final bool hasSupport = searchHandler.currentTab.booruHandler.hasCommentsSupport;
    final bool hasComments = widget.booruItem.hasComments == true;
    final IconData icon = hasComments ? CupertinoIcons.text_bubble_fill : CupertinoIcons.text_bubble;

    if(!hasSupport) {
      return const SizedBox();
    }
  
    return SettingsButton(
      name: 'Comments',
      icon: Icon(icon),
      action: () {
        showDialog(
          context: context,
          builder: (context) {
            return CommentsDialog(searchHandler.currentTab.currentItem.value);
          }
        );
      },
      drawBottomBorder: false,
    );
  }

  Widget sourcesList(List<String> sources) {
    sources = sources.where((link) => link.trim().isNotEmpty).toList();
    if(sources.isNotEmpty) {
      return Container(
        child: Column(
          children: [
            Divider(height: 2, thickness: 2, color: Colors.grey[800]),
            infoText(sources.length == 1 ? 'Source' : 'Sources', ' ', canCopy: false),
            Column(children: 
              sources.map((link) => ListTile(
                onLongPress: () {
                  ServiceHandler.vibrate();
                  Clipboard.setData(ClipboardData(text: link));
                  FlashElements.showSnackbar(
                    context: context,
                    duration: Duration(seconds: 2),
                    title: Text(
                      "Copied source to clipboard!",
                      style: TextStyle(fontSize: 20)
                    ),
                    content: Text(
                      link,
                      style: TextStyle(fontSize: 16)
                    ),
                    leadingIcon: Icons.copy,
                    sideColor: Colors.green,
                  );
                },
                onTap: () {
                  ServiceHandler.launchURL(link);
                },
                title: Text(link, overflow: TextOverflow.ellipsis)
              )).toList()
            )
          ],
        )
      );
    } else {
      return const SizedBox();
    }
  }

  Widget infoText(String title, String data, {bool canCopy = true}) {
    if(data.isNotEmpty) {
      return Container(
        child: ListTile(
          onTap: () {
            if(canCopy) {
              Clipboard.setData(ClipboardData(text: data));
              FlashElements.showSnackbar(
                context: context,
                duration: Duration(seconds: 2),
                title: Text(
                  "Copied $title to clipboard!",
                  style: TextStyle(fontSize: 20)
                ),
                content: Text(
                  data,
                  style: TextStyle(fontSize: 16)
                ),
                leadingIcon: Icons.copy,
                sideColor: Colors.green,
              );
            }
          },
          title: Row(
            children: [
              Text('$title: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              Expanded(child: Text(data, overflow: TextOverflow.ellipsis)),
            ]
          )
        )
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
    Get.dialog(
      SettingsDialog(
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        contentItems: [
          Container(
            height: 60,
            width: Get.mediaQuery.size.width,
            child: ListTile(
              title: MarqueeText(
                key: ValueKey(tag),
                text: tag,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                isExpanded: false,
              )
            )
          ),
          ListTile(
            leading: Icon(Icons.copy),
            title: Text("Copy"),
            onTap: () {
              Clipboard.setData(ClipboardData(text: tag));
              FlashElements.showSnackbar(
                context: context,
                duration: Duration(seconds: 2),
                title: Text(
                  "Copied to clipboard!",
                  style: TextStyle(fontSize: 20)
                ),
                content: Text(
                  tag,
                  style: TextStyle(fontSize: 16)
                ),
                leadingIcon: Icons.copy,
                sideColor: Colors.green,
              );
              Navigator.of(context).pop(true);
            },
          ),
          if(isInSearch)
            ListTile(
              leading: Icon(Icons.remove),
              title: Text("Remove from Search"),
              onTap: () {
                searchHandler.removeTagFromSearch(tag);
                Navigator.of(context).pop(true);
              },
            ),
          if(!isInSearch)
            ListTile(
              leading: Icon(Icons.add, color: Colors.green),
              title: Text("Add to Search"),
              onTap: () {
                searchHandler.addTagToSearch(tag);

                FlashElements.showSnackbar(
                  context: context,
                  duration: Duration(seconds: 2),
                  title: Text(
                    "Added to search bar:",
                    style: TextStyle(fontSize: 20)
                  ),
                  content: Text(
                    tag,
                    style: TextStyle(fontSize: 16)
                  ),
                  leadingIcon: Icons.add,
                  sideColor: Colors.green,
                );

                Navigator.of(context).pop(true);
              },
            ),
          if(!isInSearch)
            ListTile(
              leading: Icon(Icons.add, color: Colors.red),
              title: Text("Add to Search (Exclude)"),
              onTap: () {
                searchHandler.addTagToSearch('-$tag');

                FlashElements.showSnackbar(
                  context: context,
                  duration: Duration(seconds: 2),
                  title: Text(
                    "Added to search bar (Exclude):",
                    style: TextStyle(fontSize: 20)
                  ),
                  content: Text(
                    tag,
                    style: TextStyle(fontSize: 16)
                  ),
                  leadingIcon: Icons.add,
                  sideColor: Colors.green,
                );

                Navigator.of(context).pop(true);
              },
            ),
          if(!isHated && !isLoved)
            ListTile(
              leading: Icon(Icons.star, color: Colors.yellow),
              title: Text("Add to Loved"),
              onTap: () {
                settingsHandler.addTagToList('loved', tag);
                parseTags();
                Navigator.of(context).pop(true);
              },
            ),
          if(!isHated && !isLoved)
            ListTile(
              leading: Icon(CupertinoIcons.eye_slash, color: Colors.red),
              title: Text("Add to Hated"),
              onTap: () {
                settingsHandler.addTagToList('hated', tag);
                parseTags();
                Navigator.of(context).pop(true);
              },
            ),
          if(isLoved)
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Remove from Loved"),
              onTap: () {
                settingsHandler.removeTagFromList('loved', tag);
                parseTags();
                Navigator.of(context).pop(true);
              },
            ),
          if(isHated)
            ListTile(
              leading: Icon(CupertinoIcons.eye_slash),
              title: Text("Remove from Hated"),
              onTap: () {
                settingsHandler.removeTagFromList('hated', tag);
                parseTags();
                Navigator.of(context).pop(true);
              },
            ),
        ]
      ),
    );
  }

  Widget tagsBuild() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        tagsItemBuilder,
        addAutomaticKeepAlives: false,
        childCount: widget.booruItem.tagsList.length,
      ),
    );
  }

  Widget tagsItemBuilder(BuildContext context, int index) {
    String currentTag = widget.booruItem.tagsList[index];

    bool isHated = hatedAndLovedTags[0].contains(currentTag);
    bool isLoved = hatedAndLovedTags[1].contains(currentTag);
    bool isSound = hatedAndLovedTags[2].contains(currentTag);
    bool isInSearch = searchHandler.searchTextController.text.toLowerCase().split(' ').indexWhere((tag) => tag == currentTag.toLowerCase() || tag == '-${currentTag.toLowerCase()}') != -1;

    List<dynamic> tagIconAndColor = [];
    if (isSound) tagIconAndColor.add([Icons.volume_up_rounded, Get.theme.colorScheme.onBackground]);
    if (isHated) tagIconAndColor.add([CupertinoIcons.eye_slash, Colors.red]);
    if (isLoved) tagIconAndColor.add([Icons.star, Colors.yellow]);
    if (isInSearch) tagIconAndColor.add([Icons.search, Get.theme.colorScheme.onBackground]);

    if (currentTag != '') {
      return Column(children: <Widget>[
        ListTile(
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
              text: currentTag,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              isExpanded: true,
            ),

            if(tagIconAndColor.length > 0)
              ...[
                ...tagIconAndColor.map((t) => Icon(t[0], color: t[1])),
                const SizedBox(width: 5),
              ],

            GestureDetector(
              onLongPress: () {
                ServiceHandler.vibrate();
                Navigator.of(context).pop(true); // exit drawer
                Navigator.of(context).pop(true); // exit viewer
                searchHandler.addTabByString(currentTag, switchToNew: true);
              },
              child: IconButton(
                icon: Icon(
                  Icons.fiber_new,
                  color: Get.theme.colorScheme.secondary
                ),
                onPressed: () {
                  searchHandler.addTabByString(currentTag);

                  FlashElements.showSnackbar(
                    context: context,
                    duration: Duration(seconds: 2),
                    title: Text(
                      "Added new tab:",
                      style: TextStyle(fontSize: 20)
                    ),
                    content: Text(
                      currentTag,
                      style: TextStyle(fontSize: 16)
                    ),
                    leadingIcon: Icons.fiber_new,
                    sideColor: Colors.green,
                  );
                },
              ),
            ),
          ])
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
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Scrollbar(
        controller: scrollController,
        interactive: true,
        thickness: 4,
        radius: Radius.circular(10),
        isAlwaysShown: true,
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
          slivers: [
            infoBuild(),
            tagsBuild(),
          ],
        ),
      ),
    );
  }
}
