import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:get/get.dart' hide ContextExt, FirstWhereOrNullExt;
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_query_editor_page.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_tag_chip.dart';

class MainSearchBarWithActions extends StatelessWidget {
  const MainSearchBarWithActions(
    this.subTag, {
    super.key,
  });

  final String subTag;

  SearchHandler get searchHandler => SearchHandler.instance;
  SettingsHandler get settingsHandler => SettingsHandler.instance;

  void onChipTap(
    BuildContext context,
    String tag,
    int tagIndex,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MainSearchQueryEditorPage(subTag: subTag)),
    );
  }

  void onChipLongTap(
    BuildContext context,
    String tag,
    int tagIndex,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MainSearchQueryEditorPage(
          subTag: subTag,
          tagToEditIndex: tagIndex,
        ),
      ),
    );
  }

  void onChipDeleteTap(
    String tag,
    int tagIndex,
  ) {
    final List<String> tempTags = searchHandler.searchTextControllerTags..removeAt(tagIndex);
    searchHandler.searchTextController.text = tempTags.join(' ');
  }

  void onSearchBackgroundTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MainSearchQueryEditorPage(
          subTag: subTag,
          autoFocus: settingsHandler.autofocusSearchbar,
        ),
      ),
    );
  }

  void onResetTap() {
    searchHandler.searchTextController.text = searchHandler.currentTab.tags.trim();
  }

  void onSearchTap() {
    searchHandler.searchTextController.clearComposing();
    searchHandler.searchAction(searchHandler.searchTextController.text, null);
  }

  void onSearchLongTap() {
    ServiceHandler.vibrate();
    searchHandler.searchTextController.clearComposing();
    searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'mainSearchBar-$subTag',
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
        ),
        child: MainSearchBar(
          onChipTap: (tag, index) => onChipTap(context, tag, index),
          onChipLongTap: (tag, index) => onChipLongTap(context, tag, index),
          onChipDeleteTap: onChipDeleteTap,
          onSearchBackgroundTap: () => onSearchBackgroundTap(context),
          onResetTap: onResetTap,
          onSearchTap: onSearchTap,
          onSearchLongTap: onSearchLongTap,
          subTag: subTag,
        ),
      ),
    );
  }
}

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({
    required this.onChipTap,
    required this.onChipLongTap,
    required this.onChipDeleteTap,
    required this.onResetTap,
    required this.onSearchTap,
    required this.onSearchLongTap,
    this.onSearchBackgroundTap,
    this.scrollController,
    this.selectedTag,
    this.selectedTagIndex,
    this.subTag,
    super.key,
  });

  final void Function(String, int) onChipTap;
  final void Function(String, int)? onChipLongTap;
  final void Function(String, int)? onChipDeleteTap;
  final VoidCallback onResetTap;
  final VoidCallback onSearchTap;
  final VoidCallback onSearchLongTap;
  final VoidCallback? onSearchBackgroundTap;
  final AutoScrollController? scrollController;
  final String? selectedTag;
  final int? selectedTagIndex;
  final String? subTag;

  static double get height => 44;

  @override
  State<MainSearchBar> createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  late final AutoScrollController scrollController;

  List<String> tags = [];
  String? currentTabId = '';

  Timer? periodicUpdateTimer;

  @override
  void initState() {
    super.initState();

    scrollController = widget.scrollController ?? AutoScrollController();

    parseTags();
    currentTabId = searchHandler.currentTabId;
    searchHandler.searchTextController.addListener(onTextChanged);

    // periodically update state, mostly to force re-render of chips in case their type data gets fetched later
    // TODO cache tags type and compare for updates instead of this?
    periodicUpdateTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => onTextChanged(),
    );
  }

  void onTextChanged() {
    // final tagsBefore = [...tags];
    parseTags();

    final String? prevTabId = currentTabId;
    if (prevTabId != searchHandler.currentTabId) {
      scrollToStart();
      currentTabId = searchHandler.currentTabId;
    }

    // TODO re-render only if tags or their types have changed
    // if (listEquals(tagsBefore, tags) == false) {
    setState(() {});
    // }
  }

  void parseTags() {
    tags = searchHandler.searchTextControllerTags;
  }

  void scrollToStart() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    periodicUpdateTimer?.cancel();
    searchHandler.searchTextController.removeListener(onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        enabled: !settingsHandler.shitDevice,
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Material(
          color: context.theme.colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: widget.onSearchBackgroundTap,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Listener(
                        onPointerSignal: (event) => desktopPointerScroll(scrollController, event),
                        child: FadingEdgeScrollView.fromScrollView(
                          child: ListView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            // scrollconfig allows to control physics outside of the widget
                            physics: tags.isEmpty
                                ? const NeverScrollableScrollPhysics()
                                : ScrollConfiguration.of(context).getScrollPhysics(context),
                            padding: const EdgeInsets.fromLTRB(8, 6, 60, 6),
                            children: [
                              if (tags.isEmpty)
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      'Search',
                                      style: context.theme.textTheme.bodyLarge?.copyWith(
                                        color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                        fontSize: 16,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              //
                              for (int i = 0; i < tags.length; i++)
                                AutoScrollTag(
                                  key: Key('${tags[i]}-$currentTabId'),
                                  controller: scrollController,
                                  index: i,
                                  child: Padding(
                                    padding: (i < tags.length - 1) ? const EdgeInsets.only(right: 8) : EdgeInsets.zero,
                                    child: Stack(
                                      children: [
                                        MainSearchTagChip(
                                          tag: tags[i],
                                          tab: searchHandler.currentTab,
                                          onTap: () => widget.onChipTap(tags[i], i),
                                          onLongTap: widget.onChipLongTap == null
                                              ? null
                                              : () => widget.onChipLongTap!(tags[i], i),
                                          onDeleteTap: widget.onChipDeleteTap == null
                                              ? null
                                              : () => widget.onChipDeleteTap!(tags[i], i),
                                          canDelete: widget.selectedTagIndex != i,
                                          isSelected: widget.selectedTag == tags[i] || widget.selectedTagIndex == i,
                                        ),
                                        if (widget.selectedTag == tags[i] || widget.selectedTagIndex == i)
                                          Positioned.fill(
                                            child: TransparentPointer(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: context.theme.colorScheme.secondary,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                    if (searchHandler.searchTextController.text.isNotEmpty)
                      Obx(
                        () {
                          if (searchHandler.currentTab.tags.trim() == tags.join(' ')) {
                            return Material(
                              key: const Key('clear-button'),
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: searchHandler.searchTextController.clear,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 24,
                                  ),
                                ),
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    //
                    Obx(
                      () {
                        if (searchHandler.currentTab.tags.trim() != tags.join(' ')) {
                          return Material(
                            key: const Key('reset-button'),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: widget.onResetTap,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.refresh,
                                  size: 24,
                                ),
                              ),
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                    //
                    Material(
                      key: const Key('search-button'),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.onSearchTap,
                        onLongPress: widget.onSearchLongTap,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.search_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
