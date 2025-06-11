import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

// TODO parse [quote] https://github.com/flexbooru/flexbooru/blob/2084976a1db68c312ec4b9169f88e7425f35a539/android/src/main/java/onlymash/flexbooru/widget/CommentView.kt
// TODO add support for more boorus
// GelbooruV1, Shimmie, R34Hentai - can parse post html, but there won't be "has_comments" bool
// Others - don't have api / broken api (e621) / I don't care enough to do them

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
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 50, 18, 18),
              child: Text("This Booru doesn't have comments or there is no API for them"),
            ),
          )
        else if (comments.isEmpty)
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Kaomoji(
                  type: KaomojiType.shrug,
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  'No comments',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),
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
          const Text('Comments'),
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
  });

  final CommentItem comment;

  String parseContent(String? content) {
    if (content == null) {
      return '';
    }

    // TODO more rules
    // TODO make a better/more optimized way to do this?
    return content
        // sankaku(?) quoting
        .replaceAll('[quote]', '[ ')
        .replaceAll('[/quote]', ' ]\n')
        .replaceAll('said:', 'said: ')
        // .replaceAll(RegExp(r'\[\w+\]'), '[') // probably not correct to do, will trigger on everything that has [smth]
        // .replaceAll(RegExp(r'\[\/\w+\]'), ']\n')
        // move three dots away from everything
        .replaceAll('...', ' ... ')
        // multiple spaces to one
        .replaceAll(RegExp(' +'), ' ')
        // multiple new lines to one
        .replaceAll(RegExp(r'\n+'), '\n');
  }

  Widget scoreText(int? score) {
    if (score == null) {
      return const Text('');
    } else {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
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
                    Container(
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
                                  SelectableText(
                                    comment.title!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                const SizedBox(width: 5),
                                if (comment.createDate?.isNotEmpty == true)
                                  Text(
                                    formatDate(comment.createDate!, comment.createDateFormat!),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
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
                  child: SelectableLinkify(
                    text: parseContent(comment.content?.trim()),
                    options: const LinkifyOptions(
                      humanize: false,
                      removeWww: true,
                      looseUrl: true,
                      defaultToHttps: true,
                      excludeLastPeriod: true,
                    ),
                    scrollPhysics: const NeverScrollableScrollPhysics(),
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

        if (MediaQuery.orientationOf(context) == Orientation.landscape) {
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
