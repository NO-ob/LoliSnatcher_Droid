import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/dialogs/comments_dialog.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';

class TagView extends StatefulWidget {
  const TagView({super.key});

  @override
  State<TagView> createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  TagsListData tagsData = const TagsListData();
  ScrollController scrollController = ScrollController();

  late BooruItem item;
  List<String> tags = [], filteredTags = [];
  bool? sortTags;
  late StreamSubscription<BooruItem> itemSubscription;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final GlobalKey searchKey = GlobalKey(debugLabel: 'tagsSearchKey');

  @override
  void initState() {
    super.initState();
    searchHandler.searchTextController.addListener(onMainSearchTextChanged);

    searchFocusNode.addListener(searchFocusListener);

    item = searchHandler.viewedItem.value;
    // copy tags to avoid changing the original array
    tags = [...item.tagsList];
    filteredTags = [...tags];
    parseSortGroupTags();

    itemSubscription = searchHandler.viewedItem.listen((BooruItem item) {
      this.item = item;
      parseSortGroupTags();
    });
  }

  @override
  void dispose() {
    searchHandler.searchTextController.removeListener(onMainSearchTextChanged);
    searchFocusNode.removeListener(searchFocusListener);
    itemSubscription.cancel();
    super.dispose();
  }

  void parseTags() {
    tagsData = settingsHandler.parseTagsList(tags, isCapped: false);
  }

  List<String> filterTags(List<String> tagsToFilter) {
    final List<String> filteredTags = [];
    if (searchController.text.isEmpty) {
      return tagsToFilter;
    }

    for (int i = 0; i < tagsToFilter.length; i++) {
      if (tagsToFilter[i].toLowerCase().contains(searchController.text.toLowerCase())) {
        filteredTags.add(tagsToFilter[i]);
      }
    }
    return filteredTags;
  }

  void sortAndGroupTagsList() {
    if (sortTags == null) {
      tags = [...item.tagsList];
      groupTagsList();
    } else {
      tags.sort((a, b) => sortTags == true ? a.compareTo(b) : b.compareTo(a));
      filteredTags = [
        ...filterTags([...tags]),
      ];
    }
  }

  void groupTagsList() {
    final Map<TagType, List<String>> tagMap = {};
    final List<String> groupedTags = [];
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
    // tagMap.forEach((key, value) => {
    //   print("Type: $key Tags: $value")
    // });
    for (final value in tagMap.values) {
      groupedTags.addAll(value);
    }
    tags = groupedTags;
    filteredTags = [
      ...filterTags([...tags]),
    ];
  }

  void parseSortGroupTags() {
    parseTags();
    sortAndGroupTagsList();
    setState(() {});
  }

  void onMainSearchTextChanged() {
    setState(() {});
  }

  void searchFocusListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchFocusNode.hasFocus) {
        Scrollable.ensureVisible(
          searchKey.currentContext!,
          alignment: 0.1,
          duration: const Duration(milliseconds: 300),
        );
      }
    });
  }

  Widget infoBuild() {
    final String fileName = Tools.getFileName(item.fileURL);
    final String fileUrl = item.fileURL;
    final String fileRes = (item.fileWidth != null && item.fileHeight != null) ? '${item.fileWidth?.toInt() ?? ''}x${item.fileHeight?.toInt() ?? ''}' : '';
    final String fileSize = item.fileSize != null ? Tools.formatBytes(item.fileSize!, 2) : '';
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
        if (postDateFormat == 'unix') {
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(postDate) * 1000);
        } else if (postDateFormat == 'iso') {
          postDate = postDate.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateTime.parse(postDate).toLocal();
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
          if (settingsHandler.isDebug.value) infoText('Filename', fileName),
          infoText('URL', fileUrl),
          infoText('ID', itemId),
          infoText('Rating', rating),
          infoText('Score', score),
          infoText('Resolution', fileRes),
          infoText('Size', fileSize),
          infoText('MD5', md5),
          infoText('Posted', formattedDate, canCopy: false),
          commentsButton(),
          notesButton(),
          sourcesList(sources),
          if (tagsAvailable) ...[
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.grey[800],
            ),
            tagsButton(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SettingsTextInput(
                key: searchKey,
                controller: searchController,
                focusNode: searchFocusNode,
                title: 'Search tags',
                onlyInput: true,
                clearable: true,
                onChanged: (_) {
                  parseSortGroupTags();
                },
              ),
            ),
          ],
        ],
        addAutomaticKeepAlives: false,
      ),
    );
  }

  Widget tagsButton() {
    return SettingsButton(
      name: 'Tags',
      subtitle: Text(searchController.text.isEmpty ? '${tags.length}' : '${filteredTags.length} / ${tags.length}'),
      trailingIcon: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Transform(
          alignment: Alignment.center,
          transform: sortTags == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
          child: IconButton(
            icon: Icon(
              (sortTags == true || sortTags == false) ? Icons.sort : Icons.sort_by_alpha,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              if (sortTags == true) {
                sortTags = false;
              } else if (sortTags == false) {
                sortTags = null;
              } else {
                sortTags = true;
              }
              sortAndGroupTagsList();
              setState(() {});
            },
          ),
        ),
      ),
      drawBottomBorder: false,
    );
  }

  Widget commentsButton() {
    final bool hasSupport = searchHandler.currentBooruHandler.hasCommentsSupport;
    final bool hasComments = item.hasComments == true;
    final IconData icon = hasComments ? CupertinoIcons.text_bubble_fill : CupertinoIcons.text_bubble;

    if (!hasSupport || item.fileURL.isEmpty) {
      return const SizedBox.shrink();
    }

    return SettingsButton(
      name: 'Comments',
      icon: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      action: () {
        SettingsPageOpen(
          context: context,
          page: () => CommentsDialog(
            index: searchHandler.viewedIndex.value,
            item: searchHandler.viewedItem.value,
          ),
        ).open();
      },
      drawBottomBorder: false,
    );
  }

  Widget notesButton() {
    final bool hasSupport = searchHandler.currentBooruHandler.hasNotesSupport;
    final bool hasNotes = item.hasNotes == true;

    if (!hasSupport || !hasNotes) {
      return const SizedBox.shrink();
    }

    return Obx(() {
      if (item.notes.isNotEmpty) {
        return SettingsButton(
          name: '${viewerHandler.showNotes.value ? 'Hide' : 'Show'} Notes (${item.notes.length})',
          icon: Icon(
            Icons.note_add,
            color: Theme.of(context).iconTheme.color,
          ),
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
          icon: Icon(
            Icons.note_add,
            color: Theme.of(context).iconTheme.color,
          ),
          action: () async {
            item.notes.value = await searchHandler.currentBooruHandler.getNotes(item.serverId!);
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
                    onLongPress: () async {
                      ServiceHandler.vibrate();
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return SourceLinkErrorDialog(link: link, fromError: false);
                        },
                      );
                    },
                    onTap: () async {
                      if (!link.startsWith('https://') && !link.startsWith('http://')) {
                        link = 'https://$link';
                      }

                      if (await canLaunchUrlString(link)) {
                        await launchUrlString(
                          link,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return SourceLinkErrorDialog(link: link);
                          },
                        );
                      }
                    },
                    title: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(link, overflow: TextOverflow.fade),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
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
                'Copied $title to clipboard!',
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
      return const SizedBox.shrink();
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
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
              leading: Icon(
                Icons.copy,
                color: Theme.of(context).iconTheme.color,
              ),
              title: const Text('Copy'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: tag));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: const Text(
                    'Copied to clipboard!',
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
                leading: Icon(
                  Icons.remove,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Remove from Search'),
                onTap: () {
                  searchHandler.removeTagFromSearch(tag);
                  Navigator.of(context).pop(true);
                },
              ),
            if (!isInSearch)
              ListTile(
                leading: const Icon(Icons.add, color: Colors.green),
                title: const Text('Add to Search'),
                onTap: () {
                  searchHandler.addTagToSearch(tag);

                  FlashElements.showSnackbar(
                    context: context,
                    duration: const Duration(seconds: 2),
                    title: const Text(
                      'Added to search bar:',
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
                title: const Text('Add to Search (Exclude)'),
                onTap: () {
                  searchHandler.addTagToSearch('-$tag');

                  FlashElements.showSnackbar(
                    context: context,
                    duration: const Duration(seconds: 2),
                    title: const Text(
                      'Added to search bar (Exclude):',
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
                title: const Text('Add to Loved'),
                onTap: () {
                  settingsHandler.addTagToList('loved', tag);
                  parseSortGroupTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (!isHated && !isLoved)
              ListTile(
                leading: const Icon(CupertinoIcons.eye_slash, color: Colors.red),
                title: const Text('Add to Hated'),
                onTap: () {
                  settingsHandler.addTagToList('hated', tag);
                  parseSortGroupTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (isLoved)
              ListTile(
                leading: Icon(
                  Icons.star_border,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Remove from Loved'),
                onTap: () {
                  settingsHandler.removeTagFromList('loved', tag);
                  parseSortGroupTags();
                  Navigator.of(context).pop(true);
                },
              ),
            if (isHated)
              ListTile(
                leading: Icon(
                  CupertinoIcons.eye_slash,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Remove from Hated'),
                onTap: () {
                  settingsHandler.removeTagFromList('hated', tag);
                  parseSortGroupTags();
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
        // add empty items to allow a bit of overscroll for easier reachability
        childCount: filteredTags.length,
      ),
    );
  }

  Widget tagsItemBuilder(BuildContext context, int index) {
    final String currentTag = filteredTags[index];

    final bool isHated = tagsData.hatedTags.contains(currentTag);
    final bool isLoved = tagsData.lovedTags.contains(currentTag);
    final bool isSound = tagsData.soundTags.contains(currentTag);
    final bool isAi = tagsData.aiTags.contains(currentTag);
    final bool isInSearch = searchHandler.searchTextController.text
            .toLowerCase()
            .split(' ')
            .indexWhere((tag) => tag == currentTag.toLowerCase() || tag == '-${currentTag.toLowerCase()}') !=
        -1;
    final HasTabWithTagResult hasTabWithTag = searchHandler.hasTabWithTag(currentTag);

    final List<TagInfoIcon> tagIconAndColor = [];
    if (isAi) {
      tagIconAndColor.add(TagInfoIcon(FontAwesomeIcons.robot, Theme.of(context).colorScheme.onBackground));
    }
    if (isSound) {
      tagIconAndColor.add(TagInfoIcon(Icons.volume_up_rounded, Theme.of(context).colorScheme.onBackground));
    }
    if (isHated) {
      tagIconAndColor.add(TagInfoIcon(CupertinoIcons.eye_slash, Colors.red));
    }
    if (isLoved) {
      tagIconAndColor.add(TagInfoIcon(Icons.star, Colors.yellow));
    }

    if (currentTag != '') {
      return Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              tagDialog(
                tag: currentTag,
                isHated: isHated,
                isLoved: isLoved,
                isInSearch: isInSearch,
              );
            },
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 6,
                        color: tagHandler.getTag(currentTag).getColour(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                MarqueeText(
                  key: ValueKey(currentTag),
                  text: tagHandler.getTag(currentTag).fullString,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  isExpanded: true,
                ),
                if (tagIconAndColor.isNotEmpty) ...[
                  ...tagIconAndColor.map(
                    (t) => t.icon == FontAwesomeIcons.robot
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FaIcon(
                              t.icon,
                              color: t.color,
                              size: 18,
                            ),
                          )
                        : Icon(
                            t.icon,
                            color: t.color,
                            size: 20,
                          ),
                  ),
                  const SizedBox(width: 5),
                ],
                IconButton(
                  icon: Stack(
                    children: [
                      Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                      if (isInSearch)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Icon(
                            Icons.search,
                            size: 10,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                    ],
                  ),
                  onPressed: () {
                    if (isInSearch) {
                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: const Text('This tag is already in the current search query:', style: TextStyle(fontSize: 18)),
                        content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.yellow,
                        sideColor: Colors.yellow,
                      );
                      return;
                    }

                    searchHandler.addTagToSearch(currentTag);
                    FlashElements.showSnackbar(
                      context: context,
                      duration: const Duration(seconds: 2),
                      title: const Text('Added to current search query:', style: TextStyle(fontSize: 20)),
                      content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                      leadingIcon: Icons.add,
                      sideColor: Colors.green,
                    );
                  },
                ),
                GestureDetector(
                  onLongPress: () async {
                    ServiceHandler.vibrate();
                    if (settingsHandler.appMode.value.isMobile && viewerHandler.inViewer.value) {
                      Navigator.of(context).popUntil((route) => route.isFirst); // exit viewer
                    }
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      searchHandler.addTabByString(currentTag, switchToNew: true);
                    });
                  },
                  child: IconButton(
                    icon: Stack(
                      children: [
                        Icon(Icons.fiber_new, color: Theme.of(context).colorScheme.secondary),
                        if (hasTabWithTag.hasTag)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Icon(
                              Icons.circle,
                              size: 6,
                              color: hasTabWithTag.isOnlyTag
                                  ? Theme.of(context).colorScheme.onBackground
                                  : (hasTabWithTag.isOnlyTagDifferentBooru ? Colors.yellow : Colors.blue),
                            ),
                          ),
                      ],
                    ),
                    onPressed: () {
                      searchHandler.addTabByString(currentTag);

                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: const Text('Added new tab:', style: TextStyle(fontSize: 20)),
                        content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.fiber_new,
                        sideColor: Colors.green,
                        primaryActionBuilder: (controller) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ServiceHandler.vibrate();
                                  if (settingsHandler.appMode.value.isMobile && viewerHandler.inViewer.value) {
                                    Navigator.of(context).popUntil((route) => route.isFirst); // exit viewer
                                  }
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    searchHandler.changeTabIndex(searchHandler.list.length - 1);
                                  });
                                  controller.dismiss();
                                },
                                icon: Icon(Icons.arrow_forward_rounded, color: Theme.of(context).colorScheme.onBackground),
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                onPressed: () => controller.dismiss(),
                                icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onBackground),
                              ),
                            ],
                          );
                        },
                      );
                      sortAndGroupTagsList();
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 1,
            thickness: 1,
          ),
        ],
      );
    } else {
      // Render nothing if currentTag is an empty string
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Scrollbar(
        interactive: false,
        controller: scrollController,
        child: DesktopScrollWrap(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              infoBuild(),
              tagsBuild(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO move to own/model file
class TagInfoIcon {
  TagInfoIcon(this.icon, this.color);

  final IconData icon;
  final Color color;
}

class SourceLinkErrorDialog extends StatefulWidget {
  const SourceLinkErrorDialog({
    required this.link,
    this.fromError = true,
    super.key,
  });

  final String link;
  final bool fromError;

  @override
  State<SourceLinkErrorDialog> createState() => _SourceLinkErrorDialogState();
}

class _SourceLinkErrorDialogState extends State<SourceLinkErrorDialog> {
  String selectedText = '';
  bool get hasSelected => selectedText.isNotEmpty;

  Future<void> copy() async {
    final link = hasSelected ? selectedText : widget.link;

    await Clipboard.setData(ClipboardData(text: link));
    FlashElements.showSnackbar(
      context: context,
      duration: const Duration(seconds: 2),
      title: Text(
        'Copied ${hasSelected ? 'selected text' : 'source'} to clipboard!',
        style: const TextStyle(fontSize: 20),
      ),
      content: Text(link, style: const TextStyle(fontSize: 16)),
      leadingIcon: Icons.copy,
      sideColor: Colors.green,
    );
  }

  Future<void> open() async {
    String link = hasSelected ? selectedText : widget.link;
    if (!link.startsWith('https://') && !link.startsWith('http://')) {
      link = 'https://$link';
    }

    if (await canLaunchUrlString(link)) {
      await launchUrlString(
        link,
        mode: LaunchMode.externalApplication,
      );
    } else {
      FlashElements.showSnackbar(
        context: context,
        duration: const Duration(seconds: 2),
        title: const Text(
          'Failed to open link!',
          style: TextStyle(fontSize: 20),
        ),
        content: Text(link, style: const TextStyle(fontSize: 16)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Source'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fromError) const Text("The text in source field can't be open as a link"),
          const Text('You can select any text below by long tapping it and then press "Open selected" to try opening it as a link:'),
          const SizedBox(height: 16),
          SelectableText(
            widget.link,
            onSelectionChanged: (TextSelection selection, SelectionChangedCause? cause) {
              setState(() {
                selectedText = selection.textInside(widget.link);
              });
            },
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Row(
              children: [
                const Icon(Icons.select_all, size: 30),
                const SizedBox(width: 8),
                if (selectedText.isNotEmpty) Text(selectedText) else const Text('[No text selected]'),
              ],
            ),
          ),
        ],
      ),
      actionsOverflowDirection: VerticalDirection.up,
      actions: [
        SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            onPressed: copy,
            label: Text('Copy ${hasSelected ? 'selected' : ''}'.trim()),
            icon: const Icon(Icons.copy),
          ),
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            onPressed: open,
            label: Text('Open ${hasSelected ? 'selected' : ''}'.trim()),
            icon: const Icon(Icons.open_in_new),
          ),
        ),
        const SizedBox(
          height: 40,
          child: CancelButton(withIcon: true),
        ),
      ],
    );
  }
}
