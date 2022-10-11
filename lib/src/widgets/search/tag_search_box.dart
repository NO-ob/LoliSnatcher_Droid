import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/search/tag_chip.dart';

import '../../utils/logger.dart';

// TODO
// - make the search box wider? use the same OverlayEntry method? https://stackoverflow.com/questions/60884031/draw-outside-listview-bounds-in-flutter
// - debounce searches [In progress: needs rewrite of tagSearch to dio to use requests cancelling]
// - parse tag type from search if possible


class TagSearchBox extends StatefulWidget {
  const TagSearchBox({Key? key}) : super(key: key);

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

  String input = "";
  String lastTag = "";
  String replaceString = "";
  int startIndex = 0;
  int multiIndex = -1;
  List<String> splitInput = [];

  RxList<List<String>> booruResults = RxList([]);
  RxList<List<String>> historyResults = RxList([]);
  RxList<List<String>> databaseResults = RxList([]);
  RxList<List<String>> modifiersResults = RxList([]);

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
    setState(() { });
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
        Overlay.of(context)!.insert(_overlayEntry!);
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

    Debounce.cancel('tag_search_box');

    suggestionsScrollController.dispose();
    searchScrollController.dispose();
    tagsScrollController.dispose();
    super.dispose();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
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
            preferredSize: const Size.fromHeight(44),
            child: Container(
              color: Theme.of(context).colorScheme.background,
              height: 44,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 40,
                        color: Theme.of(context).colorScheme.secondary,
                        child: TextButton(
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
                          child: Text('__', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSecondary)),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 40,
                        color: Theme.of(context).colorScheme.secondary,
                        child: TextButton(
                          onPressed: () async {
                            ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
                            String copied = cdata?.text ?? '';
                            if(copied.isNotEmpty) {
                              searchHandler.searchTextController.text += ' $copied ';
                              searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: searchHandler.searchTextController.text.length));
                              animateTransition();
                              createOverlay();
                            }
                          },
                          child: Icon(Icons.paste, color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 40,
                        color: Theme.of(context).colorScheme.secondary,
                        child: TextButton(
                          onPressed: () {
                            searchHandler.searchBoxFocus.unfocus();
                          },
                          child: Icon(Icons.keyboard_hide, color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 40,
                        color: Theme.of(context).colorScheme.secondary,
                        child: TextButton(
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
                          child: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ]
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
    List<Widget> tags = [];

    for (var i = 0; i < splitInput.length; i++) {
      String stringContent = splitInput.elementAt(i);
      if(stringContent.isEmpty) {
        // skip creating chip element for empty tags (i.e double spaces...)
        continue;
      }
      tags.add(TagChip(
        tagString: stringContent,
        gestureDetector: GestureDetector(
            onTap: () {
              splitInput.removeAt(i);
              searchHandler.searchTextController.text = splitInput.join(' ');
              tagStuff();
              combinedSearch();
            },
            child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  child: Icon(Icons.cancel, size: 24),
                )
            )
        ),
      ));
    }
    return tags;
  }

  void tagStuff() {
    input = searchHandler.searchTextController.text;
    if (searchHandler.currentBooru.type == "Hydrus"){
      splitInput = input.split(",");
    } else {
      splitInput = input.split(" ");
    }
    startIndex = 0;
    setSelectedTag(input);
    multiIndex = -1;
    if (lastTag.startsWith(RegExp(r"\d+#"))){
      int tmpIndex = int.parse(lastTag.split("#")[0]) - 1;
      String tag = lastTag.split("#")[1];
      if (searchHandler.currentBooruHandler is MergebooruHandler){
        MergebooruHandler handler = searchHandler.currentBooruHandler as MergebooruHandler;
        if ((tmpIndex) >= 0 && tmpIndex < handler.booruHandlers.length){
          multiIndex = tmpIndex;
          lastTag = tag;
        }
      }
    }

    //remove minus (exclude symbol) or tilde (or symbol)
    lastTag = lastTag.replaceAll(RegExp(r'^-'), '').replaceAll(RegExp(r'^~'), '');
    // print("LASTTAG: $lastTag");
    setState(() { });
  }

  void setSelectedTag(String input){
    int cursorPos = searchHandler.searchTextController.selection.baseOffset;
    if (cursorPos < 0) cursorPos = 0;
    int tmpStartIndex = cursorPos - 1;
    while(
    tmpStartIndex > 0 &&
        (
            searchHandler.currentBooru.type == "Hydrus"?
            input[tmpStartIndex] != ",":
            input[tmpStartIndex] != " "
        )
    ) {
      tmpStartIndex --;
    }

    if (cursorPos == input.length){
      lastTag = splitInput.last;
      replaceString = lastTag;
    } else {
      int endIndex = input.indexOf(" ", cursorPos);
      if (searchHandler.currentBooru.type == "Hydrus"){
        if(tmpStartIndex == -1){
          endIndex = input.length;
        } else {
          endIndex = input.indexOf(",", tmpStartIndex);
        }
      }
      if (endIndex == -1) endIndex = cursorPos;
      lastTag = input.substring((tmpStartIndex == 0 ? tmpStartIndex : tmpStartIndex + 1), cursorPos).trim();
      replaceString = input.substring((tmpStartIndex == 0 ? tmpStartIndex : tmpStartIndex + 1), endIndex);
      startIndex = tmpStartIndex;
    }

  }

  void searchBooru() async {
    booruResults.value = [[' ', 'loading']];
    // TODO cancel previous search when new starts
    List<String?>? getFromBooru = [];
    if (multiIndex != -1){
      MergebooruHandler handler = searchHandler.currentBooruHandler as MergebooruHandler;
      getFromBooru = await handler.booruHandlers[multiIndex].tagSearch(lastTag);
    } else {
      getFromBooru = await searchHandler.currentBooruHandler.tagSearch(lastTag);
    }

    booruResults.value = getFromBooru?.map((tag){
      final String tagTemp = tag ?? '';
      return [tagTemp, 'booru'];
    }).toList() ?? [];
  }

  void searchHistory() async {
    historyResults.value = [[' ', 'loading']];
    historyResults.value = lastTag.isNotEmpty
      ? (await settingsHandler.dbHandler.getSearchHistoryByInput(lastTag, 2)).map((tag){
        return [tag, 'history'];
      }).toList()
      : [];
    historyResults.value = historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1).toList(); // filter out duplicates
  }
  void searchDatabase() async {
    databaseResults.value = [[' ', 'loading']];
    databaseResults.value = lastTag.isNotEmpty
      ? (await settingsHandler.dbHandler.getTags(lastTag, 2)).map((tag){
        return [tag, 'database'];
      }).toList()
      : [];
    databaseResults.value = databaseResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1).toList();
  }
  // TODO add a list of search modifiers (rating:s, sort:score...) to every booru handler
  // void searchModifiers() async { }

  void combinedSearch() {
    // drop previous list even if new search didn't start yet
    booruResults.value = [[' ', 'loading']];
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
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width * 1.2,
        height: 300,
        child: Material(
          elevation: 4.0,
          color: Theme.of(context).colorScheme.surface,
          child: Obx(() {
            List<List<String>> items = [
              ...historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
              ...databaseResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
              ...booruResults,
            ];

            if(items.isEmpty) {
              return ListTile(
                horizontalTitleGap: 4,
                minLeadingWidth: 20,
                minVerticalPadding: 0,
                leading: null,
                title: const MarqueeText(
                  text: 'No Suggestions!',
                  fontSize: 16,
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

                    Color tagColor = tagHandler.getTag(tag).getColour();

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
                          fontSize: 16,
                          isExpanded: false,
                        ),
                        onTap: () {
                          if(type == 'loading') {
                            return;
                          }

                          // widget.searchBoxFocus.unfocus();

                          String multiIndex = replaceString.startsWith(RegExp(r"\d+#")) ? "${replaceString.split("#")[0]}#" : "";
                          // Keep minus if its in the beggining of current (last) tag
                          bool isExclude = RegExp(r'^-').hasMatch(replaceString.replaceAll(RegExp(r"\d+#"), ""));
                          bool isOr = RegExp(r'^~').hasMatch(replaceString.replaceAll(RegExp(r"\d+#"), ""));
                          String newTag = multiIndex + (isExclude ? '-' : '') + (isOr ? '~' : '') + tag;
                          if (searchHandler.currentBooru.type == "Hydrus") {
                            final String tagWithSpaces = newTag.replaceAll(RegExp(r'_'), ' ');
                            newTag = "$tagWithSpaces,";
                          } else {
                            newTag = "$newTag ";
                          }

                          String newInput = "";
                          if (startIndex >= 0 && replaceString.isNotEmpty){
                            newInput = searchHandler.searchTextController.text.replaceFirst(replaceString, newTag, startIndex);
                          } else if (startIndex == -1){
                            newInput = newTag + (searchHandler.currentBooru.type == "Hydrus" ? "," : " ") + searchHandler.searchTextController.text;
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

                          setState(() { });
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                )
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
            onEditingComplete: (){
              searchHandler.searchBoxFocus.unfocus();
            },
            onTap: () {
              if(!searchHandler.searchBoxFocus.hasFocus) {
                // add space to the end
                if(input.isNotEmpty && input[input.length - 1] != ' ') {
                  searchHandler.searchTextController.text = '$input ';
                  createOverlay();
                }
                // set cursor to the end when tapped unfocused
                searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: searchHandler.searchTextController.text.length));
                animateTransition();
              } else {
                tagStuff();
                combinedSearch();
              }
            },
            decoration: InputDecoration(
              hintText: searchHandler.searchTextController.text.isEmpty ? "Enter Tags" : '',
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
                      borderRadius: BorderRadius.circular(50)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48.5),
                      child: Listener(
                        onPointerSignal: (pointerSignal) {
                          if(pointerSignal is PointerScrollEvent) {
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
                              if(input.isNotEmpty)
                                const SizedBox(width: 60),
                            ],
                          ),
                        )
                      ),
                    )
                  ),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 0), // left,top,right,bottom
            ),
          )
        )
      )
    );
  }
}
