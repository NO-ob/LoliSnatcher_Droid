import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide FirstWhereOrNullExt;
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/history_item.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';
import 'package:lolisnatcher/src/widgets/gallery/tag_view.dart';
import 'package:lolisnatcher/src/widgets/history/history.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_error_buttons.dart';

// all the scroll stuff is just experiments,

// current implementation listens to MainAppBar visibility changes
// and shows/hides bottom bar as soon as it reaches starting height/leaves screen

// TODO split into separate files

class WaterfallBottomBar extends StatefulWidget {
  const WaterfallBottomBar({super.key});

  @override
  WaterfallBottomBarState createState() => WaterfallBottomBarState();
}

class WaterfallBottomBarState extends State<WaterfallBottomBar> with TickerProviderStateMixin {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  late final AnimationController animationController;
  late final Animation<double> animation;
  ScrollDirection lastUserDirection = ScrollDirection.idle, lastDirection = ScrollDirection.idle;
  double lastOffset = 0, accumulatedOffset = 0, accumulatedOppositeOffset = 0;

  ScrollController get scrollController => searchHandler.gridScrollController;

  double get animValue => animation.value;
  double get reverseAnimValue => 1 - animValue;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = animationController.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ).chain(CurveTween(curve: Curves.ease)),
    );

    // scrollController.addListener(scrollListener);
    // searchHandler.scrollStream?.listen(scrollStreamListener);
  }

  void show() {
    if (animationController.status != AnimationStatus.reverse) {
      animationController.reverse();
    }
  }

  void hide() {
    if (animationController.status != AnimationStatus.forward) {
      animationController.forward();
    }
  }

  void scrollStreamListener(ScrollUpdateNotification notification) {
    if (!scrollController.hasClients) {
      return;
    }

    final double offset = scrollController.offset;
    final double viewport = scrollController.position.viewportDimension;
    final double edgeLimit = viewport / 3;

    double delta = notification.dragDetails?.delta.dy ?? 0;
    final ScrollDirection direction = delta == 0
        ? ScrollDirection.idle
        : (delta > 0 ? ScrollDirection.forward : ScrollDirection.reverse);
    delta = delta.abs();

    final double offsetLimit = MainSearchBar.height + MediaQuery.viewPaddingOf(context).bottom;
    const double oppositeLimit = 20;

    if (direction != lastDirection) {
      accumulatedOppositeOffset += delta;
      if (accumulatedOppositeOffset > oppositeLimit) {
        lastDirection = direction;
        accumulatedOppositeOffset = 0;
        accumulatedOffset = oppositeLimit;
      } else {
        accumulatedOppositeOffset += delta;
      }
    } else {
      accumulatedOffset += delta;
      if (offset < edgeLimit) {
        // don't hide if scrolled less than a third of viewport
        show();
        return;
      }
      if (accumulatedOffset > offsetLimit) {
        switch (direction) {
          case ScrollDirection.forward:
            show();
            break;
          case ScrollDirection.reverse:
            hide();
            break;
          default:
            break;
        }
      }
    }
  }

  void scrollListener() {
    if (!scrollController.hasClients) {
      return;
    }

    ScrollDirection? scrollDirection;
    final double offset = scrollController.offset;
    final double viewport = scrollController.position.viewportDimension;
    final double edgeLimit = viewport / 3;
    if (offset < edgeLimit) {
      scrollDirection = ScrollDirection.forward;
    }
    lastOffset = offset;

    final userScrollDirection = scrollController.position.userScrollDirection;

    lastUserDirection = userScrollDirection;
    scrollDirection = scrollDirection ?? lastUserDirection;
    switch (scrollDirection) {
      case ScrollDirection.forward:
        // user scroll up - show
        // show();
        break;
      case ScrollDirection.reverse:
        // user scroll down - hide
        // hide();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    final bool showSearchBar = settingsHandler.showBottomSearchbar;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // loading/error text, retry button (goes down with scroll, maybe shrinks to a small version for better fullscreen experience?)
          // + grid scroll buttons on the side (fixed vertical position, if present - change width of loading/error text)
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final double buttonPadding = showSearchBar
                  ? ((MediaQuery.sizeOf(context).width * 0.07) + kMinInteractiveDimension) * reverseAnimValue
                  : 0;

              return Transform.translate(
                offset: Offset(
                  0,
                  showSearchBar ? (MainSearchBar.height + bottomPadding) * animValue : bottomPadding,
                ),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 100),
                  padding: EdgeInsets.only(
                    left: (settingsHandler.scrollGridButtonsPosition == 'Left' ? buttonPadding : 0) + 10,
                    right: (settingsHandler.scrollGridButtonsPosition == 'Right' ? buttonPadding : 0) + 10,
                  ),
                  child: child,
                ),
              );
            },
            child: WaterfallErrorButtons(
              animation: animation,
              showSearchBar: showSearchBar,
            ),
          ),
          if (showSearchBar)
            // search bar (goes out of screen with scroll)
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 100),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: (12 + bottomPadding) * reverseAnimValue,
                    ),
                    child: Transform.translate(
                      offset: Offset(0, (MainSearchBar.height + bottomPadding) * 2 * animValue),
                      child: child,
                    ),
                  ),
                );
              },
              child: Container(
                height: MainSearchBar.height,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const MainSearchBarWithActions('bottom'),
              ),
            ),
        ],
      ),
    );
  }
}

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
      MaterialPageRoute(builder: (_) => SearchQueryEditorPage(subTag: subTag)),
    );
  }

  void onChipLongTap(
    BuildContext context,
    String tag,
    int tagIndex,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SearchQueryEditorPage(
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
        builder: (_) => SearchQueryEditorPage(
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
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: widget.onSearchBackgroundTap,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
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
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
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
                                                  color: Theme.of(context).colorScheme.secondary,
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

class MainSearchTagChip extends StatelessWidget {
  const MainSearchTagChip({
    required this.tag,
    this.tab,
    this.booru,
    this.onTap,
    this.onLongTap,
    this.onDeleteTap,
    this.canDelete = true,
    this.isSelected = false,
    super.key,
  }) : assert(tab != null || booru != null, 'tab or booru must be provided');

  final String tag;
  final SearchTab? tab;
  final Booru? booru;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final VoidCallback? onDeleteTap;
  final bool canDelete;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final searchHandler = SearchHandler.instance;
    final tagHandler = TagHandler.instance;

    return Material(
      color: Colors.transparent,
      child: Builder(
        key: Key(tag),
        builder: (context) {
          String formattedTag = tag;

          final List<Booru> usedBoorus = [
            tab?.selectedBooru.value ?? booru ?? Booru(null, null, null, null, null),
            ...(tab?.secondaryBoorus.value ?? <Booru>[]),
          ];
          final bool hasSecondaryBoorus = usedBoorus.length > 1;

          bool isExclude = formattedTag.startsWith('-');
          bool isOr = formattedTag.startsWith('~');
          bool isBoolMod = isExclude || isOr;
          formattedTag = formattedTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final bool isNumberMod = formattedTag.startsWith(RegExp(r'\d+#'));
          final int? booruNumber = int.tryParse(isNumberMod ? formattedTag.split('#')[0] : '');
          final bool hasBooruNumber = booruNumber != null;
          final bool isValidNumberMod =
              booruNumber != null && booruNumber > 0 && hasSecondaryBoorus && booruNumber <= usedBoorus.length;
          formattedTag = formattedTag.replaceAll(RegExp(r'^\d+#'), '').trim();

          // do it twitce because it will be false for mergebooru
          // (because proper tag query syntax is to place booru number in front of tag and all modifiers)
          isExclude = isExclude || formattedTag.startsWith('-');
          isOr = isOr || formattedTag.startsWith('~');
          isBoolMod = isExclude || isOr;
          formattedTag = formattedTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final String rawTag = formattedTag;

          final metaTags = searchHandler.currentBooruHandler.availableMetaTags();
          final MetaTag? metaTag = metaTags.firstWhereOrNull((p) => p.tagParser(formattedTag).isNotEmpty);
          final Map<String, dynamic>? metaTagParseData = metaTag?.tagParser(formattedTag);
          final bool isMetaTag = metaTagParseData != null && metaTagParseData.isNotEmpty;
          if (isMetaTag) {
            formattedTag = (metaTagParseData['value'] ?? '').trim();
          }

          // get color before removing underscores
          Color tagColor = tagHandler.getTag(formattedTag).getColour();
          if (isMetaTag) tagColor = Colors.pink;
          if (tagColor == Colors.transparent) tagColor = Colors.blue;

          formattedTag = formattedTag.replaceAll('_', ' ').trim();

          return Stack(
            children: [
              Container(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // OR/EXCLUDE
                            if (isBoolMod)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: isExclude
                                      ? Colors.redAccent
                                      : isOr
                                      ? Colors.purpleAccent
                                      : Colors.white.withValues(alpha: 0.8),
                                  border: Border(
                                    right: BorderSide(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    isExclude
                                        ? '—'
                                        : isOr
                                        ? '~'
                                        : '',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            // Multibooru numbers
                            if (isNumberMod && hasBooruNumber) ...[
                              if (isValidNumberMod)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    border: Border(
                                      right: BorderSide(
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          booruNumber.toString(),
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            height: 1,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        BooruFavicon(usedBoorus[booruNumber - 1]),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border(
                                      right: BorderSide(
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '?#',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                            // Metatag
                            if (isMetaTag)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  border: Border(
                                    right: BorderSide(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: switch (metaTag?.type) {
                                    MetaTagType.sort => Icon(
                                      Icons.sort,
                                      color: tagColor,
                                      size: 20,
                                    ),
                                    MetaTagType.date =>
                                      metaTag?.keyName == 'date'
                                          ? Icon(
                                              Icons.calendar_month,
                                              color: tagColor,
                                              size: 20,
                                            )
                                          : Text(
                                              metaTagParseData['key'],
                                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                color: tagColor,
                                                fontWeight: FontWeight.w600,
                                                height: 1,
                                              ),
                                            ),
                                    _ => Text(
                                      metaTagParseData['key'],
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: tagColor,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  },
                                ),
                              ),
                            const SizedBox(width: 10),
                            // Divider
                            if (metaTag is MetaTagWithCompareModes)
                              Builder(
                                builder: (context) {
                                  final mode = metaTag.compareModeFromDivider(metaTag.dividerParser(rawTag));

                                  if (mode.isExact) return const SizedBox.shrink();

                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: FaIcon(
                                        switch (mode) {
                                          CompareMode.exact => FontAwesomeIcons.equals,
                                          CompareMode.less => FontAwesomeIcons.lessThanEqual,
                                          CompareMode.greater => FontAwesomeIcons.greaterThanEqual,
                                        },
                                        size: 12,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            // Value
                            if (metaTag is DateMetaTag)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Builder(
                                    builder: (context) {
                                      final dates = formattedTag
                                          .split(metaTag.valuesDivider)
                                          .map((d) {
                                            final parsedDate = DateTime.tryParse(d);
                                            if (parsedDate == null) {
                                              return d;
                                            }

                                            return DateFormat(
                                              metaTag.prettierDateFormat ?? metaTag.dateFormat,
                                            ).format(parsedDate);
                                          })
                                          .toList()
                                          .join(metaTag.valuesDivider);

                                      return Text(
                                        dates,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          height: 1,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            else
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    formattedTag,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        //
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onTap,
                              onLongPress: onLongTap,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    if (onDeleteTap != null)
                      Material(
                        color: Colors.white.withValues(alpha: 0.8),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          splashColor: Colors.black.withValues(alpha: 0.2),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          onTap: canDelete ? onDeleteTap : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.close_rounded,
                              size: 20,
                              color: canDelete ? tagColor : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              //
              Positioned.fill(
                child: TransparentPointer(
                  // border moved here becuase if it's in the main container, there are rendering artifacts on borderRadius clipping
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SearchQueryEditorPage extends StatefulWidget {
  const SearchQueryEditorPage({
    this.subTag,
    this.tagToEditIndex,
    this.autoFocus = true,
    super.key,
  });

  final String? subTag;
  final int? tagToEditIndex;
  final bool autoFocus;

  @override
  State<SearchQueryEditorPage> createState() => _SearchQueryEditorPageState();
}

class _SearchQueryEditorPageState extends State<SearchQueryEditorPage> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  final ScrollController suggestionsScrollController = ScrollController(),
      tagToEditScrollController = ScrollController();
  final AutoScrollController searchBarScrollController = AutoScrollController();

  late final RichTextController suggestionTextController;
  String get suggestionTextControllerRawInput => suggestionTextController.text
      .replaceAll(RegExp('^-'), '')
      .replaceAll(RegExp('^~'), '')
      .replaceAll(RegExp(r'^\d+#'), '')
      .trim();

  final FocusNode suggestionTextFocusNode = FocusNode();
  final ValueNotifier<bool> suggestionTextFocusNodeHasFocus = ValueNotifier(false);

  bool loading = true, failed = false;
  String? failedMsg;

  String? tagToEdit;
  int? tagToEditIndex;

  List<TagSuggestion> suggestedTags = [];

  CancelToken? cancelToken;

  Timer? debounce;

  @override
  void initState() {
    super.initState();

    final tags = searchHandler.currentBooruHandler.availableMetaTags();

    suggestionTextController = RichTextController(
      text: '',
      onMatch: (_) {},
      onMatchIndex: (_) {},
      regExpDotAll: true,
      regExpMultiLine: true,
      regExpUnicode: true,
      targetMatches:
          [
                ...tags,
                if (tags.isEmpty) GenericMetaTag(),
              ]
              .map(
                (e) => MatchTargetItem(
                  regex: e.keyDividerMatcher,
                  allowInlineMatching: true,
                  deleteOnBack: false,
                  style: TextStyle(
                    color: Colors.pink,
                    backgroundColor: Colors.pink.withValues(alpha: 0.1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              .toList(),
    );

    searchHandler.searchTextController.addListener(onSearchTextChanged);
    suggestionTextController.addListener(onSuggestionTextChanged);
    suggestionTextFocusNode.addListener(suggestionTextFocusListener);

    if (widget.tagToEditIndex != null) {
      onChipTap(
        searchHandler.searchTextControllerTags[widget.tagToEditIndex!],
        widget.tagToEditIndex!,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        searchBarScrollController.scrollToIndex(
          widget.tagToEditIndex!,
          preferPosition: AutoScrollPosition.end,
        );
      });
    } else {
      if (widget.autoFocus) {
        suggestionTextFocusNode.requestFocus();
      }
      runSearch();
    }
  }

  void onSearchTextChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  String _lastSuggestionText = '';
  void onSuggestionTextChanged() {
    // focus change can trigger this too, so we run search only when text changed
    if (suggestionTextController.text != _lastSuggestionText) {
      _lastSuggestionText = suggestionTextController.text;
      runSearch(instant: false);
    }
  }

  void suggestionTextFocusListener() {
    if (mounted) {
      suggestionTextFocusNodeHasFocus.value = suggestionTextFocusNode.hasFocus;
    }
  }

  Future<void> runSearch({
    bool instant = true,
  }) async {
    final handler = searchHandler.currentBooruHandler;
    if (suggestionTextControllerRawInput.isEmpty) {
      debounce?.cancel();
      cancelToken?.cancel();
      loading = false;
      failed = false;
      failedMsg = null;
      suggestedTags.clear();
      setState(() {});

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          suggestionsScrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

      return;
    }

    debounce?.cancel();
    debounce = Timer(
      instant ? Duration.zero : const Duration(milliseconds: 400),
      () async {
        loading = true;
        failed = false;
        failedMsg = null;
        suggestedTags.clear();
        cancelToken?.cancel();
        setState(() {});

        bool isCancelled = false;

        final metaTags = searchHandler.currentBooruHandler.availableMetaTags();
        final MetaTag? metaTag = metaTags.firstWhereOrNull(
          (p) => p.keyParser(suggestionTextControllerRawInput) != null,
        );
        if (metaTag != null) {
          if (metaTag.hasAutoComplete) {
            suggestedTags = await metaTag.getAutoComplete(suggestionTextControllerRawInput);
            suggestedTags.sort((a, b) => a.tag.compareTo(b.tag));
          } else {
            suggestedTags.clear();
          }

          loading = false;
          failed = false;
          failedMsg = null;
          setState(() {});
        } else if (handler.hasTagSuggestions) {
          cancelToken = CancelToken();
          final res = await handler.getTagSuggestions(
            suggestionTextControllerRawInput,
            cancelToken: cancelToken,
          );
          res.fold(
            (e) {
              final errorObj = e.error;
              if (errorObj is DioException && CancelToken.isCancel(errorObj)) {
                isCancelled = true;
                failed = false;
                failedMsg = null;
              } else {
                loading = false;
                failed = true;
                failedMsg = e.statusCode?.toString() ?? e.message;
              }

              setState(() {});
            },
            (data) {
              loading = false;
              failed = false;
              failedMsg = null;
              suggestedTags = data;
              setState(() {});

              for (final tag in suggestedTags.where((t) => !t.type.isNone)) {
                unawaited(tagHandler.addTagsWithType([tag.tag], tag.type));
              }
            },
          );
        } else {
          final databaseSearch = (await settingsHandler.dbHandler.getTags(suggestionTextControllerRawInput, 10)).map((
            tag,
          ) {
            return TagSuggestion(
              tag: tag,
              type: tagHandler.getTag(tag).tagType,
              icon: const Icon(Icons.archive),
            );
          }).toList();

          final historySearch =
              (await settingsHandler.dbHandler.getSearchHistoryByInput(suggestionTextControllerRawInput, 10))
                  .map((tag) {
                    return TagSuggestion(
                      tag: tag,
                      type: tagHandler.getTag(tag).tagType,
                      icon: const Icon(Icons.history),
                    );
                  })
                  .where(
                    (htag) =>
                        !databaseSearch.any((dbtag) => dbtag.tag.trim().toLowerCase() == htag.tag.trim().toLowerCase()),
                  )
                  .toList();

          loading = false;
          failed = false;
          failedMsg = null;
          suggestedTags = [
            ...databaseSearch,
            ...historySearch,
          ];
          suggestedTags.sort((a, b) => a.tag.toLowerCase().compareTo(b.tag.toLowerCase()));
          setState(() {});
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && !isCancelled) {
            suggestionsScrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      },
    );
  }

  void onChipTap(String tag, int tagIndex) {
    if (tagToEditIndex == tagIndex) {
      suggestionTextController.clear();
      tagToEditIndex = null;
      tagToEdit = null;
    } else {
      suggestionTextController.value = TextEditingValue(
        text: tag,
        selection: TextSelection(
          baseOffset: tag.length,
          extentOffset: tag.length,
          affinity: TextAffinity.upstream,
        ),
      );
      suggestionTextFocusNode.requestFocus();

      tagToEditIndex = tagIndex;
      tagToEdit = tag;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        searchBarScrollController.scrollToIndex(
          tagIndex,
          preferPosition: AutoScrollPosition.end,
        );
      });
    }
    setState(() {});

    runSearch();
  }

  void onChipLongTap(String tag, int tagIndex) {
    onChipTap(tag, tagIndex);
  }

  void onChipDeleteTap(String tag, int tagIndex) {
    final List<String> tempTags = searchHandler.searchTextControllerTags..removeAt(tagIndex);
    searchHandler.searchTextController.text = tempTags.join(' ');
    if (tagToEditIndex != null) {
      // TODO update index to closest instead of resetting?
      tagToEditIndex = null;
      tagToEdit = null;
      suggestionTextController.clear();
      setState(() {});
    }
  }

  void onResetTap() {
    searchHandler.searchTextController.text = searchHandler.currentTab.tags.trim();
  }

  void onSearchTap() {
    Navigator.of(context).pop();
    searchHandler.searchTextController.clearComposing();
    searchHandler.searchAction(searchHandler.searchTextController.text, null);
  }

  void onSearchLongTap() {
    Navigator.of(context).pop();
    ServiceHandler.vibrate();
    searchHandler.searchTextController.clearComposing();
    searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
  }

  void onSuggestionTap(
    TagSuggestion tag, {
    bool raw = false,
  }) {
    String tagText = tag.tag;

    if (!raw) {
      final String extrasFromInput = suggestionTextController.text
          .replaceAll(suggestionTextControllerRawInput, '')
          .trim();
      tagText = '$extrasFromInput$tagText';
    }

    final int? itemIndex = tagToEditIndex;
    if (tagToEditIndex != null) {
      final List<String> tempTags = [...searchHandler.searchTextControllerTags];
      tempTags[tagToEditIndex!] = tagText;
      searchHandler.searchTextController.text = tempTags.join(' ');
    } else {
      searchHandler.searchTextController.text = '${searchHandler.searchTextController.text.trim()} $tagText';
    }

    suggestedTags = [];
    suggestionTextController.clear();
    suggestionTextFocusNode.requestFocus();
    tagToEditIndex = null;
    tagToEdit = null;
    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (itemIndex != null) {
        searchBarScrollController.scrollToIndex(
          itemIndex,
          duration: const Duration(milliseconds: 300),
          preferPosition: AutoScrollPosition.end,
        );
      } else {
        searchBarScrollController.animateTo(
          searchBarScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    runSearch();
  }

  Future<void> onSuggestionLongTap(TagSuggestion tag) async {
    // TODO add more actions? hate/fave +-, add as exclude, add with multibooru number?
    await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      page: (_) {
        return SettingsBottomSheet(
          contentItems: [
            const SizedBox(height: 16),
            TagSuggestionText(tag: tag, isExpanded: false),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Add'),
              leading: const Icon(Icons.add_rounded),
              onTap: () async {
                onSuggestionTap(tag);
                Navigator.of(context).pop();
              },
            ),
            if (searchHandler.currentBooru.type != BooruType.Merge) TagContentPreview(tag: tag.tag),
            ListTile(
              title: const Text('Copy'),
              leading: const Icon(Icons.copy),
              onTap: () async {
                final tagText = tag.tag;

                await Clipboard.setData(ClipboardData(text: tagText));
                FlashElements.showSnackbar(
                  context: context,
                  title: const Text('Copied!', style: TextStyle(fontSize: 20)),
                  content: Text('Copied "$tagText" to clipboard'),
                  sideColor: Colors.green,
                  leadingIcon: Icons.check,
                  leadingIconColor: Colors.green,
                  duration: const Duration(seconds: 2),
                );
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom),
          ],
        );
      },
    ).open();
  }

  void onSuggestionTextSubmitted(String text) {
    if (text.isNotEmpty) {
      onSuggestionTap(TagSuggestion(tag: text), raw: true);
    } else {
      onSearchTap();
    }
  }

  Future<void> onMetatagSelect(AddMetatagBottomSheetResult result) async {
    final tag = result.tag.tagBuilder(
      null,
      result.compareMode == null ? null : (result.tag as MetaTagWithCompareModes).dividerForMode(result.compareMode),
      result.value,
    );
    if (result.shouldAddDirectly) {
      onSuggestionTap(TagSuggestion(tag: tag));
    } else {
      suggestionTextController.text = tag;
    }
    suggestionTextFocusNode.requestFocus();
  }

  double get keyboardActionsHeight => 44;

  KeyboardActionsConfig buildConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: suggestionTextFocusNode,
          displayActionBar: false,
          displayArrows: false,
          displayDoneButton: false,
          footerBuilder: (_) => PreferredSize(
            preferredSize: Size.fromHeight(keyboardActionsHeight),
            child: KeyboardVisibilityBuilder(
              builder: (context, isKbVisible) {
                final buttonStyle = Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  fixedSize: WidgetStateProperty.all<Size>(
                    Size(keyboardActionsHeight, keyboardActionsHeight),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(
                      4,
                      isKbVisible ? 4 : 0,
                      4,
                      4,
                    ),
                  ),
                );

                return Container(
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  height: keyboardActionsHeight - 4,
                  color: Theme.of(context).colorScheme.surface,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add '_' at current cursor position
                          final String beforeSelection = suggestionTextController.selection.textBefore(
                            suggestionTextController.text,
                          );
                          // final String insideSelection = searchHandler.searchTextController.selection.textInside(searchHandler.searchTextController.text);
                          final String afterSelection = suggestionTextController.selection.textAfter(
                            suggestionTextController.text,
                          );
                          suggestionTextController.text = '${beforeSelection}_$afterSelection';
                          // set cursor to the end when tapped unfocused
                          suggestionTextController.selection = TextSelection(
                            baseOffset: beforeSelection.length + 1,
                            extentOffset: beforeSelection.length + 1,
                            affinity: TextAffinity.upstream,
                          );
                        },
                        style: buttonStyle?.copyWith(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(
                              4,
                              isKbVisible ? 4 : 0,
                              4,
                              8,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: isKbVisible ? Alignment.bottomCenter : Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 4,
                            ),
                            child: SizedBox(
                              width: 30,
                              height: 3,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
                          final String copied = cdata?.text ?? '';
                          if (copied.isNotEmpty) {
                            suggestionTextController.text =
                                '${suggestionTextController.text}${(suggestionTextController.text.isEmpty || suggestionTextController.text.endsWith(' ')) ? '' : ' '}$copied';
                            suggestionTextController.selection = TextSelection(
                              baseOffset: suggestionTextController.text.length,
                              extentOffset: suggestionTextController.text.length,
                              affinity: TextAffinity.upstream,
                            );
                          }
                        },
                        style: buttonStyle,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: isKbVisible ? 0 : 20),
                          child: Icon(
                            Icons.paste,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: suggestionTextFocusNode.unfocus,
                        style: buttonStyle,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: isKbVisible ? 0 : 20),
                          child: Icon(
                            Icons.keyboard_hide,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ValueListenableBuilder(
                        valueListenable: suggestionTextController,
                        builder: (context, _, _) {
                          return ElevatedButton(
                            onPressed: suggestionTextControllerRawInput.isEmpty
                                ? onSearchTap
                                : () => onSuggestionTextSubmitted(suggestionTextController.text),
                            onLongPress: suggestionTextControllerRawInput.isEmpty
                                ? onSearchLongTap
                                : () => onSuggestionLongTap(TagSuggestion(tag: suggestionTextControllerRawInput)),
                            style: buttonStyle,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: isKbVisible ? 0 : 20),
                              child: Icon(
                                suggestionTextControllerRawInput.isEmpty ? Icons.search : Icons.add_rounded,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchHandler.searchTextController.removeListener(onSearchTextChanged);
    suggestionTextFocusNode.removeListener(suggestionTextFocusListener);
    suggestionTextFocusNode.dispose();
    suggestionTextController.removeListener(onSuggestionTextChanged);
    suggestionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Expanded(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Scrollbar(
                  controller: suggestionsScrollController,
                  interactive: true,
                  scrollbarOrientation: settingsHandler.handSide.value.isLeft
                      ? ScrollbarOrientation.left
                      : ScrollbarOrientation.right,
                  child: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    strokeWidth: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    // edgeOffset: MediaQuery.paddingOf(context).top,
                    onRefresh: runSearch,
                    child: FadingEdgeScrollView.fromScrollView(
                      child: ListView.builder(
                        reverse: !settingsHandler.useTopSearchbarInput,
                        controller: suggestionsScrollController,
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top + 16,
                          bottom: 12,
                        ),
                        itemCount: suggestedTags.isEmpty ? 1 : min(100, suggestedTags.length),
                        itemBuilder: (context, index) {
                          if (suggestedTags.isEmpty) {
                            if (loading) {
                              return const SizedBox.shrink();
                            } else if (failed) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: runSearch,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.refresh),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              'Failed to load suggestions, tap to retry${failedMsg?.isNotEmpty == true ? '\n\n[$failedMsg]' : ''}',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }

                            if (suggestionTextControllerRawInput.isEmpty) {
                              return SuggestionsMainContent(
                                onMetatagSelect: onMetatagSelect,
                              );
                            }

                            return Center(
                              child: Container(
                                height: constraints.maxHeight - 32,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Kaomoji(
                                      type: KaomojiType.shrug,
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    Text(
                                      searchHandler.currentBooruHandler.hasTagSuggestions
                                          ? 'No suggestions found'
                                          : 'Tag suggestions are not available for this booru',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final TagSuggestion tag = suggestedTags[index];

                          return Container(
                            height: kMinInteractiveDimension + (tag.hasDescription ? 8 : 0),
                            alignment: Alignment.centerLeft,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => onSuggestionTap(tag),
                                onLongPress: () => onSuggestionLongTap(tag),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      if (tag.icon != null)
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: tag.icon,
                                        ),
                                      //
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TagSuggestionText(
                                              tag: tag,
                                              searchText: suggestionTextControllerRawInput,
                                            ),
                                            if (tag.hasDescription)
                                              Text(
                                                tag.description!,
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.onSurface.withValues(alpha: 0.66),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      //
                                      if (tag.count > 0)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(
                                            // TODO locale
                                            NumberFormat.compact(locale: 'en').format(tag.count),
                                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.66),
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            //
            if (loading)
              const Positioned(
                bottom: 16,
                right: 16,
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      // Search bar
      SizedBox(
        height: MainSearchBar.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Hero(
            tag: 'mainSearchBar-${widget.subTag}',
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
              ),
              child: MainSearchBar(
                onChipTap: onChipTap,
                onChipLongTap: onChipLongTap,
                onChipDeleteTap: onChipDeleteTap,
                onResetTap: onResetTap,
                onSearchTap: onSearchTap,
                onSearchLongTap: onSearchLongTap,
                scrollController: searchBarScrollController,
                selectedTagIndex: tagToEditIndex,
              ),
            ),
          ),
        ),
      ),
      // Suggestions text input
      KeyboardActions(
        enable: settingsHandler.showSearchbarQuickActions && (Platform.isAndroid || Platform.isIOS),
        config: buildConfig(),
        autoScroll: false,
        overscroll: 0,
        isDialog: false,
        child: ValueListenableBuilder(
          valueListenable: suggestionTextFocusNodeHasFocus,
          builder: (context, suggestionTextFocusNodeHasFocus, _) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SettingsTextInput(
                  controller: suggestionTextController,
                  focusNode: suggestionTextFocusNode,
                  title: 'Search for tags',
                  hintText: 'Search for tags',
                  clearable: true,
                  onSubmitted: onSuggestionTextSubmitted,
                  onSubmittedLongTap: (_) => onSuggestionLongTap(
                    TagSuggestion(tag: suggestionTextControllerRawInput),
                  ),
                  onlyInput: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  textInputAction: TextInputAction.search,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                  showSubmitButton: (text) => !settingsHandler.showSearchbarQuickActions && text.isNotEmpty,
                  submitIcon: Icons.add_rounded,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              //
              if (settingsHandler.useTopSearchbarInput)
                const SizedBox(height: 4)
              else if (settingsHandler.showSearchbarQuickActions && (Platform.isAndroid || Platform.isIOS))
                KeyboardVisibilityBuilder(
                  builder: (context, isKbVisible) {
                    return AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        width: double.infinity,
                        height:
                            (isKbVisible || (suggestionTextFocusNodeHasFocus && (Platform.isAndroid || Platform.isIOS)))
                            ? 0 // keyboardActionsHeight
                            : MediaQuery.paddingOf(context).bottom,
                        // child: ColoredBox(color: Colors.yellow.withValues(alpha: 0.2)),
                      ),
                    );
                  },
                )
              else
                SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ),
    ];

    if (settingsHandler.useTopSearchbarInput) {
      widgets = widgets.reversed.toList();
      if (settingsHandler.showSearchbarQuickActions) {
        widgets.add(
          KeyboardVisibilityBuilder(
            builder: (context, isKbVisible) {
              return isKbVisible ? SizedBox(height: keyboardActionsHeight) : const SizedBox.shrink();
            },
          ),
        );
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: settingsHandler.useTopSearchbarInput,
        bottom: settingsHandler.useTopSearchbarInput,
        child: Column(
          children: widgets,
        ),
      ),
    );
  }
}

class TagSuggestionText extends StatelessWidget {
  const TagSuggestionText({
    required this.tag,
    this.searchText = '',
    this.isExpanded = true,
    super.key,
  });

  final TagSuggestion tag;
  final String searchText;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final tagHandler = TagHandler.instance;

    Color tagColor = !tag.type.isNone ? tag.type.getColour() : tagHandler.getTag(tag.tag).getColour();
    if (tagColor == Colors.transparent) tagColor = Theme.of(context).colorScheme.onSurface;

    //

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: tagColor,
      fontWeight: FontWeight.w400,
      height: 1,
    );

    final bool isMultiword = tag.tag.split(' ').length > 1;

    final List<TextSpan> spans = [];
    if (searchText.isNotEmpty) {
      final List<String> split = tag.tag.split(searchText);
      for (int i = 0; i < split.length; i++) {
        spans.add(
          TextSpan(
            text: isMultiword ? split[i] : split[i].replaceAll('_', ' '),
            style: style,
          ),
        );
        if (i < split.length - 1) {
          spans.add(
            TextSpan(
              text: isMultiword ? searchText : searchText.replaceAll('_', ' '),
              style: style?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
      }
    } else {
      spans.add(
        TextSpan(
          text: isMultiword ? tag.tag : tag.tag.replaceAll('_', ' '),
          style: style?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return MarqueeText.rich(
      textSpan: TextSpan(children: spans),
      style: style,
      isExpanded: isExpanded,
    );
  }
}

//

class AddMetatagBottomSheetResult {
  AddMetatagBottomSheetResult({
    required this.tag,
    this.compareMode,
    this.value,
  });

  final MetaTag tag;
  final CompareMode? compareMode;
  final String? value;

  bool get shouldAddDirectly => switch (tag.runtimeType) {
    const (MetaTagWithCompareModes) => compareMode != null && value != null,
    const (MetaTagWithValues) => value != null,
    _ => false,
  };
}

class AddMetatagBottomSheet extends StatelessWidget {
  const AddMetatagBottomSheet(
    this.scrollController, {
    super.key,
  });

  final ScrollController? scrollController;

  void onOptionSelect(
    BuildContext context,
    MetaTag tag, {
    CompareMode? compareMode,
    String? value,
  }) {
    Navigator.of(context).pop(
      AddMetatagBottomSheetResult(
        tag: tag,
        compareMode: compareMode,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchHandler = SearchHandler.instance;

    final metaTags = searchHandler.currentBooruHandler.availableMetaTags();
    if (metaTags.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }

    return SettingsBottomSheet(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Metatags',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 12),
          Text(
            metaTags.length.toString(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      contentPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      scrollController: scrollController,
      contentItems: [
        const SizedBox(height: 16),
        if (metaTags.any((t) => t.isFree))
          Container(
            margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline_rounded),
                    const SizedBox(width: 8),
                    Text(
                      'Free metatags',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Free metatags do not count against the tag search limits',
                ),
              ],
            ),
          ),
        //
        for (final tag in metaTags)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                switch (tag.type) {
                  case MetaTagType.date:
                    final metaTag = tag as DateMetaTag;
                    final res = await showSingleDatePicker(
                      context,
                      dateFormat: metaTag.dateFormat,
                    );

                    if (res is DateTime) {
                      onOptionSelect(
                        context,
                        tag,
                        compareMode: null,
                        value: DateFormat(metaTag.dateFormat).format(res),
                      );
                    }
                    break;
                  default:
                    onOptionSelect(context, tag);
                    break;
                }
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 56),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tag.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    tag.keyName,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.66),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (tag.isFree)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surfaceContainer.withValues(alpha: 0.66),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Free',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            //
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      //
                      switch (tag.type) {
                        MetaTagType.date => Builder(
                          builder: (context) {
                            final metaTag = tag as DateMetaTag;
                            return Row(
                              spacing: 6,
                              children: [
                                IconButton.outlined(
                                  onPressed: () async {
                                    final res = await showSingleDatePicker(
                                      context,
                                      dateFormat: metaTag.dateFormat,
                                    );

                                    if (res is DateTime) {
                                      onOptionSelect(
                                        context,
                                        tag,
                                        compareMode: null,
                                        value: DateFormat(metaTag.dateFormat).format(res),
                                      );
                                    }
                                  },
                                  icon: metaTag.supportsRange
                                      ? const Text('Single')
                                      : const Icon(Icons.calendar_month_rounded),
                                ),
                                if (metaTag.supportsRange)
                                  IconButton.outlined(
                                    onPressed: () async {
                                      final res = await showRangeDatePicker(
                                        context,
                                        dateFormat: metaTag.dateFormat,
                                      );

                                      if (res is List<DateTime> && res.length == 2) {
                                        onOptionSelect(
                                          context,
                                          tag,
                                          compareMode: null,
                                          value:
                                              DateFormat(metaTag.dateFormat).format(res[0]) +
                                              metaTag.valuesDivider +
                                              DateFormat(metaTag.dateFormat).format(res[1]),
                                        );
                                      }
                                    },
                                    icon: const Text('Range'),
                                  ),
                                if (metaTag.supportsRange) const Icon(Icons.calendar_month_rounded),
                              ],
                            );
                          },
                        ),
                        MetaTagType.sort => const Icon(Icons.sort_rounded),
                        MetaTagType.comparableNumber => Row(
                          spacing: 2,
                          children: [
                            for (final mode in (tag as MetaTagWithCompareModes).compareModes)
                              IconButton.outlined(
                                onPressed: () => onOptionSelect(context, tag, compareMode: mode),
                                icon: FaIcon(
                                  switch (mode) {
                                    CompareMode.exact => FontAwesomeIcons.equals,
                                    CompareMode.less => FontAwesomeIcons.lessThanEqual,
                                    CompareMode.greater => FontAwesomeIcons.greaterThanEqual,
                                  },
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                        _ => const SizedBox.shrink(),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class SuggestionsMainContent extends StatefulWidget {
  const SuggestionsMainContent({
    required this.onMetatagSelect,
    super.key,
  });

  final void Function(AddMetatagBottomSheetResult result) onMetatagSelect;

  @override
  State<SuggestionsMainContent> createState() => _SuggestionsMainContentState();
}

class _SuggestionsMainContentState extends State<SuggestionsMainContent> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HistoryBlock(),
        MetatagsBlock(onSelect: widget.onMetatagSelect),
        const SizedBox(height: 16),
        //
        // TODO popular tags on boorus which support it (danbooru has it, possibly sankaku too)
        if (false)
          // ignore: dead_code
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.trending_up_rounded,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Popular',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 200,
                            child: SettingsBooruDropdown(
                              value: null,
                              onChanged: (booru) {},
                              title: 'Booru',
                              placeholder: 'Select',
                              drawBottomBorder: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: FadingEdgeScrollView.fromScrollView(
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Placeholder(fallbackWidth: 150),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        //
        // TODO block with pinned/favourite (need to decide on the name) search queries, with dialog where you can sort/fav/label/search them
        if (false)
          // ignore: dead_code
          Column(
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.favorite_rounded,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Favourties',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // TODO bottomsheet with search
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text(
                                '[All]',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO edit/search/filter dialog for fav tags, which can have multiple labels to allow filtering them
                        },
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: FadingEdgeScrollView.fromScrollView(
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Placeholder(fallbackWidth: 150),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        //
        const SizedBox(height: 16),
      ],
    );
  }
}

Future<DateTime?> showSingleDatePicker(
  BuildContext context, {
  String? dateFormat,
}) async {
  final res = await SettingsPageOpen(
    context: context,
    asBottomSheet: true,
    bottomSheetExpandableByScroll: false,
    page: (_) => SingleDatePickerBottomSheet(
      dateFormat: dateFormat,
    ),
  ).open();

  if (res is DateTime) {
    return res;
  }

  return null;
}

class SingleDatePickerBottomSheet extends StatefulWidget {
  const SingleDatePickerBottomSheet({
    this.dateFormat,
    super.key,
  });

  final String? dateFormat;

  @override
  State<SingleDatePickerBottomSheet> createState() => _SingleDatePickerBottomSheetState();
}

class _SingleDatePickerBottomSheetState extends State<SingleDatePickerBottomSheet> {
  List<DateTime> date = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: Text(
        'Select date',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      contentItems: [
        const SizedBox(height: 16),
        Text(
          DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(date.first),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectedDayHighlightColor: Theme.of(context).colorScheme.secondary,
          ),
          value: date,
          onValueChanged: (value) => setState(() => date = value),
        ),
      ],
      actionButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 12,
          children: [
            const CancelButton(withIcon: true),
            ConfirmButton(
              returnData: date.first,
              withIcon: true,
            ),
          ],
        ),
      ],
    );
  }
}

Future<List<DateTime>?> showRangeDatePicker(
  BuildContext context, {
  String? dateFormat,
}) async {
  final res = await SettingsPageOpen(
    context: context,
    asBottomSheet: true,
    bottomSheetExpandableByScroll: false,
    page: (_) => RangeDatePickerBottomSheet(
      dateFormat: dateFormat,
    ),
  ).open();

  if (res is List<DateTime>) {
    return res;
  }

  return null;
}

class RangeDatePickerBottomSheet extends StatefulWidget {
  const RangeDatePickerBottomSheet({
    this.dateFormat,
    super.key,
  });

  final String? dateFormat;

  @override
  State<RangeDatePickerBottomSheet> createState() => _RangeDatePickerBottomSheetState();
}

class _RangeDatePickerBottomSheetState extends State<RangeDatePickerBottomSheet> {
  List<DateTime> range = [
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: Text(
        'Select dates range',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      contentItems: [
        const SizedBox(height: 16),
        Text(
          // ignore: prefer_interpolation_to_compose_strings
          DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(range.first) +
              ' - ' +
              DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(range.last),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.range,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectedDayHighlightColor: Theme.of(context).colorScheme.secondary,
          ),
          value: range,
          onValueChanged: (value) => setState(() => range = value),
        ),
      ],
      actionButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 12,
          children: [
            const CancelButton(withIcon: true),
            ConfirmButton(
              returnData: range,
              withIcon: true,
            ),
          ],
        ),
      ],
    );
  }
}

class HistoryBlock extends StatefulWidget {
  const HistoryBlock({super.key});

  @override
  State<HistoryBlock> createState() => _HistoryBlockState();
}

class _HistoryBlockState extends State<HistoryBlock> {
  final settingsHandler = SettingsHandler.instance;
  final searchHandler = SearchHandler.instance;

  List<HistoryItem> history = [];
  bool loading = true;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    loading = true;
    setState(() {});
    history = await settingsHandler.dbHandler.getLatestSearchHistory();
    loading = false;
    setState(() {});
  }

  Future<void> showHistoryEntryActions(Widget row, HistoryItem entry, Booru? booru) async {
    await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      page: (_) {
        return SettingsBottomSheet(
          contentItems: [
            const SizedBox(width: double.maxFinite),
            Align(alignment: Alignment.center, child: row),
            const SizedBox(height: 10),
            Text('Last search: ${formatDate(entry.timestamp)}', textAlign: TextAlign.center),
            //
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (booru != null) {
                  searchHandler.searchTextController.text = entry.searchText;
                  searchHandler.searchAction(entry.searchText, booru);
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: const Text('Unknown Booru type!', style: TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.open_in_browser),
              label: const Text('Open'),
            ),
            //
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                if (booru != null) {
                  searchHandler.searchTextController.text = entry.searchText;
                  searchHandler.addTabByString(
                    entry.searchText,
                    customBooru: booru,
                    switchToNew: true,
                  );
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: const Text('Unknown Booru type!', style: TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Open in new tab'),
            ),
            //
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: entry.searchText));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: const Text('Copied to clipboard!', style: TextStyle(fontSize: 20)),
                  content: Text(entry.searchText, style: const TextStyle(fontSize: 16)),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy'),
            ),
          ],
        );
      },
    ).open();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!settingsHandler.dbEnabled || (history.isEmpty && !loading)) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.history_rounded,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'History',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    SettingsPageOpen(
                      context: context,
                      page: (_) => const HistoryList(),
                    ).open();
                  },
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: FadingEdgeScrollView.fromScrollView(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: (history.isEmpty && loading) ? 1 : history.length,
              itemBuilder: (BuildContext context, int index) {
                if (history.isEmpty) {
                  return GestureDetector(
                    onTap: init,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }

                final item = history[index];
                final booru = settingsHandler.booruList.value.firstWhere(
                  (b) => b.name == item.booruName && b.type == item.booruType,
                  orElse: () => Booru(null, null, null, null, null),
                );

                const favIcon = Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 16,
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InputChip(
                    avatar: BooruFavicon(booru),
                    onPressed: () => showHistoryEntryActions(
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BooruFavicon(booru),
                            const SizedBox(width: 8),
                            Flexible(child: Text(item.searchText)),
                            if (item.isFavourite) favIcon,
                          ],
                        ),
                      ),
                      item,
                      booru,
                    ),
                    label: Text(item.searchText),
                    onDeleted: item.isFavourite ? () {} : null,
                    deleteIcon: item.isFavourite ? favIcon : null,
                    deleteButtonTooltipMessage: '',
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MetatagsBlock extends StatefulWidget {
  const MetatagsBlock({
    required this.onSelect,
    super.key,
  });

  final Function(AddMetatagBottomSheetResult) onSelect;

  @override
  State<MetatagsBlock> createState() => _MetatagsBlockState();
}

class _MetatagsBlockState extends State<MetatagsBlock> {
  final searchHandler = SearchHandler.instance;
  final scrollController = ScrollController();

  Future<void> openMetatagsDialog() async {
    final res = await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      bottomSheetExpandableByScroll: true,
      page: AddMetatagBottomSheet.new,
    ).open();

    if (res is AddMetatagBottomSheetResult) {
      widget.onSelect(res);
    }
  }

  void onOptionSelect(
    BuildContext context,
    MetaTag tag, {
    CompareMode? compareMode,
    String? value,
  }) {
    widget.onSelect(
      AddMetatagBottomSheetResult(
        tag: tag,
        compareMode: compareMode,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<MetaTag> metaTags = searchHandler.currentBooruHandler.availableMetaTags();
    bool overflows = false;
    if (metaTags.length > 15) {
      // show only first 15 tags (only danbooru has this much right now) to motivate user to open bottom sheet dialog with full list
      metaTags = metaTags.sublist(0, 15);
      overflows = true;
    }

    if (metaTags.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () => scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.filter_list,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Metatags',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: 8),
                if (searchHandler.currentBooruHandler.metatagsCheatSheetLink != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () {
                        launchUrlString(
                          searchHandler.currentBooruHandler.metatagsCheatSheetLink!,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      icon: const Icon(Icons.help_outline_rounded),
                    ),
                  ),
                IconButton(
                  onPressed: openMetatagsDialog,
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: FadingEdgeScrollView.fromScrollView(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: metaTags.length + (overflows ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (overflows && index == metaTags.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      label: const Text('...'),
                      onPressed: openMetatagsDialog,
                    ),
                  );
                }

                final tag = metaTags[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActionChip(
                    label: Text(tag.name),
                    avatar: switch (tag.type) {
                      MetaTagType.date => Icon(
                        Icons.calendar_month_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      MetaTagType.sort => Icon(
                        Icons.sort_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      _ => null,
                    },
                    onPressed: () async {
                      switch (tag.type) {
                        case MetaTagType.date:
                          final metaTag = tag as DateMetaTag;
                          final res = await showSingleDatePicker(
                            context,
                            dateFormat: metaTag.dateFormat,
                          );

                          if (res is DateTime) {
                            onOptionSelect(
                              context,
                              tag,
                              compareMode: null,
                              value: DateFormat(metaTag.dateFormat).format(res),
                            );
                          }
                          break;
                        default:
                          onOptionSelect(context, tag);
                          break;
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
