import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';
import 'package:lolisnatcher/src/widgets/common/parsed_text.dart';
import 'package:lolisnatcher/src/widgets/gallery/image_search_dialog.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class CommentsDialog extends StatefulWidget {
  const CommentsDialog({
    required this.item,
    required this.handler,
    super.key,
  });

  final BooruItem item;
  final BooruHandler handler;

  @override
  State<CommentsDialog> createState() => _CommentsDialogState();
}

class _CommentsDialogState extends State<CommentsDialog> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  List<CommentItem> comments = [];
  late final AutoScrollController scrollController;
  bool isLoading = true, isCompleted = false, notSupported = false;
  int page = 0;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    scrollController = AutoScrollController(
      viewportBoundaryGetter: () => const Rect.fromLTRB(0, 16, 0, 16),
    );

    getComments(initial: true);
  }

  Future<void> getComments({bool initial = false}) async {
    page = page + 1;
    if (initial) {
      page = 0;
      isCompleted = false;
      notSupported = false;
      selectedIndex = null;
      comments.clear();
    }

    isLoading = true;
    if (!isCompleted) {
      if (widget.item.serverId != null) {
        setState(() {}); // set state to update the loading indicator
        final List<CommentItem> fetched = await widget.handler.getComments(
          widget.item.serverId!,
          page,
        );
        if (fetched.isEmpty || comments.contains(fetched.first)) {
          isCompleted = true;
        }

        if (!isCompleted) {
          comments = [...comments, ...fetched];
        }
      } else {
        notSupported = true;
      }
    }

    isLoading = false;
    setState(() {});
  }

  Widget errorEntryBuild(BuildContext context, int index) {
    return Column(
      children: [
        if (isLoading)
          const Center(
            child: Padding(padding: EdgeInsets.fromLTRB(18, 50, 18, 18), child: CircularProgressIndicator()),
          )
        else if (notSupported)
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 50, 18, 18),
              child: Text(context.loc.comments.noBooruAPIForComments),
            ),
          )
        else if (comments.isEmpty)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Kaomoji(
                  category: KaomojiCategory.indifference,
                  style: TextStyle(fontSize: 36),
                ),
                Text(
                  context.loc.comments.noComments,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
      ],
    );
  }

  bool onScroll(ScrollUpdateNotification notif) {
    final bool isNotAtStart = notif.metrics.pixels > 0;
    final bool isAtOrNearEdge =
        notif.metrics.atEdge ||
        notif.metrics.pixels > (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2));
    final bool isScreenFilled = notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0;

    if (!isLoading && !isCompleted) {
      if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
        getComments();
      }
    }
    return true;
  }

  void navigateToComment(
    bool forward, {
    bool isHolding = false,
  }) {
    if (comments.isEmpty) return;

    int newIndex;
    if (selectedIndex == null) {
      newIndex = forward ? 0 : comments.length - 1;
    } else {
      newIndex = selectedIndex! + (forward ? 1 : -1);
      if (newIndex < -1) {
        newIndex = isHolding ? -1 : comments.length - 1;
      } else if (newIndex >= comments.length) {
        newIndex = isHolding ? comments.length - 1 : -1;
      }
    }

    setState(() => selectedIndex = newIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToComment(newIndex));
  }

  void scrollToComment(int index) {
    // Cancel any in-progress scroll animation before starting a new one
    scrollController.jumpTo(scrollController.offset);
    if (index == -1) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else {
      scrollController.scrollToIndex(
        index,
        duration: const Duration(milliseconds: 200),
        preferPosition: AutoScrollPosition.begin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool areThereErrors = (isLoading && comments.isEmpty) || notSupported || comments.isEmpty;

    final String countText = comments.isNotEmpty
        ? '${(selectedIndex != null && selectedIndex != -1) ? '${selectedIndex! + 1}/' : ''}${comments.length}'
        : '';

    final List<Widget> actions = [
      if (isLoading && comments.isNotEmpty)
        const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      IconButton(
        onPressed: () => getComments(initial: true),
        icon: const Icon(Icons.refresh),
      ),
      if (widget.item.postURL.isNotEmpty)
        IconButton(
          onPressed: () => launchUrlString(
            widget.item.postURL,
            mode: LaunchMode.externalApplication,
          ),
          icon: const Icon(Icons.public),
        ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth - 32;
        final double screenHeight = MediaQuery.sizeOf(context).height;
        final double ratio = widget.item.fileAspectRatio ?? 16 / 9;
        final double minRatio = max(0.4, ratio);
        final double maxRatio = min(2, ratio);
        double thumbHeight;
        double thumbWidth;
        if (ratio < 1) {
          thumbHeight = screenHeight * 0.4;
          thumbWidth = min(
            thumbHeight * minRatio,
            (screenWidth * 0.8) / minRatio,
          );
        } else {
          thumbWidth = screenWidth;
          thumbHeight = min(
            thumbWidth / maxRatio,
            screenHeight * 0.4,
          );
        }

        if (context.isLandscape) {
          final size = MediaQuery.sizeOf(context);
          final double landscapeScreenMod = size.height == size.shortestSide ? 0.3 : 0.4;
          final double sizeDiff = thumbHeight / min(screenHeight * landscapeScreenMod, thumbHeight);
          thumbHeight /= sizeDiff;
          thumbHeight = min(thumbHeight, screenHeight * landscapeScreenMod);
        }

        final double expandedHeight = max(thumbHeight, _CommentsHeaderDelegate.minThumbHeight);

        return SettingsPageDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.loc.comments.title),
              if (countText.isNotEmpty)
                Text(
                  countText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
          actions: actions,
          content: Stack(
            children: [
              NotificationListener<ScrollUpdateNotification>(
                onNotification: onScroll,
                child: Scrollbar(
                  controller: scrollController,
                  interactive: true,
                  scrollbarOrientation: settingsHandler.handSide.value.isLeft
                      ? ScrollbarOrientation.left
                      : ScrollbarOrientation.right,
                  child: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    strokeWidth: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    onRefresh: () async {
                      await getComments(initial: true);
                    },
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _CommentsHeaderDelegate(
                            maxExtent: expandedHeight,
                            availableWidth: thumbWidth,
                            item: widget.item,
                            handler: widget.handler,
                            isSelected: selectedIndex == -1,
                            onThumbTap: () => setState(() {
                              if (selectedIndex != -1) {
                                selectedIndex = -1;
                                scrollToComment(-1);
                              } else {
                                selectedIndex = null;
                              }
                              setState(() {});
                            }),
                          ),
                        ),
                        SliverSafeArea(
                          top: false,
                          sliver: areThereErrors
                              ? SliverToBoxAdapter(child: errorEntryBuild(context, 0))
                              : SliverPadding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    bottom: 128 + MediaQuery.paddingOf(context).bottom,
                                  ),
                                  sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, i) {
                                        return AutoScrollTag(
                                          key: ValueKey(i),
                                          controller: scrollController,
                                          index: i,
                                          child: _CommentEntry(
                                            comment: comments[i],
                                            onTap: () => setState(() {
                                              if (selectedIndex == i) {
                                                selectedIndex = null;
                                              } else {
                                                selectedIndex = i;
                                              }
                                            }),
                                            isSelected: selectedIndex == i,
                                          ),
                                        );
                                      },
                                      childCount: comments.length,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (comments.isNotEmpty)
                Positioned(
                  bottom: 32 + MediaQuery.paddingOf(context).bottom,
                  left: settingsHandler.handSide.value.isLeft ? 32 : null,
                  right: settingsHandler.handSide.value.isLeft ? null : 32,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LongPressRepeater(
                            onStart: () async => navigateToComment(false, isHolding: true),
                            startDelay: 300,
                            child: InkWell(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              onTap: () => navigateToComment(false),
                              child: SizedBox(
                                width: kMinInteractiveDimension,
                                height: kMinInteractiveDimension,
                                child: Icon(
                                  Icons.arrow_upward,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          LongPressRepeater(
                            onStart: () async => navigateToComment(true, isHolding: true),
                            startDelay: 300,
                            child: InkWell(
                              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                              onTap: () => navigateToComment(true),
                              child: SizedBox(
                                width: kMinInteractiveDimension,
                                height: kMinInteractiveDimension,
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _CommentEntry extends StatelessWidget {
  const _CommentEntry({
    required this.comment,
    this.onTap,
    this.isSelected = false,
  });

  final CommentItem comment;
  final VoidCallback? onTap;
  final bool isSelected;

  Widget scoreText(int? score) {
    if (score == null) {
      return const SizedBox.shrink();
    }

    Color color = Colors.grey;
    if (score > 0) {
      color = Colors.green;
    } else if (score < 0) {
      color = Colors.red;
    }

    return Text(
      '${score > 0 ? '+' : ''}$score',
      style: TextStyle(
        fontSize: 12,
        color: color,
      ),
    );
  }

  String formatDate(String date, String format) {
    String formattedDate = '';
    if (date.isNotEmpty && format.isNotEmpty) {
      try {
        // no timezone support in DateFormat? see: https://stackoverflow.com/questions/56189407/dart-parse-date-timezone-gives-unimplementederror/56190055
        // remove timezones from strings until they fix it
        DateTime parsedDate;
        if (format == 'unix') {
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);
        } else if (format == 'iso') {
          date = date.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateTime.parse(date).toLocal();
        } else {
          date = date.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateFormat(format).parseLoose(date).toLocal();
        }
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
      } catch (e) {
        print('formatDate: $date $format $e');
      }
    }
    return formattedDate;
  }

  String _normalizeContent(String? content) {
    if (content == null || content.isEmpty) {
      return '';
    }

    // Normalize whitespace
    return content.replaceAll(RegExp(' +'), ' ').replaceAll(RegExp(r'\n{3,}'), '\n\n').trim();
  }

  void _showAvatarDialog(BuildContext context, String avatarUrl, String? authorName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: .min,
          spacing: 12,
          children: [
            if (authorName?.isNotEmpty == true)
              Text(
                authorName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                  maxHeight: MediaQuery.sizeOf(context).height * 0.6,
                ),
                child: Image.network(
                  avatarUrl,
                  scale: 0.5,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.medium,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 200,
                      height: 200,
                      color: Theme.of(context).colorScheme.surface,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Theme.of(context).colorScheme.surface,
                      child: const Center(child: Icon(Icons.error_outline, size: 48)),
                    );
                  },
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.image_search_rounded),
              onPressed: () => showImageSearchDialog(context, avatarUrl),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double borderWidth = max(2, MediaQuery.devicePixelRatioOf(context));

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        right: 16,
        left: 16,
      ),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(
                    color: theme.colorScheme.secondary,
                    width: borderWidth,
                  )
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8 - (isSelected ? borderWidth : 0),
                vertical: 16 - (isSelected ? borderWidth : 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: comment.avatarUrl != null
                            ? () => _showAvatarDialog(context, comment.avatarUrl!, comment.authorName)
                            : null,
                        child: Container(
                          width: comment.avatarUrl != null ? 60 : 40,
                          height: comment.avatarUrl != null ? 60 : 40,
                          margin: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(comment.avatarUrl != null ? 10 : 20),
                            child: comment.avatarUrl != null
                                ? Image.network(
                                    comment.avatarUrl!,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.medium,
                                    errorBuilder: (context, url, error) {
                                      return Center(child: Text(comment.authorName?.substring(0, 2) ?? '?'));
                                    },
                                  )
                                : Center(child: Text(comment.authorName?.substring(0, 2) ?? '?')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (comment.authorName?.isNotEmpty == true)
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: SelectableText(
                                  comment.authorName!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  if (comment.title?.isNotEmpty == true)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: SelectableText(
                                        comment.title!,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  if (comment.createDate?.isNotEmpty == true)
                                    Text(
                                      formatDate(comment.createDate!, comment.createDateFormat!),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                      ),
                                    ),
                                  const SizedBox(width: 15),
                                  scoreText(comment.score),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.maxFinite,
                    child: ParsedText(
                      text: _normalizeContent(comment.content),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CommentsHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CommentsHeaderDelegate({
    required this.maxExtent,
    required this.availableWidth,
    required this.item,
    required this.handler,
    required this.isSelected,
    required this.onThumbTap,
  });

  @override
  double get minExtent {
    final double ratio = item.fileAspectRatio ?? 16 / 9;
    double h = minThumbHeight;
    double w = h * ratio;
    if (w > availableWidth) {
      w = availableWidth;
      h = w / ratio;
    }
    return h;
  }

  @override
  final double maxExtent;
  final double availableWidth;
  final BooruItem item;
  final BooruHandler handler;
  final bool isSelected;
  final VoidCallback onThumbTap;

  static double get minThumbHeight {
    final ctx = NavigationHandler.instance.navContext;
    final orientation = MediaQuery.orientationOf(ctx);
    final size = MediaQuery.sizeOf(ctx);

    if (orientation.isLandscape && size.height <= 600) {
      // allow to completely hide header when screen is too small in landscape mode
      return 0;
    }

    return size.height * 0.12;
  }

  ({double height, double width}) _thumbSize(double rawHeight) {
    final double ratio = item.fileAspectRatio ?? 16 / 9;
    double h = rawHeight;
    double w = h * ratio;
    if (w > availableWidth) {
      w = availableWidth;
      h = w / ratio;
    }
    w = max(w, 80); // at least 80
    h = h < 50 ? 0 : h; // jump to 0 if too small
    return (height: h, width: w);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double rawThumbHeight = (maxExtent - shrinkOffset).clamp(
      minThumbHeight,
      maxExtent,
    );
    final (:height, :width) = _thumbSize(rawThumbHeight);

    final double borderWidth = max(2, MediaQuery.devicePixelRatioOf(context));

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: GestureDetector(
        onTap: onThumbTap,
        child: Center(
          child: UnconstrainedBox(
            child: SizedBox(
              // -4 is to compensate for border
              height: (height - 4).clamp(0, double.maxFinite),
              width: width,
              child: HeroMode(
                enabled: false,
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: borderWidth,
                          )
                        : null,
                    borderRadius: isSelected ? const BorderRadius.all(Radius.circular(8)) : null,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ThumbnailBuild(
                    item: item,
                    handler: handler,
                    selectable: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_CommentsHeaderDelegate oldDelegate) => true;
}
