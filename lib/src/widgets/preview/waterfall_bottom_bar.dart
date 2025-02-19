import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/search_modifier.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_error_buttons.dart';

// all the scroll stuff is just experiments,

// current implementation listens to MainAppBar visibility changes
// and shows/hides bottom bar as soon as it reaches starting height/leaves screen

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
    final ScrollDirection direction = delta == 0 ? ScrollDirection.idle : (delta > 0 ? ScrollDirection.forward : ScrollDirection.reverse);
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

  void positionListener() {}

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // loading/error text, retry button (goes down with scroll, maybe shrinks to a small version for better fullscreen experience?)
          // + grid scroll buttons on the side (fixed vertical position, if present - change width of loading/error text)
          AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              final double buttonPadding = ((MediaQuery.sizeOf(context).width * 0.07) + kMinInteractiveDimension) * reverseAnimValue;

              return Transform.translate(
                offset: Offset(0, (MainSearchBar.height + bottomPadding) * animValue),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: EdgeInsets.only(
                    left: settingsHandler.scrollGridButtonsPosition == 'Left' ? buttonPadding : 0,
                    right: settingsHandler.scrollGridButtonsPosition == 'Right' ? buttonPadding : 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // TODO rewrite it to change height/bg/border on scroll
                    child: WaterfallErrorButtons(compact: animValue == 1),
                  ),
                ),
              );
            },
          ),
          // search bar (goes out of screen with scroll)
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return AnimatedSize(
                duration: const Duration(milliseconds: 100),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12 * reverseAnimValue,
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
      MaterialPageRoute(builder: (_) => SearchQueryEditorPage(subTag: subTag)),
    );
  }

  void onResetTap() {
    searchHandler.searchTextController.text = searchHandler.currentTab.tags.trim();
  }

  void onSearchTap() {
    searchHandler.searchTextController.clearComposing();
    searchHandler.searchBoxFocus.unfocus();
    searchHandler.searchAction(searchHandler.searchTextController.text, null);
  }

  void onSearchLongTap() {
    ServiceHandler.vibrate();
    searchHandler.searchTextController.clearComposing();
    searchHandler.searchBoxFocus.unfocus();
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
  final void Function(String, int) onChipLongTap;
  final void Function(String, int) onChipDeleteTap;
  final VoidCallback onResetTap;
  final VoidCallback onSearchTap;
  final VoidCallback onSearchLongTap;
  final VoidCallback? onSearchBackgroundTap;
  final AutoScrollController? scrollController;
  final String? selectedTag;
  final int? selectedTagIndex;
  final String? subTag;

  static double height = 48;

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
    periodicUpdateTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => onTextChanged(),
    );
  }

  void onTextChanged() {
    parseTags();

    final String? prevTabId = currentTabId;
    if (prevTabId != searchHandler.currentTabId) {
      scrollToStart();
      currentTabId = searchHandler.currentTabId;
    }

    setState(() {});
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
                        // TODO make list reorderable?
                        child: ListView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          // scrollconfig allows to control physics outside of the widget
                          physics: tags.isEmpty ? const NeverScrollableScrollPhysics() : ScrollConfiguration.of(context).getScrollPhysics(context),
                          padding: const EdgeInsets.fromLTRB(8, 8, 60, 8),
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
                                        onLongTap: () => widget.onChipLongTap(tags[i], i),
                                        onDeleteTap: () => widget.onChipDeleteTap(tags[i], i),
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
                              color: Colors.white.withValues(alpha: 0.8),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black.withValues(alpha: 0.5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.black.withValues(alpha: 0.2),
                                  onTap: searchHandler.searchTextController.clear,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    //
                    Obx(
                      () {
                        if (searchHandler.currentTab.tags.trim() != tags.join(' ')) {
                          return Material(
                            key: const Key('reset-button'),
                            color: Colors.white.withValues(alpha: 0.8),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.black.withValues(alpha: 0.2),
                                onTap: widget.onResetTap,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Icon(
                                    Icons.refresh,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    //
                    Material(
                      key: const Key('search-button'),
                      color: Colors.white.withValues(alpha: 0.8),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.black.withValues(alpha: 0.5),
                              width: 1,
                            ),
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.black.withValues(alpha: 0.2),
                          onTap: widget.onSearchTap,
                          onLongPress: widget.onSearchLongTap,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search_rounded,
                              size: 24,
                              color: Colors.black,
                            ),
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

  Map<RegExp, SearchModifierType> get searchModsPatterns => {
        RegExp('^sort:'): SearchModifierType.sort,
        RegExp('^order:'): SearchModifierType.sort,
        RegExp('^date:'): SearchModifierType.date,
        RegExp(r'^\w+:'): SearchModifierType.string,
      };

  @override
  Widget build(BuildContext context) {
    final TagHandler tagHandler = TagHandler.instance;

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

          final bool isExclude = formattedTag.startsWith('-');
          final bool isOr = formattedTag.startsWith('~');
          final bool isBoolMod = isExclude || isOr;
          formattedTag = formattedTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final bool isNumberMod = formattedTag.startsWith(RegExp(r'\d+#'));
          final int? booruNumber = int.tryParse(isNumberMod ? tag.split('#')[0] : '');
          final bool hasBooruNumber = booruNumber != null;
          final bool isValidNumberMod = booruNumber != null && booruNumber > 0 && hasSecondaryBoorus && booruNumber <= usedBoorus.length;
          formattedTag = formattedTag.replaceAll(RegExp(r'^\d+#'), '').trim();

          final MapEntry<RegExp, SearchModifierType>? searchModPattern = searchModsPatterns.entries.firstWhereOrNull((p) => p.key.hasMatch(formattedTag));
          final String searchMod = searchModPattern?.key.stringMatch(formattedTag)?.replaceAll(':', '') ?? '';
          final bool isSearchMod = searchMod.isNotEmpty;
          formattedTag = formattedTag.replaceAll(searchModPattern?.key ?? RegExp(''), '').trim();

          // get color before removing underscores
          Color tagColor = tagHandler.getTag(formattedTag).getColour();
          if (isSearchMod) tagColor = Colors.pink;
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
                            //
                            if (isSearchMod)
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
                                  child: switch (searchModPattern?.value) {
                                    SearchModifierType.sort => Icon(
                                        Icons.sort,
                                        color: tagColor,
                                        size: 20,
                                      ),
                                    SearchModifierType.date => Icon(
                                        Icons.calendar_month,
                                        color: tagColor,
                                        size: 20,
                                      ),
                                    _ => Text(
                                        searchMod,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              color: tagColor,
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                      ),
                                  },
                                ),
                              ),
                            //
                            const SizedBox(width: 10),
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

  final ScrollController suggestionsScrollController = ScrollController(), tagToEditScrollController = ScrollController();
  final AutoScrollController searchBarScrollController = AutoScrollController();

  final TextEditingController suggestionTextController = TextEditingController();
  String get suggestionTextControllerRawInput =>
      suggestionTextController.text.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').replaceAll(RegExp(r'^\d+#'), '').trim();

  final FocusNode suggestionTextFocusNode = FocusNode();
  final ValueNotifier<bool> suggestionTextFocusNodeHasFocus = ValueNotifier(false);

  bool loading = true, failed = false;

  String? tagToEdit;
  int? tagToEditIndex;

  List<String> suggestedTags = [];

  CancelToken? cancelToken;

  Timer? debounce;

  @override
  void initState() {
    super.initState();

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

  void onSuggestionTextChanged() {
    runSearch(instant: false);
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
    if (handler.hasTagSuggestions) {
      debounce?.cancel();
      debounce = Timer(
        instant ? Duration.zero : const Duration(milliseconds: 300),
        () async {
          loading = true;
          failed = false;
          setState(() {});

          cancelToken?.cancel();
          cancelToken = CancelToken();

          suggestedTags = await handler.tagSearch(
            suggestionTextControllerRawInput,
            cancelToken: cancelToken,
          );

          loading = false;
          failed = false;
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
        },
      );
    } else {
      loading = false;
      failed = false;
      setState(() {});
    }
  }

  void onChipTap(String tag, int tagIndex) {
    // TODO ui edit for search mods?
    if (tagToEditIndex == tagIndex) {
      suggestionTextController.clear();
      tagToEditIndex = null;
      tagToEdit = null;
    } else {
      suggestionTextFocusNode.requestFocus();
      suggestionTextController.value = TextEditingValue(
        text: tag,
        selection: TextSelection(
          baseOffset: tag.length,
          extentOffset: tag.length,
          affinity: TextAffinity.upstream,
        ),
      );

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
    // TODO raw text edit for search mods?
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
    searchHandler.searchBoxFocus.unfocus();
    searchHandler.searchAction(searchHandler.searchTextController.text, null);
  }

  void onSearchLongTap() {
    Navigator.of(context).pop();
    ServiceHandler.vibrate();
    searchHandler.searchTextController.clearComposing();
    searchHandler.searchBoxFocus.unfocus();
    searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
  }

  void onSuggestionTap(
    String tag, {
    bool raw = false,
  }) {
    String tagWithExtras = tag;

    if (!raw) {
      final String extrasFromInput = suggestionTextController.text.replaceAll(suggestionTextControllerRawInput, '').trim();
      tagWithExtras = '$extrasFromInput$tag';
    }

    final int? itemIndex = tagToEditIndex;
    if (tagToEditIndex != null) {
      final List<String> tempTags = [...searchHandler.searchTextControllerTags];
      tempTags[tagToEditIndex!] = tagWithExtras;
      searchHandler.searchTextController.text = tempTags.join(' ');
    } else {
      searchHandler.searchTextController.text = '${searchHandler.searchTextController.text.trim()} $tagWithExtras';
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

  void onSuggestionLongTap(String tag) {
    Clipboard.setData(ClipboardData(text: tag));
    FlashElements.showSnackbar(
      context: context,
      title: const Text('Copied!', style: TextStyle(fontSize: 20)),
      content: Text('Copied "$tag" to clipboard'),
      sideColor: Colors.green,
      leadingIcon: Icons.check,
      leadingIconColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
  }

  void onSuggestionSubmitted(String text) {
    if (text.isNotEmpty) {
      onSuggestionTap(text, raw: true);
    }
  }

  KeyboardActionsConfig buildConfig() {
    const double buttonHeight = kMinInteractiveDimension;

    final buttonStyle = Theme.of(context).elevatedButtonTheme.style?.copyWith(
          fixedSize: WidgetStateProperty.all<Size>(
            const Size(buttonHeight, buttonHeight),
          ),
        );

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
            preferredSize: const Size.fromHeight(buttonHeight),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: Theme.of(context).colorScheme.surface,
              height: buttonHeight,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add '_' at current cursor position
                      final String beforeSelection = suggestionTextController.selection.textBefore(suggestionTextController.text);
                      // final String insideSelection = searchHandler.searchTextController.selection.textInside(searchHandler.searchTextController.text);
                      final String afterSelection = suggestionTextController.selection.textAfter(suggestionTextController.text);
                      suggestionTextController.text = '${beforeSelection}_$afterSelection';
                      // set cursor to the end when tapped unfocused
                      suggestionTextController.selection = TextSelection(
                        baseOffset: beforeSelection.length + 1,
                        extentOffset: beforeSelection.length + 1,
                        affinity: TextAffinity.upstream,
                      );
                    },
                    style: buttonStyle,
                    child: Align(
                      alignment: Alignment.bottomCenter,
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
                        suggestionTextController.text = '${suggestionTextController.text.isEmpty ? '' : ' '}$copied ';
                        suggestionTextController.selection = TextSelection(
                          baseOffset: suggestionTextController.text.length,
                          extentOffset: suggestionTextController.text.length,
                          affinity: TextAffinity.upstream,
                        );
                      }
                    },
                    style: buttonStyle,
                    child: Icon(
                      Icons.paste,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: suggestionTextFocusNode.unfocus,
                    style: buttonStyle,
                    child: Icon(
                      Icons.keyboard_hide,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => onSuggestionSubmitted(suggestionTextController.text),
                    style: buttonStyle,
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    suggestionTextFocusNode.removeListener(suggestionTextFocusListener);
    searchHandler.searchTextController.removeListener(onSearchTextChanged);
    suggestionTextController.removeListener(onSuggestionTextChanged);
    suggestionTextFocusNode.dispose();
    suggestionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Scrollbar(
                  controller: suggestionsScrollController,
                  interactive: true,
                  scrollbarOrientation: settingsHandler.handSide.value.isLeft ? ScrollbarOrientation.left : ScrollbarOrientation.right,
                  child: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    strokeWidth: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    // edgeOffset: MediaQuery.paddingOf(context).top,
                    onRefresh: runSearch,
                    child: FadingEdgeScrollView.fromScrollView(
                      child: ListView.builder(
                        reverse: true,
                        controller: suggestionsScrollController,
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top + 16,
                          bottom: 12,
                        ),
                        itemCount: suggestedTags.isEmpty ? 1 : suggestedTags.length,
                        itemBuilder: (context, index) {
                          if (suggestedTags.isEmpty) {
                            if (loading) {
                              return const SizedBox.shrink();
                            } else if (failed) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: runSearch,
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: Text('Failed to load suggestions, tap to retry'),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  searchHandler.currentBooruHandler.hasTagSuggestions ? 'No suggestions found' : 'No tag suggestions available',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            }
                          }

                          final String tag = suggestedTags[index];
                          Color tagColor = tagHandler.getTag(tag).getColour();
                          if (tagColor == Colors.transparent) tagColor = Theme.of(context).colorScheme.onSurface;

                          //

                          final suggestionSearchText = suggestionTextController.text.trim();

                          final List<TextSpan> spans = [];
                          if (suggestionSearchText.isNotEmpty) {
                            final List<String> split = tag.split(suggestionSearchText);
                            for (int i = 0; i < split.length; i++) {
                              spans.add(
                                TextSpan(
                                  text: split[i].replaceAll('_', ' '),
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: tagColor,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                ),
                              );
                              if (i < split.length - 1) {
                                spans.add(
                                  TextSpan(
                                    text: suggestionSearchText.replaceAll('_', ' '),
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: tagColor,
                                          fontWeight: FontWeight.w600,
                                          height: 1,
                                        ),
                                  ),
                                );
                              }
                            }
                          } else {
                            spans.add(
                              TextSpan(
                                text: tag.replaceAll('_', ' '),
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: tagColor,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                              ),
                            );
                          }

                          return Container(
                            height: kMinInteractiveDimension,
                            alignment: Alignment.centerLeft,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => onSuggestionTap(tag),
                                onLongPress: () => onSuggestionLongTap(tag),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: MarqueeText.rich(
                                    textSpan: TextSpan(children: spans),
                                    isExpanded: false,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: tagColor,
                                          height: 1,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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
            enable: Platform.isAndroid || Platform.isIOS,
            config: buildConfig(),
            autoScroll: false,
            overscroll: 0,
            isDialog: true,
            child: ValueListenableBuilder(
              valueListenable: suggestionTextFocusNodeHasFocus,
              builder: (context, _, __) => KeyboardVisibilityBuilder(
                builder: (context, isKbVisible) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SettingsTextInput(
                              controller: suggestionTextController,
                              focusNode: suggestionTextFocusNode,
                              title: 'Search for tags',
                              clearable: true,
                              hintText: 'Search for tags',
                              onSubmitted: onSuggestionSubmitted,
                              onlyInput: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              textInputAction: TextInputAction.search,
                              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: SizedBox(
                          width: double.infinity,
                          height: ((isKbVisible || (suggestionTextFocusNodeHasFocus.value && (Platform.isAndroid || Platform.isIOS)))
                                  ? kMinInteractiveDimension + 8
                                  : 0) +
                              MediaQuery.paddingOf(context).bottom,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
