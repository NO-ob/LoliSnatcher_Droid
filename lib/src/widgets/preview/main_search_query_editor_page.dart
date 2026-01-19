import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
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
import 'package:lolisnatcher/src/widgets/gallery/tag_view.dart';
import 'package:lolisnatcher/src/widgets/history/history.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_bar.dart';

class MainSearchQueryEditorPage extends StatefulWidget {
  const MainSearchQueryEditorPage({
    this.subTag,
    this.tagToEditIndex,
    this.autoFocus = true,
    super.key,
  });

  final String? subTag;
  final int? tagToEditIndex;
  final bool autoFocus;

  @override
  State<MainSearchQueryEditorPage> createState() => _MainSearchQueryEditorPageState();
}

class _MainSearchQueryEditorPageState extends State<MainSearchQueryEditorPage> {
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
              if (mounted) {
                setState(() {});
              }

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
            Row(
              children: [
                Container(
                  width: 6,
                  height: 24,
                  decoration: BoxDecoration(
                    color: tagHandler.getTag(tag.tag).getColour(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  tagHandler.getTag(tag.tag).tagType.locName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(context.loc.add),
              leading: const Icon(Icons.add_rounded),
              onTap: () async {
                onSuggestionTap(tag);
                Navigator.of(context).pop();
              },
            ),
            TagContentPreview(
              tag: tag.tag,
              boorus: searchHandler.currentBooru.type?.isMerge == true
                  ? [
                      ...(searchHandler.currentBooruHandler as MergebooruHandler).booruHandlers.map((e) => e.booru),
                    ]
                  : [searchHandler.currentBooru],
            ),
            ListTile(
              title: Text(context.loc.copy),
              leading: const Icon(Icons.copy),
              onTap: () async {
                final tagText = tag.tag;

                await Clipboard.setData(ClipboardData(text: tagText));
                FlashElements.showSnackbar(
                  context: context,
                  title: Text(context.loc.copied, style: const TextStyle(fontSize: 20)),
                  content: Text(context.loc.searchBar.copiedTagToClipboard(tag: tagText)),
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
                final buttonStyle = context.theme.elevatedButtonTheme.style?.copyWith(
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
                  color: context.theme.colorScheme.surface,
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
                                  color: context.theme.colorScheme.onSecondary,
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
                            color: context.theme.colorScheme.onSecondary,
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
                            color: context.theme.colorScheme.onSecondary,
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
                                color: context.theme.colorScheme.onSecondary,
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
                    color: context.theme.colorScheme.secondary,
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
                                              context.loc.searchBar.failedToLoadSuggestions(
                                                msg: failedMsg?.isNotEmpty == true ? '\n\n[$failedMsg]' : '',
                                              ),
                                              style: context.theme.textTheme.bodyLarge,
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
                                          ? context.loc.searchBar.noSuggestionsFound
                                          : context.loc.searchBar.tagSuggestionsNotAvailable,
                                      style: context.theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final TagSuggestion tag = suggestedTags[index];
                          final tagColor = tagHandler.getTag(tag.tag).getColour();

                          return Container(
                            height: kMinInteractiveDimension + (tag.hasDescription ? 8 : 0),
                            alignment: Alignment.centerLeft,
                            color: tagColor == Colors.transparent ? null : tagColor.withValues(alpha: 0.1),
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
                                                style: context.theme.textTheme.bodySmall?.copyWith(
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
                                            style: context.theme.textTheme.bodySmall?.copyWith(
                                              color: context.theme.colorScheme.onSurface.withValues(alpha: 0.66),
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
                  title: context.loc.searchBar.searchForTags,
                  hintText: context.loc.searchBar.searchForTags,
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
                  contextMenuBuilder: (_, editableTextState) {
                    final List<ContextMenuButtonItem> buttonItems = editableTextState.contextMenuButtonItems;

                    // allow only on single tag input
                    if (!suggestionTextController.text.trim().contains(' ')) {
                      buttonItems.insert(
                        0,
                        ContextMenuButtonItem(
                          label: context.loc.searchBar.prefix,
                          onPressed: () {
                            ContextMenuController.removeAny();
                            showDialog(
                              context: context,
                              builder: (_) => _PrefixEditDialog(suggestionTextController),
                            );
                          },
                        ),
                      );
                    }

                    return AdaptiveTextSelectionToolbar.buttonItems(
                      anchors: editableTextState.contextMenuAnchors,
                      buttonItems: buttonItems,
                    );
                  },
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

    Color? tagColor = !tag.type.isNone ? tag.type.getColour() : tagHandler.getTag(tag.tag).getColour();
    tagColor ??= context.theme.colorScheme.onSurface;

    //

    final style = context.theme.textTheme.bodyLarge?.copyWith(
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
            context.loc.searchBar.metatags,
            style: context.theme.textTheme.titleLarge,
          ),
          const SizedBox(width: 12),
          Text(
            metaTags.length.toString(),
            style: context.theme.textTheme.titleSmall?.copyWith(
              color: context.theme.colorScheme.onSurfaceVariant,
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
              color: context.theme.colorScheme.surfaceContainer,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline_rounded),
                    const SizedBox(width: 8),
                    Text(
                      context.loc.searchBar.freeMetatags,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  context.loc.searchBar.freeMetatagsDescription,
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
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    tag.keyName,
                                    style: context.theme.textTheme.bodySmall?.copyWith(
                                      color: context.theme.colorScheme.onSurface.withValues(alpha: 0.66),
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
                                  color: context.theme.colorScheme.surfaceContainer.withValues(alpha: 0.66),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  context.loc.searchBar.free,
                                  style: context.theme.textTheme.bodySmall?.copyWith(
                                    color: context.theme.colorScheme.primary,
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
                                      ? Text(context.loc.searchBar.single)
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
                                    icon: Text(context.loc.searchBar.range),
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
                        context.loc.searchBar.popular,
                        style: context.theme.textTheme.bodyLarge,
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
                              title: context.loc.booru,
                              placeholder: context.loc.select,
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
                          color: context.theme.colorScheme.primaryContainer,
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
                          context.loc.searchBar.favourites,
                          style: context.theme.textTheme.bodyLarge,
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
                                context.loc.searchBar.all,
                                style: context.theme.textTheme.bodySmall,
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
                          color: context.theme.colorScheme.primaryContainer,
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
        context.loc.searchBar.selectDate,
        style: context.theme.textTheme.titleLarge,
      ),
      contentItems: [
        const SizedBox(height: 16),
        Text(
          DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(date.first),
          style: context.theme.textTheme.bodyLarge,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectedDayHighlightColor: context.theme.colorScheme.secondary,
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
        context.loc.searchBar.selectDatesRange,
        style: context.theme.textTheme.titleLarge,
      ),
      contentItems: [
        const SizedBox(height: 16),
        Text(
          // ignore: prefer_interpolation_to_compose_strings
          DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(range.first) +
              ' - ' +
              DateFormat(widget.dateFormat ?? 'yyyy-MM-dd').format(range.last),
          style: context.theme.textTheme.bodyLarge,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.range,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            selectedDayHighlightColor: context.theme.colorScheme.secondary,
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
    if (mounted) {
      setState(() {});
    }
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
            Text(context.loc.searchBar.lastSearch(date: formatDate(entry.timestamp)), textAlign: TextAlign.center),
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
                    title: Text(context.loc.searchBar.unknownBooruType, style: const TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.open_in_browser),
              label: Text(context.loc.open),
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
                    title: Text(context.loc.searchBar.unknownBooruType, style: const TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.add_circle_outline),
              label: Text(context.loc.openInNewTab),
            ),
            //
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: entry.searchText));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: Text(context.loc.copied, style: const TextStyle(fontSize: 20)),
                  content: Text(entry.searchText, style: const TextStyle(fontSize: 16)),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.copy),
              label: Text(context.loc.copy),
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
                    context.loc.searchBar.history,
                    style: context.theme.textTheme.bodyLarge,
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
                  orElse: Booru.unknown,
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
                          color: context.theme.colorScheme.surfaceContainer,
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
                    context.loc.searchBar.metatags,
                    style: context.theme.textTheme.bodyLarge,
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
                      label: Text(context.loc.searchBar.more),
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
                        color: context.theme.colorScheme.onSurface,
                      ),
                      MetaTagType.sort => Icon(
                        Icons.sort_rounded,
                        color: context.theme.colorScheme.onSurface,
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

class _PrefixEditDialog extends StatelessWidget {
  const _PrefixEditDialog(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final searchHandler = SearchHandler.instance;

    return AlertDialog(
      title: Text(context.loc.searchBar.prefix),
      content: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          String text = value.text;
          bool isExclude = text.startsWith('-');
          bool isOr = text.startsWith('~');
          text = text.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final bool isNumberMod = text.startsWith(RegExp(r'\d+#'));
          final int? booruNumber = int.tryParse(isNumberMod ? text.split('#')[0] : '');
          final bool hasBooruNumber = booruNumber != null;
          final List<Booru> usedBoorus = [
            searchHandler.currentTab.selectedBooru.value,
            ...(searchHandler.currentTab.secondaryBoorus.value ?? <Booru>[]),
          ];
          final bool hasSecondaryBoorus = usedBoorus.length > 1;
          final bool isValidNumberMod =
              hasBooruNumber && booruNumber > 0 && hasSecondaryBoorus && booruNumber <= usedBoorus.length;
          final selectedBooru = isValidNumberMod ? usedBoorus[booruNumber - 1] : null;
          text = text.replaceAll(RegExp(r'^\d+#'), '').trim();

          // do it twitce because it will be false for mergebooru
          // (because proper tag query syntax is to place booru number in front of tag and all modifiers)
          isExclude = isExclude || text.startsWith('-');
          isOr = isOr || text.startsWith('~');
          text = text.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.text = isExclude ? text : '-$text';
                  if (isValidNumberMod) controller.text = '$booruNumber#${controller.text}';
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.loc.searchBar.exclude,
                      ),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: Checkbox(
                        value: isExclude,
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
              ),
              //
              ElevatedButton(
                onPressed: () {
                  controller.text = isOr ? text : '~$text';
                  if (isValidNumberMod) controller.text = '$booruNumber#${controller.text}';
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(context.loc.or),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: Checkbox(
                        value: isOr,
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
              ),
              //
              if (hasSecondaryBoorus)
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: SettingsBooruDropdown(
                    value: selectedBooru,
                    items: usedBoorus,
                    onChanged: (Booru? newBooru) {
                      if (selectedBooru == newBooru) {
                        newBooru = null;
                      }

                      controller.text =
                          '${newBooru == null ? '' : usedBoorus.indexOf(newBooru) + 1}${newBooru == null ? '' : '#'}${isExclude ? '-' : ''}${isOr ? '~' : ''}$text';
                    },
                    title: context.loc.searchBar.booruNumberPrefix,
                    contentPadding: EdgeInsets.zero,
                    itemBuilder: (booru, _) {
                      if (booru == null) {
                        return const Text('');
                      }

                      return Row(
                        spacing: 6,
                        children: [
                          Text('${usedBoorus.indexOf(booru) + 1}#'),
                          BooruFavicon(booru),
                          Expanded(
                            child: Text(booru.name ?? ''),
                          ),
                        ],
                      );
                    },
                    selectedItemBuilder: (booru) {
                      if (booru == null) {
                        return const Text('');
                      }

                      return Row(
                        spacing: 6,
                        children: [
                          Text('${usedBoorus.indexOf(booru) + 1}#'),
                          BooruFavicon(booru),
                          Expanded(
                            child: Text(booru.name ?? ''),
                          ),
                        ],
                      );
                    },
                    drawBottomBorder: false,
                  ),
                ),
              //
              const CancelButton(withIcon: true),
            ],
          );
        },
      ),
    );
  }
}
