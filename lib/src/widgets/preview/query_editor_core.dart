import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

/// Core search logic for query editors
/// Handles tag suggestions, auto-complete, and search debouncing
class QueryEditorController {
  QueryEditorController({
    required this.onUpdate,
    Booru? booru,
  }) : _currentBooru = booru;

  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  final VoidCallback onUpdate;
  Booru? _currentBooru;

  late final RichTextController suggestionTextController;
  String get suggestionTextControllerRawInput => suggestionTextController.text
      .replaceAll(RegExp('^-'), '')
      .replaceAll(RegExp('^~'), '')
      .replaceAll(RegExp(r'^\d+#'), '')
      .trim();

  final FocusNode suggestionTextFocusNode = FocusNode();
  final ValueNotifier<bool> suggestionTextFocusNodeHasFocus = ValueNotifier(false);

  bool loading = true;
  bool failed = false;
  String? failedMsg;

  List<TagSuggestion> suggestedTags = [];
  CancelToken? cancelToken;
  Timer? debounce;

  String _lastSuggestionText = '';

  Booru? get currentBooru => _currentBooru ?? searchHandler.currentBooru;

  BooruHandler _getBooruHandler() {
    if (_currentBooru != null) {
      return BooruHandlerFactory().getBooruHandler([_currentBooru!], null).booruHandler;
    }
    return searchHandler.currentBooruHandler;
  }

  void setBooru(Booru? booru) {
    _currentBooru = booru;
    runSearch(instant: true);
  }

  void initialize() {
    final tags = _getBooruHandler().availableMetaTags();

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

    suggestionTextController.addListener(onSuggestionTextChanged);
    suggestionTextFocusNode.addListener(suggestionTextFocusListener);
  }

  void onSuggestionTextChanged() {
    if (suggestionTextController.text != _lastSuggestionText) {
      _lastSuggestionText = suggestionTextController.text;
      runSearch(instant: false);
    }
  }

  void suggestionTextFocusListener() {
    suggestionTextFocusNodeHasFocus.value = suggestionTextFocusNode.hasFocus;
  }

  Future<void> runSearch({
    bool instant = true,
  }) async {
    final handler = _getBooruHandler();

    if (suggestionTextControllerRawInput.isEmpty) {
      debounce?.cancel();
      cancelToken?.cancel();
      loading = false;
      failed = false;
      failedMsg = null;
      suggestedTags.clear();
      onUpdate();
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
        onUpdate();

        final metaTags = handler.availableMetaTags();
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
          onUpdate();
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
                failed = false;
                failedMsg = null;
              } else {
                loading = false;
                failed = true;
                failedMsg = e.statusCode?.toString() ?? e.message;
              }

              onUpdate();
            },
            (data) {
              loading = false;
              failed = false;
              failedMsg = null;
              suggestedTags = data;
              onUpdate();

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
          onUpdate();
        }
      },
    );
  }

  void dispose() {
    debounce?.cancel();
    cancelToken?.cancel();
    suggestionTextFocusNode.removeListener(suggestionTextFocusListener);
    suggestionTextFocusNode.dispose();
    suggestionTextController.removeListener(onSuggestionTextChanged);
    suggestionTextController.dispose();
  }
}

/// Keyboard actions configuration for query editors
class QueryEditorKeyboardActions extends StatelessWidget {
  const QueryEditorKeyboardActions({
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    required this.onLongTap,
    required this.child,
    super.key,
  });

  final RichTextController controller;
  final FocusNode focusNode;
  final void Function(String) onSubmitted;
  final void Function(TagSuggestion) onLongTap;
  final Widget child;

  String get suggestionTextControllerRawInput =>
      controller.text.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').replaceAll(RegExp(r'^\d+#'), '').trim();

  double get keyboardActionsHeight => 44;

  KeyboardActionsConfig buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
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
                          final String beforeSelection = controller.selection.textBefore(
                            controller.text,
                          );
                          final String afterSelection = controller.selection.textAfter(
                            controller.text,
                          );
                          controller.text = '${beforeSelection}_$afterSelection';
                          controller.selection = TextSelection(
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
                            controller.text =
                                '${controller.text}${(controller.text.isEmpty || controller.text.endsWith(' ')) ? '' : ' '}$copied';
                            controller.selection = TextSelection(
                              baseOffset: controller.text.length,
                              extentOffset: controller.text.length,
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
                        onPressed: focusNode.unfocus,
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
                        valueListenable: controller,
                        builder: (context, _, _) {
                          return ElevatedButton(
                            onPressed: () => onSubmitted(controller.text),
                            onLongPress: () => onLongTap(TagSuggestion(tag: suggestionTextControllerRawInput)),
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
  Widget build(BuildContext context) {
    final settingsHandler = SettingsHandler.instance;

    return KeyboardActions(
      enable: settingsHandler.showSearchbarQuickActions && (Platform.isAndroid || Platform.isIOS),
      config: buildConfig(context),
      autoScroll: false,
      overscroll: 0,
      isDialog: false,
      child: child,
    );
  }
}
