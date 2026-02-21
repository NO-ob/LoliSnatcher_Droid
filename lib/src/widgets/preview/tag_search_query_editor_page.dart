import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/intl.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/gallery/tag_view.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_query_editor_page.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_tag_chip.dart';
import 'package:lolisnatcher/src/widgets/preview/query_editor_core.dart';

/// Generic tag search editor page
/// A flexible tag search interface that can be used for various scenarios
///
/// Features:
/// - Single tag mode: Returns immediately when a tag is selected
/// - Multiple tags mode: Allows building a full query with tag chips
/// - Optional booru selector: Can search across different boorus
/// - Customizable callback: Get results via [onTagsSelected] or Navigator.pop()
///
/// Usage examples:
/// ```dart
/// // Single tag selection
/// final tag = await Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => TagSearchQueryEditorPage(
///       initialBooru: someBooru,
///       allowMultipleTags: false,
///     ),
///   ),
/// );
///
/// // Multiple tags with booru selector
/// final result = await Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => TagSearchQueryEditorPage(
///       initialTags: 'tag1 tag2',
///       allowMultipleTags: true,
///       showBooruSelector: true,
///       onTagsSelected: (tags, booru) {
///         // Handle selection
///       },
///     ),
///   ),
/// );
/// ```
class TagSearchQueryEditorPage extends StatefulWidget {
  const TagSearchQueryEditorPage({
    this.initialTags,
    this.initialBooru,
    this.allowMultipleTags = false,
    this.showBooruSelector = false,
    this.readOnlyPreview = false,
    this.onTagsSelected,
    super.key,
  });

  /// Initial tags to populate the editor with (space-separated)
  final String? initialTags;

  /// The booru to search tags for (defaults to current booru if not specified)
  final Booru? initialBooru;

  /// If true, allows selecting multiple tags and shows tag chips
  /// If false, returns immediately after selecting a single tag
  final bool allowMultipleTags;

  /// If true, shows a dropdown to select which booru to search
  final bool showBooruSelector;

  final bool readOnlyPreview;

  /// Optional callback when tags are selected (also returns via Navigator.pop)
  final void Function(String tags, Booru? booru)? onTagsSelected;

  @override
  State<TagSearchQueryEditorPage> createState() => _TagSearchQueryEditorPageState();
}

class _TagSearchQueryEditorPageState extends State<TagSearchQueryEditorPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  final ScrollController suggestionsScrollController = ScrollController();
  final AutoScrollController tagsScrollController = AutoScrollController();

  late final QueryEditorController queryController;

  Booru? selectedBooru;
  List<String> tags = [];
  String? tagToEdit;
  int? tagToEditIndex;

  @override
  void initState() {
    super.initState();

    selectedBooru = widget.initialBooru ?? SearchHandler.instance.currentBooru;
    if (widget.initialTags != null && widget.initialTags!.isNotEmpty) {
      tags = widget.initialTags!.trim().split(' ').where((t) => t.isNotEmpty).toList();
    }

    queryController = QueryEditorController(
      onUpdate: () {
        if (mounted) {
          setState(() {});
        }
      },
      booru: selectedBooru,
    );

    queryController.initialize();
    queryController.suggestionTextFocusNode.requestFocus();
    queryController.runSearch();
  }

  void onChipTap(String tag, int tagIndex) {
    if (tagToEditIndex == tagIndex) {
      queryController.suggestionTextController.clear();
      tagToEditIndex = null;
      tagToEdit = null;
    } else {
      queryController.suggestionTextController.value = TextEditingValue(
        text: tag,
        selection: TextSelection(
          baseOffset: tag.length,
          extentOffset: tag.length,
          affinity: TextAffinity.upstream,
        ),
      );
      queryController.suggestionTextFocusNode.requestFocus();

      tagToEditIndex = tagIndex;
      tagToEdit = tag;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        tagsScrollController.scrollToIndex(
          tagIndex,
          preferPosition: AutoScrollPosition.end,
        );
      });
    }
    setState(() {});

    queryController.runSearch();
  }

  void onChipDeleteTap(String tag, int tagIndex) {
    tags.removeAt(tagIndex);
    if (tagToEditIndex != null) {
      tagToEditIndex = null;
      tagToEdit = null;
      queryController.suggestionTextController.clear();
    }
    setState(() {});
  }

  void onSuggestionTap(
    TagSuggestion tag, {
    bool raw = false,
  }) {
    String tagText = tag.tag;

    if (!raw) {
      final String extrasFromInput = queryController.suggestionTextController.text
          .replaceAll(queryController.suggestionTextControllerRawInput, '')
          .trim();
      tagText = '$extrasFromInput$tagText';
    }

    if (widget.allowMultipleTags) {
      final int? itemIndex = tagToEditIndex;
      if (tagToEditIndex != null) {
        tags[tagToEditIndex!] = tagText;
      } else {
        tags.add(tagText);
      }

      queryController.suggestionTextController.clear();
      queryController.suggestionTextFocusNode.requestFocus();
      tagToEditIndex = null;
      tagToEdit = null;
      setState(() {});

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (itemIndex != null) {
          tagsScrollController.scrollToIndex(
            itemIndex,
            duration: const Duration(milliseconds: 300),
            preferPosition: AutoScrollPosition.end,
          );
        } else {
          tagsScrollController.animateTo(
            tagsScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

      queryController.runSearch();
    } else {
      // Single tag mode - return immediately
      widget.onTagsSelected?.call(tagText, selectedBooru);
      Navigator.of(context).pop(tagText);
    }
  }

  Future<void> onSuggestionLongTap(TagSuggestion tag) async {
    await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      page: (_) {
        return SettingsBottomSheet(
          contentItems: [
            const SizedBox(height: 16),
            MarqueeText(
              text: tag.tag,
              isExpanded: false,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
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
            if (selectedBooru != null)
              TagContentPreview(
                tag: tag.tag,
                boorus: [?selectedBooru],
                parentTab: null,
                readOnly: widget.readOnlyPreview,
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
    } else if (widget.allowMultipleTags && tags.isNotEmpty) {
      onConfirmTap();
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
      queryController.suggestionTextController.text = tag;
    }
    queryController.suggestionTextFocusNode.requestFocus();
  }

  void onConfirmTap() {
    widget.onTagsSelected?.call(tags.join(' '), selectedBooru);
    Navigator.of(context).pop(tags.join(' '));
  }

  void onBooruChanged(Booru? newBooru) {
    setState(() {
      selectedBooru = newBooru;
    });
    queryController.setBooru(newBooru);
  }

  @override
  void dispose() {
    queryController.dispose();
    suggestionsScrollController.dispose();
    tagsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMultipleTags = widget.allowMultipleTags && tags.isNotEmpty;

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
                    onRefresh: queryController.runSearch,
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
                        itemCount: queryController.suggestedTags.isEmpty
                            ? 1
                            : min(100, queryController.suggestedTags.length),
                        itemBuilder: (context, index) {
                          if (queryController.suggestedTags.isEmpty) {
                            if (queryController.loading) {
                              return const SizedBox.shrink();
                            } else if (queryController.failed) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: queryController.runSearch,
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
                                                msg: queryController.failedMsg?.isNotEmpty == true
                                                    ? '\n\n[${queryController.failedMsg}]'
                                                    : '',
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

                            if (queryController.suggestionTextControllerRawInput.isEmpty) {
                              return SuggestionsMainContent(
                                onMetatagSelect: onMetatagSelect,
                                onTagTap: (tag) => onSuggestionTap(TagSuggestion(tag: tag)),
                                hideHistory: true,
                                hidePopular: selectedBooru?.type?.isFavouritesOrDownloads == true,
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
                                      category: KaomojiCategory.indifference,
                                      style: TextStyle(fontSize: 36),
                                    ),
                                    Text(
                                      context.loc.searchBar.noSuggestionsFound,
                                      style: context.theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final TagSuggestion tag = queryController.suggestedTags[index];
                          final tagColor = tagHandler.getTag(tag.tag).getColour();

                          return Container(
                            height: kMinInteractiveDimension + (tag.hasDescription ? 8 : 0),
                            alignment: Alignment.centerLeft,
                            color: tagColor?.withValues(alpha: 0.1),
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
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MarqueeText(
                                              text: tag.tag.replaceAll('_', ' '),
                                              style: context.theme.textTheme.bodyLarge?.copyWith(
                                                color: tagHandler.getTag(tag.tag).getColour(),
                                                fontWeight: FontWeight.w600,
                                              ),
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
                                      if (tag.count > 0)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(
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
            if (queryController.loading)
              const Positioned(
                bottom: 16,
                right: 16,
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      // Tags bar (for multiple tags mode)
      if (hasMultipleTags)
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: context.theme.colorScheme.onSurface.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
          child: Listener(
            onPointerSignal: (event) => desktopPointerScroll(tagsScrollController, event),
            child: FadingEdgeScrollView.fromScrollView(
              child: ListView(
                controller: tagsScrollController,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                children: [
                  for (int i = 0; i < tags.length; i++)
                    AutoScrollTag(
                      key: Key('${tags[i]}-$i'),
                      controller: tagsScrollController,
                      index: i,
                      child: Padding(
                        padding: (i < tags.length - 1) ? const EdgeInsets.only(right: 8) : EdgeInsets.zero,
                        child: MainSearchTagChip(
                          tag: tags[i],
                          booru: selectedBooru,
                          onTap: () => onChipTap(tags[i], i),
                          onDeleteTap: () => onChipDeleteTap(tags[i], i),
                          canDelete: tagToEditIndex != i,
                          isSelected: tagToEditIndex == i,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      // Booru selector (if enabled)
      if (widget.showBooruSelector)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: context.theme.colorScheme.onSurface.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
          child: SettingsBooruDropdown(
            value: selectedBooru,
            onChanged: onBooruChanged,
            title: context.loc.booru,
            placeholder: context.loc.select,
            drawBottomBorder: false,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      // Suggestions text input
      QueryEditorKeyboardActions(
        controller: queryController.suggestionTextController,
        focusNode: queryController.suggestionTextFocusNode,
        onSubmitted: onSuggestionTextSubmitted,
        onLongTap: onSuggestionLongTap,
        child: ValueListenableBuilder(
          valueListenable: queryController.suggestionTextFocusNodeHasFocus,
          builder: (context, suggestionTextFocusNodeHasFocus, _) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SettingsTextInput(
                  controller: queryController.suggestionTextController,
                  focusNode: queryController.suggestionTextFocusNode,
                  title: context.loc.searchBar.searchForTags,
                  titleAsLabel: true,
                  hintText: context.loc.searchBar.searchForTags,
                  clearable: true,
                  onSubmitted: onSuggestionTextSubmitted,
                  onSubmittedLongTap: (_) => onSuggestionLongTap(
                    TagSuggestion(tag: queryController.suggestionTextControllerRawInput),
                  ),
                  onlyInput: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  textInputAction: TextInputAction.search,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                  showSubmitButton: (inputText) =>
                      !settingsHandler.showSearchbarQuickActions &&
                      (inputText.isNotEmpty || (widget.allowMultipleTags && tags.isNotEmpty)),
                  submitIcon: widget.allowMultipleTags && tags.isNotEmpty ? Icons.check : null,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
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
                            ? 0
                            : MediaQuery.paddingOf(context).bottom,
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
              return isKbVisible ? const SizedBox(height: 44) : const SizedBox.shrink();
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

/// A fake input field that opens [TagSearchQueryEditorPage] when tapped
/// and displays/stores the selected tag(s)
///
/// Usage:
/// ```dart
/// TagSearchBox(
///   controller: myTagController,
///   title: 'Select tags',
///   allowMultipleTags: true,
///   showBooruSelector: true,
///   onChanged: (tags, booru) => print('Selected: $tags from $booru'),
/// )
/// ```
class TagSearchBox extends StatefulWidget {
  const TagSearchBox({
    required this.title,
    this.controller,
    this.hintText,
    this.booru,
    this.allowMultipleTags = false,
    this.showBooruSelector = false,
    this.onChanged,
    this.onBooruChanged,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.clearable = true,
    this.enabled = true,
    this.onlyInput = false,
    this.readOnlyPreview = false,
    super.key,
  });

  /// Controller to store/retrieve the selected tags
  final TextEditingController? controller;

  /// Label text for the input field
  final String title;

  /// Hint text when empty
  final String? hintText;

  /// Booru for tag search
  final Booru? booru;

  /// Allow selecting multiple tags
  final bool allowMultipleTags;

  /// Show booru selector in the editor
  final bool showBooruSelector;

  /// Called when tags are selected
  final void Function(String tags, Booru? booru)? onChanged;

  /// Called when booru is changed (if showBooruSelector is true)
  final void Function(Booru? booru)? onBooruChanged;

  final bool drawTopBorder;
  final bool drawBottomBorder;
  final EdgeInsets margin;
  final bool clearable;
  final bool enabled;
  final bool onlyInput;
  final bool readOnlyPreview;

  @override
  State<TagSearchBox> createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  late final TextEditingController _controller;
  Booru? get _selectedBooru => widget.booru;
  set _selectedBooru(Booru? booru) => widget.onBooruChanged?.call(booru);

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Future<void> _openTagSearch() async {
    if (!widget.enabled) return;

    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => TagSearchQueryEditorPage(
          initialTags: _controller.text,
          initialBooru: _selectedBooru,
          allowMultipleTags: widget.allowMultipleTags,
          showBooruSelector: widget.showBooruSelector,
          readOnlyPreview: widget.readOnlyPreview,
          onTagsSelected: (tags, booru) {
            setState(() {
              _controller.text = tags;
              if (booru != null) {
                _selectedBooru = booru;
                widget.onBooruChanged?.call(booru);
              }
            });
            widget.onChanged?.call(tags, booru);
          },
        ),
      ),
    );

    // Also handle result from Navigator.pop
    if (result != null && result != _controller.text) {
      setState(() {
        _controller.text = result;
      });
      widget.onChanged?.call(result, _selectedBooru);
    }
  }

  void _clear() {
    setState(() {
      _controller.clear();
    });
    widget.onChanged?.call('', _selectedBooru);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasText = _controller.text.isNotEmpty;
    final tagHandler = TagHandler.instance;

    final Widget field = Container(
      margin: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(height: 8),
          Material(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: widget.enabled ? _openTagSearch : null,
              borderRadius: BorderRadius.circular(10),
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.clearable && hasText && widget.enabled)
                        IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          onPressed: _clear,
                        ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: widget.enabled ? _openTagSearch : null,
                      ),
                    ],
                  ),
                  enabled: widget.enabled,
                ),
                child: hasText
                    ? widget.allowMultipleTags
                          ? Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              alignment: WrapAlignment.start,
                              children: _controller.text
                                  .split(' ')
                                  .where((t) => t.isNotEmpty)
                                  .map(
                                    (t) => SizedBox(
                                      height: 32,
                                      child: MainSearchTagChip(tag: t),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Text(
                              _controller.text.replaceAll('_', ' '),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: tagHandler.getTag(_controller.text).getColour(),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                    : (widget.hintText != null
                          ? Text(
                              widget.hintText!,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                            )
                          : null),
              ),
            ),
          ),
        ],
      ),
    );

    if (widget.onlyInput) {
      return field;
    }

    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: field,
        dense: false,
        shape: Border(
          top: widget.drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: 1) : BorderSide.none,
          bottom: widget.drawBottomBorder
              ? BorderSide(color: Theme.of(context).dividerColor, width: 1)
              : BorderSide.none,
        ),
      ),
    );
  }
}
