import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/search/tag_chip.dart';

// TODO
// - make the search box wider? use the same OverlayEntry method? https://stackoverflow.com/questions/60884031/draw-outside-listview-bounds-in-flutter
// - parse tag type from search if possible

class TagSearchBox extends StatefulWidget {
  const TagSearchBox({super.key});

  @override
  State<TagSearchBox> createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  ScrollController suggestionsScrollController = ScrollController();
  ScrollController searchScrollController = ScrollController();
  ScrollController tagsScrollController = ScrollController();

  OverlayEntry? _overlayEntry;
  bool isFocused = false;

  String input = '';
  String lastTag = '';
  String replaceString = '';
  int startIndex = 0;
  int multiIndex = -1;
  int cursorPos = 0;
  List<String> splitInput = [];

  RxList<List<String>> booruResults = RxList([]);
  RxList<List<String>> historyResults = RxList([]);
  RxList<List<String>> databaseResults = RxList([]);
  RxList<List<String>> modifiersResults = RxList([]);

  CancelToken? cancelToken;

  @override
  void initState() {
    super.initState();
    searchHandler.searchBoxFocus.addListener(onFocusChange);
    searchHandler.searchTextController.addListener(onTextChanged);
    tagStuff();
  }

  void onTextChanged() {
    // force rerender if text changed when search is not focused
    if (!searchHandler.searchBoxFocus.hasFocus && input != searchHandler.searchTextController.text) {
      tagStuff();
    }
  }

  void onFocusChange() {
    if (searchHandler.searchBoxFocus.hasFocus) {
      createOverlay();
      isFocused = true;
    } else {
      removeOverlay();
      isFocused = false;
    }
    setState(() {});
  }

  void animateTransition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchScrollController.hasClients) {
        searchScrollController.animateTo(
          searchScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    });
  }

  void createOverlay() {
    if (searchHandler.searchBoxFocus.hasFocus) {
      if (_overlayEntry == null) {
        tagStuff();
        combinedSearch();
        _overlayEntry = _createOverlayEntry();
      }
      updateOverlay();
    }
  }

  void removeOverlay() {
    if (_overlayEntry != null) {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
        _overlayEntry = null; // remove and destroy overlay object from memory
      }
    }
  }

  void updateOverlay() {
    if (searchHandler.searchBoxFocus.hasFocus) {
      // print("textbox is focused");
      if (!_overlayEntry!.mounted) {
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        tagStuff();
        combinedSearch();
        _overlayEntry!.markNeedsBuild();
      }
    } else {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
      }
    }
  }

  @override
  void dispose() {
    removeOverlay();
    searchHandler.searchBoxFocus.unfocus();
    searchHandler.searchBoxFocus.removeListener(onFocusChange);
    searchHandler.searchTextController.removeListener(onTextChanged);

    cancelToken?.cancel();
    Debounce.cancel('tag_search_box');

    suggestionsScrollController.dispose();
    searchScrollController.dispose();
    tagsScrollController.dispose();
    super.dispose();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    const double buttonHeight = 44;

    final buttonStyle = Theme.of(context).elevatedButtonTheme.style?.copyWith(
          fixedSize: MaterialStateProperty.all<Size>(
            const Size(buttonHeight, buttonHeight),
          ),
        );

    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: searchHandler.searchBoxFocus,
          displayActionBar: false,
          displayArrows: false,
          displayDoneButton: false,
          footerBuilder: (_) => PreferredSize(
            preferredSize: const Size.fromHeight(buttonHeight),
            child: Container(
              color: Theme.of(context).colorScheme.background,
              height: buttonHeight,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add '_' at current cursor position
                      final String beforeSelection = searchHandler.searchTextController.selection.textBefore(searchHandler.searchTextController.text);
                      // final String insideSelection = searchHandler.searchTextController.selection.textInside(searchHandler.searchTextController.text);
                      final String afterSelection = searchHandler.searchTextController.selection.textAfter(searchHandler.searchTextController.text);
                      searchHandler.searchTextController.text = '${beforeSelection}_$afterSelection';
                      // set cursor to the end when tapped unfocused
                      searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: beforeSelection.length + 1));
                      // animateTransition();
                      createOverlay();
                    },
                    style: buttonStyle,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: SizedBox(
                          width: 24,
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
                        searchHandler.searchTextController.text += ' $copied ';
                        searchHandler.searchTextController.selection =
                            TextSelection.fromPosition(TextPosition(offset: searchHandler.searchTextController.text.length));
                        animateTransition();
                        createOverlay();
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
                    onPressed: () {
                      searchHandler.searchBoxFocus.unfocus();
                    },
                    style: buttonStyle,
                    child: Icon(
                      Icons.keyboard_hide,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      searchHandler.searchTextController.clearComposing();
                      searchHandler.searchBoxFocus.unfocus();
                      searchHandler.searchAction(searchHandler.searchTextController.text, null);
                    },
                    onLongPress: () {
                      ServiceHandler.vibrate();
                      searchHandler.searchTextController.clearComposing();
                      searchHandler.searchBoxFocus.unfocus();
                      searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
                    },
                    style: buttonStyle,
                    child: Icon(
                      Icons.search,
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

  List<Widget> getTagsChips() {
    // TODO on desktop - set cursor to where user clicked?
    // based on https://github.com/eyoeldefare/textfield_tags
    final List<Widget> tags = [];

    for (var i = 0; i < splitInput.length; i++) {
      final String stringContent = splitInput.elementAt(i);
      if (stringContent.isEmpty) {
        // skip creating chip element for empty tags (i.e double spaces...)
        continue;
      }
      tags.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TagChip(
            tagString: stringContent,
            trailing: GestureDetector(
              onTap: () {
                splitInput.removeAt(i);
                searchHandler.searchTextController.text = splitInput.join(' ');
                tagStuff();
                combinedSearch();
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  child: Icon(Icons.cancel, size: 24, color: Colors.white.withOpacity(0.9)),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return tags;
  }

  void tagStuff() {
    input = searchHandler.searchTextController.text;
    if (searchHandler.currentBooru.type == BooruType.Hydrus) {
      splitInput = input.trim().split(',');
    } else {
      splitInput = input.trim().split(' ');
    }
    startIndex = 0;
    setSelectedTag(input);
    multiIndex = -1;
    if (lastTag.startsWith(RegExp(r'\d+#'))) {
      final int tmpIndex = int.parse(lastTag.split('#')[0]) - 1;
      final String tag = lastTag.split('#')[1];
      if (searchHandler.currentBooruHandler is MergebooruHandler) {
        final MergebooruHandler handler = searchHandler.currentBooruHandler as MergebooruHandler;
        if (tmpIndex >= 0 && tmpIndex < handler.booruHandlers.length) {
          multiIndex = tmpIndex;
          lastTag = tag;
        }
      }
    }

    //remove minus (exclude symbol) or tilde (or symbol)
    lastTag = lastTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '');
    // print("LASTTAG: $lastTag");
    setState(() {});
  }

  void setSelectedTag(String input) {
    cursorPos = searchHandler.searchTextController.selection.baseOffset;
    if (cursorPos < 0) cursorPos = 0;
    int tmpStartIndex = cursorPos - 1;
    while (tmpStartIndex > 0 && (searchHandler.currentBooru.type == BooruType.Hydrus ? input[tmpStartIndex] != ',' : input[tmpStartIndex] != ' ')) {
      tmpStartIndex--;
    }

    if (cursorPos == input.length) {
      lastTag = splitInput.last;
      replaceString = lastTag;
    } else {
      int endIndex = input.indexOf(' ', cursorPos);
      if (searchHandler.currentBooru.type == BooruType.Hydrus) {
        if (tmpStartIndex == -1) {
          endIndex = input.length;
        } else {
          endIndex = input.indexOf(',', tmpStartIndex);
        }
      }
      if (endIndex == -1) endIndex = cursorPos;
      lastTag = input.substring((tmpStartIndex == 0 ? tmpStartIndex : tmpStartIndex + 1), cursorPos).trim();
      replaceString = input.substring((tmpStartIndex == 0 ? tmpStartIndex : tmpStartIndex + 1), endIndex);
      startIndex = tmpStartIndex;
    }
  }

  Future<void> searchBooru() async {
    booruResults.value = [
      [' ', 'loading'],
    ];
    // TODO cancel previous search when new starts
    List<String?> getFromBooru = [];
    cancelToken?.cancel();
    cancelToken = CancelToken();
    if (multiIndex != -1) {
      final MergebooruHandler handler = searchHandler.currentBooruHandler as MergebooruHandler;
      getFromBooru = await handler.booruHandlers[multiIndex].tagSearch(lastTag, cancelToken: cancelToken);
    } else {
      getFromBooru = await searchHandler.currentBooruHandler.tagSearch(lastTag, cancelToken: cancelToken);
    }

    booruResults.value = getFromBooru.map((tag) {
      final String tagTemp = tag ?? '';
      return [tagTemp, 'booru'];
    }).toList();
  }

  Future<void> searchHistory() async {
    historyResults.value = [
      [' ', 'loading'],
    ];
    historyResults.value = lastTag.isNotEmpty
        ? (await settingsHandler.dbHandler.getSearchHistoryByInput(lastTag, 2)).map((tag) {
            return [tag, 'history'];
          }).toList()
        : [];
    historyResults.value =
        historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1).toList(); // filter out duplicates
  }

  Future<void> searchDatabase() async {
    databaseResults.value = [
      [' ', 'loading'],
    ];
    databaseResults.value = lastTag.isNotEmpty
        ? (await settingsHandler.dbHandler.getTags(lastTag, 2)).map((tag) {
            return [tag, 'database'];
          }).toList()
        : [];
    databaseResults.value = databaseResults
        .where(
          (tag) =>
              booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 &&
              historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1,
        )
        .toList();
  }
  // TODO add a list of search modifiers (rating:s, sort:score...) to every booru handler
  // void searchModifiers() async { }

  void combinedSearch() {
    // drop previous list even if new search didn't start yet
    booruResults.value = [
      [' ', 'loading'],
    ];
    Debounce.debounce(
      tag: 'tag_search_box',
      callback: () {
        searchBooru();
        searchHistory();
        searchDatabase();
        // searchModifiers();
      },
      duration: const Duration(milliseconds: 300),
    );
  }

  OverlayEntry? _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width * 1.2,
        height: 300,
        child: Material(
          elevation: 4,
          color: Theme.of(context).colorScheme.surface,
          child: Obx(() {
            final List<List<String>> items = [
              ...historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
              ...databaseResults.where(
                (tag) =>
                    booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 &&
                    historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1,
              ),
              ...booruResults,
            ];

            if (items.isEmpty) {
              return ListTile(
                horizontalTitleGap: 4,
                minLeadingWidth: 20,
                minVerticalPadding: 0,
                leading: null,
                title: const MarqueeText(
                  text: 'No Suggestions!',
                  isExpanded: false,
                ),
                onTap: () {
                  tagStuff();
                  combinedSearch();
                  _overlayEntry!.markNeedsBuild();
                },
              );
            } else {
              return Scrollbar(
                controller: suggestionsScrollController,
                child: ListView.builder(
                  controller: suggestionsScrollController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: false,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> item = items[index];
                    final String tag = item[0];
                    final String type = item[1];

                    final Color tagColor = tagHandler.getTag(tag).getColour();

                    if (tag.isNotEmpty) {
                      Widget itemIcon = const SizedBox();
                      switch (type) {
                        case 'history':
                          itemIcon = const Icon(Icons.history);
                          break;
                        case 'database':
                          itemIcon = const Icon(Icons.archive);
                          break;
                        case 'loading':
                          itemIcon = const CircularProgressIndicator();
                          break;
                        default:
                          itemIcon = const Icon(null);
                          break;
                      }
                      return ListTile(
                        horizontalTitleGap: 4,
                        minLeadingWidth: 20,
                        minVerticalPadding: 0,
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 24,
                              color: tagColor,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              child: itemIcon,
                            ),
                          ],
                        ),
                        title: MarqueeText(
                          key: ValueKey(tag),
                          text: tag,
                          isExpanded: false,
                        ),
                        onTap: () {
                          if (type == 'loading') {
                            return;
                          }

                          // widget.searchBoxFocus.unfocus();

                          final String multiIndex = replaceString.startsWith(RegExp(r'\d+#')) ? "${replaceString.split("#")[0]}#" : '';
                          // Keep minus if its in the beggining of current (last) tag
                          final bool isExclude = RegExp('^-').hasMatch(replaceString.replaceAll(RegExp(r'\d+#'), ''));
                          final bool isOr = RegExp('^~').hasMatch(replaceString.replaceAll(RegExp(r'\d+#'), ''));
                          String newTag = multiIndex + (isExclude ? '-' : '') + (isOr ? '~' : '') + tag;
                          if (searchHandler.currentBooru.type == BooruType.Hydrus) {
                            final String tagWithSpaces = newTag.replaceAll(RegExp('_'), ' ');
                            newTag = '$tagWithSpaces,';
                          } else {
                            newTag = '$newTag ';
                          }

                          String newInput = '';
                          if (startIndex >= 0 && replaceString.isNotEmpty) {
                            //newInput = searchHandler.searchTextController.text.replaceRange(start, end, replacement)
                            newInput = searchHandler.searchTextController.text.replaceFirst(replaceString, newTag, cursorPos - replaceString.length);
                          } else if (startIndex == -1) {
                            newInput = newTag + (searchHandler.currentBooru.type == BooruType.Hydrus ? ',' : ' ') + searchHandler.searchTextController.text;
                          } else {
                            newInput = searchHandler.searchTextController.text + newTag;
                          }

                          searchHandler.searchTextController.text = newInput;
                          // Set the cursor to the end of the search and reset the overlay data
                          searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: newInput.length));
                          animateTransition();

                          tagStuff();
                          combinedSearch();
                          _overlayEntry!.markNeedsBuild();

                          setState(() {});
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO see if it is possible to make keyboardactions movement a bit smoother
    // keyboardactions don't avoid keyboard in emulator for some reason
    return Expanded(
      child: SizedBox(
        height: 50,
        child: KeyboardActions(
          enable: Platform.isAndroid || Platform.isIOS,
          config: _buildConfig(context),
          autoScroll: false,
          overscroll: 0,
          isDialog: true,
          child: TextField(
            controller: isFocused ? searchHandler.searchTextController : TextEditingController(),
            scrollController: searchScrollController,
            textInputAction: TextInputAction.search,
            focusNode: searchHandler.searchBoxFocus,
            enableInteractiveSelection: true,
            onChanged: (text) {
              createOverlay();
            },
            onSubmitted: (String text) {
              searchHandler.searchBoxFocus.unfocus();
              searchHandler.searchAction(text, null);
            },
            onEditingComplete: () {
              searchHandler.searchBoxFocus.unfocus();
            },
            onTap: () {
              if (!searchHandler.searchBoxFocus.hasFocus) {
                // add space to the end
                if (input.isNotEmpty && input[input.length - 1] != ' ') {
                  searchHandler.searchTextController.text = '$input ';
                  createOverlay();
                }
                // set cursor to the end when tapped unfocused
                searchHandler.searchTextController.selection = TextSelection.fromPosition(
                  TextPosition(offset: searchHandler.searchTextController.text.length),
                );
                animateTransition();
              } else {
                tagStuff();
                combinedSearch();
              }
            },
            decoration: InputDecoration(
              hintText: searchHandler.searchTextController.text.isEmpty ? 'Enter Tags' : '',
              prefixIcon: isFocused //searchHandler.searchTextController.text.length > 0
                  ? IconButton(
                      padding: const EdgeInsets.all(5),
                      onPressed: () {
                        searchHandler.searchTextController.clear();
                        tagStuff();
                        combinedSearch();
                        _overlayEntry!.markNeedsBuild();
                        setState(() {});
                      },
                      icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onBackground),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Listener(
                          onPointerSignal: (pointerSignal) {
                            if (pointerSignal is PointerScrollEvent) {
                              tagsScrollController.jumpTo(
                                tagsScrollController.offset + pointerSignal.scrollDelta.dy,
                                // duration: Duration(milliseconds: 20),
                                // curve: Curves.linear
                              );
                            }
                          },
                          child: SingleChildScrollView(
                            controller: tagsScrollController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...getTagsChips(),
                                if (input.isNotEmpty && splitInput.isNotEmpty) ...[
                                  if (splitInput.length < 3) const SizedBox(width: 120) else const SizedBox(width: 60),
                                  const Text(''),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
            ),
          ),
        ),
      ),
    );
  }
}
