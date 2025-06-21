import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide ContextExt;
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/pages/gallery_view_page.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/dialogs/comments_dialog.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item_dialog.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class _TagInfoIcon {
  _TagInfoIcon(this.icon, this.color);

  final IconData icon;
  final Color color;
}

class TagView extends StatefulWidget {
  const TagView({
    required this.item,
    required this.handler,
    super.key,
  });

  final BooruItem item;
  final BooruHandler handler;

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
  late BooruHandler handler;
  List<String> tags = [], filteredTags = [];
  Map<String, HasTabWithTagResult> tabMatchesMap = {};
  bool? sortTags;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final GlobalKey searchKey = GlobalKey(debugLabel: 'tagsSearchKey');

  CancelToken? cancelToken;
  bool loadingUpdate = false, failedUpdate = false;

  bool? detailsExpanded;

  Timer? sortTimer;

  @override
  void initState() {
    super.initState();
    searchHandler.searchTextController.addListener(parseSortGroupTagsWithoutCache);

    searchFocusNode.addListener(searchFocusListener);

    item = widget.item;
    handler = widget.handler;
    tags = [...item.tagsList];
    filteredTags = [...tags];
    WidgetsBinding.instance.addPostFrameCallback((_) => parseSortGroupTags());

    reloadItemData(initial: true).then((_) async {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        parseSortGroupTagsWithoutCache();
        sortTimer = Timer.periodic(
          const Duration(seconds: 5),
          (_) => parseSortGroupTagsWithoutCache(),
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant TagView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.item != item) {
      item = widget.item;
      parseSortGroupTags();
    }
    if (widget.handler != handler) {
      handler = widget.handler;
    }
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    sortTimer?.cancel();
    searchHandler.searchTextController.removeListener(parseSortGroupTagsWithoutCache);
    searchController.dispose();
    searchFocusNode.removeListener(searchFocusListener);
    searchFocusNode.dispose();
    super.dispose();
  }

  bool get supportsItemUpdate => handler.hasLoadItemSupport && handler.shouldUpdateIteminTagView;

  Future<void> reloadItemData({
    bool initial = false,
    bool force = false,
  }) async {
    if (supportsItemUpdate && (!item.isUpdated || force)) {
      loadingUpdate = true;
      failedUpdate = false;
      setState(() {});
      cancelToken = CancelToken();
      final res = await handler.loadItem(
        item: item,
        cancelToken: cancelToken,
        withCapcthaCheck: !initial,
      );
      if (res.failed) {
        failedUpdate = true;
      } else if (res.item != null) {
        unawaited(
          SettingsHandler.instance.dbHandler.updateBooruItem(
            res.item!,
            BooruUpdateMode.urlUpdate,
          ),
        );
      }
      loadingUpdate = false;
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => parseSortGroupTags(),
      );
    }
  }

  void parseTags() {
    tagsData = settingsHandler.parseTagsList(tags, isCapped: false);
  }

  List<String> filterTags(List<String> tagsToFilter) {
    final List<String> tags = [];
    if (searchController.text.isEmpty) {
      return tagsToFilter;
    }

    for (int i = 0; i < tagsToFilter.length; i++) {
      if (tagsToFilter[i].toLowerCase().contains(searchController.text.toLowerCase())) {
        tags.add(tagsToFilter[i]);
      }
    }
    return tags;
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

  void cacheTabMatchData() {
    for (final tag in filteredTags) {
      tabMatchesMap[tag] = searchHandler.hasTabWithTag(tag);
    }
  }

  void parseSortGroupTagsWithoutCache() {
    parseSortGroupTags(updateCache: false);
  }

  void parseSortGroupTags({
    bool updateCache = true,
  }) {
    parseTags();
    sortAndGroupTagsList();
    if (updateCache) {
      cacheTabMatchData();
    }
    setState(() {});
  }

  void searchFocusListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (searchFocusNode.hasFocus) {
        // doesn't scroll to a proper position in some cases
        // probably because scroll extent changes due to elements being lazily rendered
        await Scrollable.ensureVisible(
          searchKey.currentContext!,
          alignment: (72 + context.viewInsets.top) / context.height,
          duration: const Duration(milliseconds: 300),
        );
      }
    });
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
    final bool hasSupport = handler.hasCommentsSupport;
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
          page: (_) => CommentsDialog(
            item: item,
            handler: handler,
          ),
        ).open();
      },
      drawBottomBorder: false,
    );
  }

  Widget notesButton() {
    final bool hasSupport = handler.hasNotesSupport;
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
          action: viewerHandler.showNotes.toggle,
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return NotesDialog(item);
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
            item.notes.value = await handler.getNotes(item.serverId!);
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
            color: Colors.grey[800]!.withValues(alpha: 0.66),
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

  Widget infoText(
    String title,
    String data, {
    bool canCopy = true,
    bool isLink = false,
  }) {
    if (data.isNotEmpty) {
      return ListTile(
        onTap: canCopy
            ? () {
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
            : null,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title: ',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: Text(
                data,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        trailing: isLink
            ? IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () => launchUrlString(
                  data,
                  mode: LaunchMode.externalApplication,
                ),
              )
            : null,
      );
    }

    return const SizedBox.shrink();
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
            //
            TagContentPreview(
              tag: tag,
              boorus: handler.booru.type?.isMerge == true
                  ? [
                      ...(handler as MergebooruHandler).booruHandlers.map((e) => e.booru),
                    ]
                  : [handler.booru],
            ),
            //
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
            //
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
              )
            else ...[
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
            ],
            //
            if (!isHated && !isLoved)
              ListTile(
                leading: const Icon(Icons.star, color: Colors.yellow),
                title: const Text('Add to Loved'),
                onTap: () {
                  settingsHandler.addTagToList('loved', tag);
                  searchHandler.filterCurrentFetched();
                  handler.filterFetched();
                  parseSortGroupTagsWithoutCache();
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
                  handler.filterFetched();
                  parseSortGroupTagsWithoutCache();
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
                  parseSortGroupTagsWithoutCache();
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
                  parseSortGroupTagsWithoutCache();
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
                        parseSortGroupTagsWithoutCache();
                      }
                    },
                  ),
                );
                parseSortGroupTagsWithoutCache();
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

  Widget tagsItemBuilder(BuildContext context, String currentTag) {
    final bool isHated = tagsData.hatedTags.contains(currentTag);
    final bool isLoved = tagsData.lovedTags.contains(currentTag);
    final bool isSound = tagsData.soundTags.contains(currentTag);
    final bool isAi = tagsData.aiTags.contains(currentTag);
    final bool isInSearch =
        searchHandler.searchTextController.text
            .toLowerCase()
            .split(' ')
            .indexWhere((tag) => tag == currentTag.toLowerCase() || tag == '-${currentTag.toLowerCase()}') !=
        -1;
    final HasTabWithTagResult hasTabWithTag = tabMatchesMap.containsKey(currentTag)
        ? tabMatchesMap[currentTag]!
        : HasTabWithTagResult.noTag;

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
                        title: const Text(
                          'This tag is already in the current search query:',
                          style: TextStyle(fontSize: 18),
                        ),
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
                    if (settingsHandler.appMode.value.isMobile) {
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

                      parseSortGroupTags();

                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: const Text('Added new tab:', style: TextStyle(fontSize: 20)),
                        content: Text(currentTag, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.fiber_new,
                        sideColor: Colors.green,
                        primaryActionBuilder: (context, controller) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ServiceHandler.vibrate();
                                  if (settingsHandler.appMode.value.isMobile) {
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
                    },
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[800]!.withValues(alpha: 0.66),
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
    final String fileName = Tools.getFileName(item.fileURL);
    final String fileExt = Tools.getFileExt(item.fileURL);
    final String fileUrl = item.fileURL;
    final String fileRes = (item.fileWidth != null && item.fileHeight != null)
        ? '${item.fileWidth?.toInt() ?? ''}x${item.fileHeight?.toInt() ?? ''}'
        : '';
    final String fileSize = item.fileSize != null ? Tools.formatBytes(item.fileSize!, 2) : '';
    final String itemId = item.serverId ?? '';
    final String rating = item.rating ?? '';
    final String score = item.score ?? '';
    final String md5 = item.md5String ?? '';
    final List<String> sources = item.sources ?? [];
    final bool tagsAvailable = tags.isNotEmpty || supportsItemUpdate;
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

    return Scrollbar(
      interactive: true,
      controller: scrollController,
      child: DesktopScrollWrap(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: kMinInteractiveDimension),
                  infoText('ID', itemId),
                  infoText('Post URL', item.postURL, isLink: true),
                  infoText('Posted', formattedDate, canCopy: false),
                  ExpansionTile(
                    title: const Text('Details'),
                    initiallyExpanded: detailsExpanded ?? settingsHandler.expandDetails,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        detailsExpanded = expanded;
                      });
                    },
                    iconColor: Colors.white.withValues(alpha: 0.66),
                    collapsedIconColor: Colors.white.withValues(alpha: 0.66),
                    shape: const Border(),
                    collapsedShape: const Border(),
                    children: [
                      if (settingsHandler.isDebug.value) infoText('Filename', fileName),
                      infoText('URL', fileUrl, isLink: true),
                      infoText('Extension', fileExt),
                      infoText('Resolution', fileRes),
                      infoText('Size', fileSize),
                      infoText('MD5', md5),
                      infoText('Rating', rating),
                      infoText('Score', score),
                    ],
                  ),
                  commentsButton(),
                  notesButton(),
                  sourcesList(sources),
                  if (tagsAvailable) ...[
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.grey[800]!.withValues(alpha: 0.66),
                    ),
                    tagsButton(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                            filled: false,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[800]!.withValues(alpha: 0.66), width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[800]!.withValues(alpha: 0.66), width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: SettingsTextInput(
                          key: searchKey,
                          controller: searchController,
                          focusNode: searchFocusNode,
                          title: 'Search tags',
                          onlyInput: true,
                          clearable: true,
                          pasteable: true,
                          onChanged: (_) {
                            parseSortGroupTagsWithoutCache();
                          },
                          enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
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
                (c, i) => tagsItemBuilder(c, filteredTags[i]),
                childCount: filteredTags.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.viewInsetsOf(context).bottom + kMinInteractiveDimension,
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
    final style = TextStyle(
      fontSize: 14,
      fontWeight: filterText?.isNotEmpty == true ? FontWeight.w400 : FontWeight.w600,
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
                color: Colors.green,
                fontWeight: FontWeight.w600,
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
          const Text(
            'You can select any text below by long tapping it and then press "Open selected" to try opening it as a link:',
          ),
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
                    if (selectedText.isNotEmpty)
                      Expanded(child: Text(selectedText))
                    else
                      const Text('[No text selected]'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      actionsOverflowDirection: VerticalDirection.down,
      actionsOverflowButtonSpacing: 8,
      actions: [
        ElevatedButton.icon(
          onPressed: copy,
          label: Text('Copy ${hasSelected ? 'selected' : 'all'}'.trim()),
          icon: const Icon(Icons.copy),
        ),
        ElevatedButton.icon(
          onPressed: open,
          label: Text('Open ${hasSelected ? 'selected' : ''}'.trim()),
          icon: const Icon(Icons.open_in_new),
        ),
        const CancelButton(
          text: 'Return',
          withIcon: true,
        ),
      ],
    );
  }
}

class TagContentPreview extends StatefulWidget {
  TagContentPreview({
    required this.tag,
    required this.boorus,
    super.key,
  }) : assert(
         boorus.isNotEmpty,
         'boorus must not be empty',
       );

  final String tag;
  final List<Booru> boorus;

  @override
  State<TagContentPreview> createState() => _TagContentPreviewState();
}

class _TagContentPreviewState extends State<TagContentPreview> {
  late final AutoScrollController scrollController;

  Booru? selectedBooru;

  SearchTab? tab;
  bool loading = false;
  bool isLastPage = false;
  String errorString = '';

  final ValueNotifier<int> viewedIndex = ValueNotifier(-1);

  bool get isSingleBooru => widget.boorus.length == 1;

  @override
  void initState() {
    super.initState();
    scrollController = AutoScrollController();

    if (isSingleBooru) {
      selectedBooru = widget.boorus.first;
    }
  }

  Future<void> loadPreview({
    bool refresh = false,
    bool retry = false,
  }) async {
    if (selectedBooru == null) {
      return;
    }

    if (refresh || tab == null) {
      tab = SearchTab(
        selectedBooru!,
        null,
        widget.tag,
      );
      loading = false;
      isLastPage = false;
      errorString = '';
      setState(() {});
    }

    if (loading) {
      return;
    }

    if (retry) {
      errorString = '';
      tab!.booruHandler.errorString = '';

      isLastPage = false;
      tab!.booruHandler.locked = false;
      tab!.booruHandler.pageNum--;
    }

    if (isLastPage || errorString.isNotEmpty) {
      return;
    }

    if (tab!.booruHandler.locked == false) {
      loading = true;
      tab!.booruHandler.pageNum++;
    }
    setState(() {});

    await tab!.booruHandler.search(widget.tag, null);

    if (tab!.booruHandler.locked && !isLastPage) {
      isLastPage = true;
      setState(() {});
    }

    if (tab!.booruHandler.errorString.isNotEmpty) {
      errorString = tab!.booruHandler.errorString;
      setState(() {});
    }

    if (tab!.booruHandler.totalCount.value == 0) {
      unawaited(tab!.booruHandler.searchCount(widget.tag));
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      loading = false;
      setState(() {});
    });
    setState(() {});
  }

  Future<void> onTap(int index) async {
    viewedIndex.value = index;
    final viewerKey = GlobalKey(debugLabel: 'viewer-${tab!.tags.replaceAll(' ', '_')}');
    ViewerHandler.instance.addViewer(viewerKey);
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => GalleryViewPage(
          key: viewerKey,
          tab: tab!,
          initialIndex: index,
          canSelect: false,
          onPageChanged: (page) async {
            viewedIndex.value = page;
            await scrollController.scrollToIndex(
              page,
              duration: const Duration(milliseconds: 10),
              preferPosition: AutoScrollPosition.begin,
            );
          },
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
    viewedIndex.value = -1;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: tab == null
            ? ListTile(
                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Preview'),
                subtitle: isSingleBooru
                    ? null
                    : SettingsBooruDropdown(
                        title: 'Booru',
                        placeholder: 'Select a booru to load',
                        value: selectedBooru,
                        items: widget.boorus,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        onChanged: (value) {
                          selectedBooru = value;
                          loadPreview(refresh: true);
                        },
                        drawBottomBorder: false,
                      ),
                onTap: isSingleBooru ? loadPreview : null,
              )
            : ((tab!.booruHandler.filteredFetched.isEmpty && (loading || errorString.isNotEmpty))
                  ? ListTile(
                      leading: Icon(
                        loading ? Icons.search : Icons.restart_alt,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      trailing: loading ? const CircularProgressIndicator() : null,
                      title: loading ? const Text('Preview is loading...') : const Text('Failed to load preview'),
                      subtitle: errorString.isNotEmpty ? const Text('Tap to try again') : null,
                      onTap: errorString.isNotEmpty ? () => loadPreview(refresh: true) : null,
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.search),
                            const SizedBox(width: 8),
                            Text(
                              'Preview',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Obx(() {
                              final bool hasCount = tab!.booruHandler.totalCount > 0;

                              return AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: hasCount
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        child: Text(
                                          '(${tab!.booruHandler.totalCount})',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              );
                            }),
                            const SizedBox(width: 8),
                            BooruFavicon(tab!.booruHandler.booru),
                            const SizedBox(width: 4),
                            Text(
                              tab!.booruHandler.booru.name ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              onPressed: isSingleBooru
                                  ? () => loadPreview(refresh: true)
                                  : () {
                                      tab = null;
                                      selectedBooru = null;
                                      setState(() {});
                                    },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 200,
                          width: MediaQuery.sizeOf(context).width,
                          child: NotificationListener<ScrollUpdateNotification>(
                            onNotification: (notif) {
                              final bool isNotAtStart = notif.metrics.pixels > 0;
                              final bool isAtOrNearEdge =
                                  notif.metrics.atEdge ||
                                  notif.metrics.pixels >
                                      (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2));
                              final bool isScreenFilled =
                                  notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0;

                              if (!loading) {
                                if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                                  loadPreview();
                                }
                              }

                              return true;
                            },
                            child: Scrollbar(
                              controller: scrollController,
                              interactive: true,
                              thickness: 6,
                              thumbVisibility: true,
                              child: FadingEdgeScrollView.fromScrollView(
                                child: ListView.builder(
                                  controller: scrollController,
                                  physics: getListPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tab!.booruHandler.filteredFetched.isEmpty
                                      ? 1
                                      : tab!.booruHandler.filteredFetched.length +
                                            ((loading || errorString.isNotEmpty) ? 1 : 0),
                                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                  itemBuilder: (context, index) {
                                    if (tab!.booruHandler.filteredFetched.isEmpty) {
                                      return const Center(
                                        child: Column(
                                          // mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Kaomoji(
                                              type: KaomojiType.shrug,
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              'Nothing found',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    if (loading && index == tab!.booruHandler.filteredFetched.length) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 32),
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }

                                    if (errorString.isNotEmpty && index == tab!.booruHandler.filteredFetched.length) {
                                      return Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          margin: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.surface,
                                            border: Border.all(color: Theme.of(context).dividerColor),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 8,
                                            children: [
                                              const Icon(
                                                Icons.error_outline,
                                                size: 30,
                                              ),
                                              const Text(
                                                'Failed to load preview page',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  loadPreview(retry: true);
                                                },
                                                child: const Text('Try again'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    return Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.only(right: 8),
                                        height: 180,
                                        width: 120,
                                        child: ValueListenableBuilder(
                                          valueListenable: viewedIndex,
                                          builder: (context, viewedIndex, _) {
                                            return ThumbnailCardBuild(
                                              index: index,
                                              item: tab!.booruHandler.filteredFetched[index],
                                              handler: tab!.booruHandler,
                                              scrollController: scrollController,
                                              isHighlighted: viewedIndex == index,
                                              selectable: false,
                                              onTap: onTap,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
