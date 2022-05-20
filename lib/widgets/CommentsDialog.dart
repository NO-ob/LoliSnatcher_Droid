import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/CommentItem.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';

// TODO parse [quote] https://github.com/flexbooru/flexbooru/blob/2084976a1db68c312ec4b9169f88e7425f35a539/android/src/main/java/onlymash/flexbooru/widget/CommentView.kt
// TODO add support for more boorus
// GelbooruV1, Shimmie, R34Hentai - can parse post html, but there won't be "has_comments" bool
// Others - don't have api / broken api (e621) / I don't care enough to do them

class CommentsDialog extends StatefulWidget {
  const CommentsDialog(this.item, {Key? key}) : super(key: key);
  final BooruItem item;

  @override
  State<CommentsDialog> createState() => _CommentsDialogState();
}

class _CommentsDialogState extends State<CommentsDialog> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  List<CommentItem> comments = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = true, notSupported = false;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  String formatDate(String date, String format) {
    String formattedDate = '';
    if (date.isNotEmpty && format.isNotEmpty) {
      try {
        // no timezone support in DateFormat? see: https://stackoverflow.com/questions/56189407/dart-parse-date-timezone-gives-unimplementederror/56190055
        // remove timezones from strings until they fix it
        DateTime parsedDate;
        if (format == "unix") {
          parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);
        } else {
          date = date.replaceAll(RegExp(r'(?:\+|\-)\d{4}'), '');
          parsedDate = DateFormat(format).parseLoose(date).toLocal();
        }
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
      } catch (e) {
        print('$date $format $e');
      }
    }
    return formattedDate;
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

  void getComments() async {
    isLoading = true;
    if (widget.item.serverId != null) {
      setState(() {}); // set state to update the loading indicator
      List<CommentItem> fetched = await searchHandler.currentBooruHandler.fetchComments(widget.item.serverId!, 0);
      comments = fetched;
    } else {
      notSupported = true;
    }

    // comments = [
    //   ...comments,
    //   ...List.generate(4000, (i) => CommentItem(
    //     id: 'id',
    //     title: 'title',
    //     content: 'Comment content',
    //     authorID: "creator_id",
    //     authorName: "creator",
    //     avatarUrl: null,
    //     postID: "post_id",
    //   ))
    // ];

    isLoading = false;
    setState(() {});
  }

  Widget mainBuild() {
    bool areThereErrors = isLoading || notSupported || comments.isEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          child: Scrollbar(
            controller: scrollController,
            interactive: true,
            thickness: 8,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: 80,
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: () async {
                getComments();
              },
              child: areThereErrors ? errorsBuild() : listBuild(),
            ),
          ),
        ),
      ),
    );
  }

  Widget listBuild() {
    return DesktopScrollWrap(
      controller: scrollController,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        controller: scrollController,
        physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: comments.length,
        scrollDirection: Axis.vertical,
        itemBuilder: listEntryBuild,
      ),
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    CommentItem currentEntry = comments[index];

    Widget entryRow = Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: Ink(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: currentEntry.avatarUrl != null ? 60 : 40,
                      height: currentEntry.avatarUrl != null ? 60 : 40,
                      margin: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(currentEntry.avatarUrl != null ? 10 : 20),
                        child: currentEntry.avatarUrl != null
                            ? Image.network(
                                currentEntry.avatarUrl!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.medium,
                                errorBuilder: (context, url, error) {
                                  return Center(child: Text(currentEntry.authorName?.substring(0, 2) ?? '?'));
                                },
                              )
                            : Center(child: Text(currentEntry.authorName?.substring(0, 2) ?? '?')),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentEntry.authorName?.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SelectableText(currentEntry.authorName!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(children: [
                            if (currentEntry.title?.isNotEmpty == true)
                              SelectableText(currentEntry.title!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 5),
                            if (currentEntry.createDate?.isNotEmpty == true)
                              Text(formatDate(currentEntry.createDate!, currentEntry.createDateFormat!),
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                            const SizedBox(width: 15),
                            scoreText(currentEntry.score),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SelectableLinkify(
                    text: currentEntry.content ?? '',
                    options: const LinkifyOptions(humanize: false, removeWww: true, looseUrl: true),
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    onOpen: (link) async {
                      ServiceHandler.launchURL(link.url);
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

    return Column(children: <Widget>[
      Row(children: [
        Expanded(child: entryRow),
      ]),
      Divider(height: 1, thickness: 1, color: Colors.grey[800]),
    ]);
  }

  Widget errorsBuild() {
    return ListView(
      padding: const EdgeInsets.all(5),
      controller: scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        if (isLoading)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary)),
            ),
          )
        else if (notSupported)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('This Booru doesn\'t have comments or there is no API for them.'),
            ),
          )
        else if (comments.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('No comments.'),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageDialog(
      title: const Text('Comments'),
      content: mainBuild(),
      actions: [
        if (widget.item.postURL.isNotEmpty)
          IconButton(
            onPressed: () {
              ServiceHandler.launchURL(widget.item.postURL);
              // Navigator.of(context).pop(false);
            },
            icon: const Icon(Icons.public),
          ),
      ]
    );
  }
}
