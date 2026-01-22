import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/parsed_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
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
  ScrollController scrollController = ScrollController();
  bool isLoading = true, isCompleted = false, notSupported = false;
  int page = 0;

  @override
  void initState() {
    super.initState();
    getComments(initial: true);
  }

  Future<void> getComments({bool initial = false}) async {
    page = page + 1;
    if (initial) {
      page = 0;
      isCompleted = false;
      notSupported = false;
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
                  type: KaomojiType.shrug,
                  style: TextStyle(fontSize: 40),
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

  @override
  Widget build(BuildContext context) {
    final bool areThereErrors = (isLoading && comments.isEmpty) || notSupported || comments.isEmpty;

    return SettingsPageDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.comments.title),
          if (comments.isNotEmpty)
            Text(
              '${comments.length}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
      content: NotificationListener<ScrollUpdateNotification>(
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
            child: DesktopScrollWrap(
              controller: scrollController,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                controller: scrollController,
                physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: areThereErrors ? 2 : comments.length + 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _CommentsHeader(
                      item: widget.item,
                      handler: widget.handler,
                    );
                  }

                  return areThereErrors //
                      ? errorEntryBuild(context, index)
                      : _CommentEntry(
                          comment: comments[index - 1],
                        );
                },
              ),
            ),
          ),
        ),
      ),
      actions: [
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
            onPressed: () {
              launchUrlString(
                widget.item.postURL,
                mode: LaunchMode.externalApplication,
              );
            },
            icon: const Icon(Icons.public),
          ),
      ],
    );
  }
}

class _CommentEntry extends StatelessWidget {
  const _CommentEntry({
    required this.comment,
    this.onTagTap,
  });

  final CommentItem comment;
  final OnTagTap? onTagTap;

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
    // Normalize whitespace only - parsing is handled by ParsedText
    return content.replaceAll(RegExp(' +'), ' ').replaceAll(RegExp(r'\n{3,}'), '\n\n').trim();
  }

  void _showAvatarDialog(BuildContext context, String avatarUrl, String? authorName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (authorName?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  authorName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                  ),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    onTagTap: onTagTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CommentsHeader extends StatelessWidget {
  const _CommentsHeader({
    required this.item,
    required this.handler,
  });

  final BooruItem item;
  final BooruHandler handler;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ratio = item.fileAspectRatio ?? 16 / 9;
        final minRatio = max(0.4, ratio);
        final maxRatio = min(2, ratio);
        double width = 100;
        double height = 100;
        if (ratio < 1) {
          // height > width
          height = MediaQuery.sizeOf(context).height * 0.4;
          width = height * minRatio;
        } else {
          // width > height
          width = constraints.maxWidth * 0.6;
          height = width / maxRatio;
        }

        if (context.isLandscape) {
          final double sizeDiff = height / (min(MediaQuery.sizeOf(context).height * 0.4, height));
          height /= sizeDiff;
          width /= sizeDiff;
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height,
                width: width,
                child: HeroMode(
                  enabled: false,
                  child: ThumbnailBuild(
                    item: item,
                    handler: handler,
                    selectable: false,
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
