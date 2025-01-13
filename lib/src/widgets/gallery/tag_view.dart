import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
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
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/dialogs/comments_dialog.dart';
import 'package:lolisnatcher/src/widgets/gallery/item_viewer_page.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item_dialog.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class _TagInfoIcon {
  _TagInfoIcon(this.icon, this.color);

  final IconData icon;
  final Color color;
}

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

  CancelToken? cancelToken;
  bool loadingUpdate = false, failedUpdate = false;

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

    reloadItemData(initial: true);
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    searchHandler.searchTextController.removeListener(onMainSearchTextChanged);
    searchController.dispose();
    searchFocusNode.removeListener(searchFocusListener);
    itemSubscription.cancel();
    super.dispose();
  }

  bool get supportsItemUpdate => searchHandler.currentBooruHandler.hasLoadItemSupport && searchHandler.currentBooruHandler.shouldUpdateIteminTagView;

  Future<void> reloadItemData({
    bool initial = false,
    bool force = false,
  }) async {
    if (supportsItemUpdate && (!item.isUpdated || force)) {
      loadingUpdate = true;
      failedUpdate = false;
      setState(() {});
      cancelToken = CancelToken();
      final res = await searchHandler.currentBooruHandler.loadItem(
        item: item,
        cancelToken: cancelToken,
        withCapcthaCheck: !initial,
      );
      if (res[1] == false) {
        failedUpdate = true;
      }
      loadingUpdate = false;
      setState(() {});
      parseSortGroupTags();
    }
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
          infoText('Post URL', item.postURL),
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
              color: Colors.grey[800]!.withOpacity(0.66),
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
                pasteable: true,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (supportsItemUpdate) ...[
              if (loadingUpdate)
                IconButton(
                  onPressed: () {
                    cancelToken?.cancel();
                  },
                  icon: Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: Theme.of(context).iconTheme.color,
                        size: 24,
                      ),
                    ],
                  ),
                )
              else
                IconButton(
                  onPressed: () {
                    reloadItemData(force: true);
                  },
                  icon: Icon(
                    failedUpdate ? Icons.error_outline : Icons.refresh,
                    color: failedUpdate ? Colors.red : Theme.of(context).iconTheme.color,
                    size: 28,
                  ),
                ),
            ],
            //
            Transform(
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
          ],
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
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.grey[800]!.withOpacity(0.66),
          ),
          infoText(Tools.pluralize('Source', sources.length), ' ', canCopy: false),
          Column(
            children: sources
                .map(
                  (link) => ListTile(
                    onLongPress: () async {
                      await ServiceHandler.vibrate();
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
              width: MediaQuery.sizeOf(context).width,
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
                  decoration: BoxDecoration(
                    color: tagHandler.getTag(tag).getColour(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  tagHandler.getTag(tag).tagType.locName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (searchHandler.currentBooru.type != BooruType.Merge) TagContentPreview(tag: tag),
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
                Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
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

                  Navigator.of(context).pop();
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

                  Navigator.of(context).pop();
                },
              ),
            if (!isHated && !isLoved)
              ListTile(
                leading: const Icon(Icons.star, color: Colors.yellow),
                title: const Text('Add to Loved'),
                onTap: () {
                  settingsHandler.addTagToList('loved', tag);
                  searchHandler.filterCurrentFetched();
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
                  searchHandler.filterCurrentFetched();
                  parseSortGroupTags();
                  Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
                },
              ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Theme.of(context).iconTheme.color,
              ),
              title: const Text('Edit Tag'),
              onTap: () async {
                Navigator.of(context).pop();
                final item = tagHandler.getTag(tag);
                await showDialog(
                  context: context,
                  builder: (context) => TagsManagerListItemDialog(
                    tag: item,
                    onChangedType: (TagType? newValue) {
                      if (newValue != null && item.tagType != newValue) {
                        item.tagType = newValue;
                        tagHandler.putTag(item, dbEnabled: settingsHandler.dbEnabled);
                        parseSortGroupTags();
                      }
                    },
                  ),
                );
                parseSortGroupTags();
              },
            ),
            //
            ListTile(
              leading: Icon(
                Icons.cancel_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: const Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

    final List<_TagInfoIcon> tagIconAndColor = [];
    if (isAi) {
      tagIconAndColor.add(_TagInfoIcon(FontAwesomeIcons.robot, Theme.of(context).colorScheme.onSurface));
    }
    if (isSound) {
      tagIconAndColor.add(_TagInfoIcon(Icons.volume_up_rounded, Theme.of(context).colorScheme.onSurface));
    }
    if (isHated) {
      tagIconAndColor.add(_TagInfoIcon(CupertinoIcons.eye_slash, Colors.red));
    }
    if (isLoved) {
      tagIconAndColor.add(_TagInfoIcon(Icons.star, Colors.yellow));
    }

    if (currentTag != '') {
      return Column(
        children: [
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
                    color: tagHandler.getTag(currentTag).getColour(),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _TagText(
                  key: ValueKey(currentTag),
                  tag: tagHandler.getTag(currentTag).fullString,
                  filterText: searchController.text,
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
                            color: Theme.of(context).colorScheme.onSurface,
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
                    await ServiceHandler.vibrate();
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
                                  ? Theme.of(context).colorScheme.onSurface
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
                                icon: Icon(Icons.arrow_forward_rounded, color: Theme.of(context).colorScheme.onSurface),
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                onPressed: () => controller.dismiss(),
                                icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface),
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
                const SizedBox(width: 16),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[800]!.withOpacity(0.66),
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
    return Scrollbar(
      interactive: true,
      controller: scrollController,
      child: DesktopScrollWrap(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            infoBuild(),
            SliverToBoxAdapter(
              child: (filteredTags.isEmpty && tags.isNotEmpty)
                  ? const Column(
                      children: [
                        Kaomoji(
                          type: KaomojiType.shrug,
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          'No tags found',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 60),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                tagsItemBuilder,
                addAutomaticKeepAlives: false,
                // add empty items to allow a bit of overscroll for easier reachability
                childCount: filteredTags.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.viewInsetsOf(context).bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagText extends StatelessWidget {
  const _TagText({
    required this.tag,
    this.filterText,
    super.key,
  });

  final String tag;
  final String? filterText;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );

    if (filterText?.isNotEmpty == true) {
      final List<TextSpan> spans = [];
      final List<String> split = tag.split(filterText!);

      for (int i = 0; i < split.length; i++) {
        spans.add(
          TextSpan(
            text: split[i],
            style: style,
          ),
        );
        if (i < split.length - 1) {
          spans.add(
            TextSpan(
              text: filterText,
              style: style.copyWith(
                backgroundColor: Colors.green,
              ),
            ),
          );
        }
      }

      return MarqueeText.rich(
        textSpan: TextSpan(
          children: spans,
        ),
        isExpanded: true,
        style: style,
      );
    } else {
      return MarqueeText(
        text: tag,
        isExpanded: true,
        style: style,
      );
    }
  }
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

  // crutch to reset the selection
  int selectionKeyIndex = 0;

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
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fromError)
            const Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                "The text in source field can't be opened as a link, either because it's not a link or there are multiple URLs in a single string.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const Text('You can select any text below by long tapping it and then press "Open selected" to try opening it as a link:'),
          const SizedBox(height: 16),
          SelectableLinkify(
            key: ValueKey('selection-$selectionKeyIndex'),
            text: widget.link,
            options: const LinkifyOptions(
              humanize: false,
              removeWww: true,
              looseUrl: true,
              defaultToHttps: true,
              excludeLastPeriod: true,
            ),
            scrollPhysics: const NeverScrollableScrollPhysics(),
            useMouseRegion: true,
            onSelectionChanged: (TextSelection selection, SelectionChangedCause? cause) {
              setState(() {
                selectedText = selection.textInside(widget.link);
              });
            },
            onOpen: (link) async {
              final res = await launchUrlString(
                link.url,
                mode: LaunchMode.externalApplication,
              );
              if (!res) {
                FlashElements.showSnackbar(
                  title: const Text('Error'),
                  content: const Text('Failed to open link'),
                );
              }
            },
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: selectedText.isEmpty
                  ? null
                  : () {
                      setState(() {
                        selectionKeyIndex++;
                        selectedText = '';
                      });
                    },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.select_all, size: 30),
                    const SizedBox(width: 8),
                    if (selectedText.isNotEmpty) Expanded(child: Text(selectedText)) else const Text('[No text selected]'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      actionsOverflowDirection: VerticalDirection.up,
      actionsOverflowButtonSpacing: 8,
      actions: [
        ElevatedButton.icon(
          onPressed: copy,
          label: Text('Copy ${hasSelected ? 'selected' : ''}'.trim()),
          icon: const Icon(Icons.copy),
        ),
        ElevatedButton.icon(
          onPressed: open,
          label: Text('Open ${hasSelected ? 'selected' : ''}'.trim()),
          icon: const Icon(Icons.open_in_new),
        ),
        const CancelButton(withIcon: true),
      ],
    );
  }
}

class TagContentPreview extends StatefulWidget {
  const TagContentPreview({
    required this.tag,
    super.key,
  });

  final String tag;

  @override
  State<TagContentPreview> createState() => _TagContentPreviewState();
}

class _TagContentPreviewState extends State<TagContentPreview> {
  final SearchHandler searchHandler = SearchHandler.instance;

  SearchTab? preview;
  bool loading = false, failed = false;

  Future<void> loadPreview() async {
    preview = SearchTab(
      searchHandler.currentBooru.obs,
      null,
      widget.tag,
    );
    loading = true;
    failed = false;
    setState(() {});

    await preview!.booruHandler.search(widget.tag, null);
    loading = false;

    if (preview!.booruHandler.errorString.isNotEmpty) {
      failed = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: preview == null
            ? ListTile(
                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Preview'),
                onTap: loadPreview,
              )
            : ((loading || failed)
                ? ListTile(
                    leading: Icon(
                      loading ? Icons.search : Icons.restart_alt,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    trailing: loading ? const CircularProgressIndicator() : null,
                    title: loading ? const Text('Preview is loading...') : const Text('Failed to load preview'),
                    subtitle: failed ? const Text('Tap to try again') : null,
                    onTap: failed ? loadPreview : null,
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Preview:',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(width: 8),
                          BooruFavicon(preview!.booruHandler.booru),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: loadPreview,
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 180,
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: preview!.booruHandler.filteredFetched.length,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(right: 8),
                            height: 180,
                            width: 120,
                            child: Stack(
                              children: [
                                ThumbnailBuild(
                                  item: preview!.booruHandler.filteredFetched[index],
                                  selectable: false,
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(4),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) => ItemViewerPage(
                                              item: preview!.booruHandler.filteredFetched[index],
                                              booru: preview!.booruHandler.booru,
                                            ),
                                            opaque: false,
                                            transitionDuration: const Duration(milliseconds: 300),
                                            barrierColor: Colors.black26,
                                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                              return const ZoomPageTransitionsBuilder().buildTransitions(
                                                MaterialPageRoute(
                                                  builder: (_) => const SizedBox.shrink(),
                                                ),
                                                context,
                                                animation,
                                                secondaryAnimation,
                                                child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  )),
      ),
    );
  }
}
