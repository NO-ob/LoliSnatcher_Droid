import 'dart:async';
import 'dart:io';

import 'package:LoliSnatcher/libBooru/MergebooruHandler.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

import 'TagChip.dart';

// TODO
// - make the search box wider? use the same OverlayEntry method? https://stackoverflow.com/questions/60884031/draw-outside-listview-bounds-in-flutter
// - debounce searches [In progress: needs rewrite of tagSearch to dio to use requests cancelling]


class TagSearchBox extends StatefulWidget {
  TagSearchBox();
  @override
  _TagSearchBoxState createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

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

  Timer? debounceTimer;

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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
      if (this._overlayEntry == null) {
        tagStuff();
        combinedSearch();
        this._overlayEntry = _createOverlayEntry();
      }
      this.updateOverlay();
    }
  }

  void removeOverlay() {
    if (this._overlayEntry != null) {
      if (this._overlayEntry!.mounted) {
        this._overlayEntry!.remove();
        this._overlayEntry = null; // remove and destroy overlay object from memory
      }
    }
  }

  void updateOverlay() {
    if (searchHandler.searchBoxFocus.hasFocus) {
      // print("textbox is focused");
      if (!this._overlayEntry!.mounted) {
        Overlay.of(context)!.insert(this._overlayEntry!);
      } else {
        tagStuff();
        combinedSearch();
        this._overlayEntry!.markNeedsBuild();
      }
    } else {
      if (this._overlayEntry!.mounted) {
        this._overlayEntry!.remove();
      }
    }
  }

  @override
  void dispose() {
    removeOverlay();
    searchHandler.searchBoxFocus.unfocus();
    searchHandler.searchBoxFocus.removeListener(onFocusChange);
    searchHandler.searchTextController.removeListener(onTextChanged);

    debounceTimer?.cancel();

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
            child: Container(
              color: Get.theme.colorScheme.background,
              height: 44,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 40,
                        color: Get.theme.colorScheme.secondary,
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
                          child: Text('__', style: TextStyle(fontSize: 20, color: Get.theme.colorScheme.onSecondary)),
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
                        color: Get.theme.colorScheme.secondary,
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
                          child: Icon(Icons.paste, color: Get.theme.colorScheme.onSecondary),
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
                        color: Get.theme.colorScheme.secondary,
                        child: TextButton(
                          onPressed: () {
                            searchHandler.searchBoxFocus.unfocus();
                          },
                          child: Icon(Icons.keyboard_hide, color: Get.theme.colorScheme.onSecondary),
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
                        color: Get.theme.colorScheme.secondary,
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
                          child: Icon(Icons.search, color: Get.theme.colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ]
              ),
            ),
            preferredSize: Size.fromHeight(44)
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
    if (searchHandler.currentTab.selectedBooru.value.type == "Hydrus"){
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
    print("LASTTAG: $lastTag");
    setState(() { });
  }

  void setSelectedTag(String input){
    int cursorPos = searchHandler.searchTextController.selection.baseOffset;
    if (cursorPos < 0) cursorPos = 0;
    int tmpStartIndex = cursorPos - 1;
    while(
    tmpStartIndex > 0 &&
        (
            searchHandler.currentTab.selectedBooru.value.type == "Hydrus"?
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
      if (searchHandler.currentTab.selectedBooru.value.type == "Hydrus"){
        endIndex = input.indexOf(",", tmpStartIndex);
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
    debounceTimer?.cancel();
    // drop previous list even if new search didn't start yet
    booruResults.value = [[' ', 'loading']];
    debounceTimer = Timer(const Duration(milliseconds: 300), () {
      searchBooru();
      searchHistory();
      searchDatabase();
      // searchModifiers();
    });
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
          child: Obx(() {
            List<List<String>> items = [
              ...historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
              ...databaseResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
              ...booruResults,
            ];

            if(items.length == 0) {
              return ListTile(
                horizontalTitleGap: 4,
                minLeadingWidth: 20,
                minVerticalPadding: 0,
                leading: null,
                title: MarqueeText(
                  text: 'No Suggestions!',
                  fontSize: 16,
                  isExpanded: false,
                ),
                onTap: () {
                  tagStuff();
                  combinedSearch();
                  this._overlayEntry!.markNeedsBuild();
                },
              );
            } else {
              return Scrollbar(
                controller: suggestionsScrollController,
                interactive: true,
                isAlwaysShown: true,
                thickness: 10,
                radius: Radius.circular(10),
                child: ListView.builder(
                  controller: suggestionsScrollController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: false,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> item = items[index];
                    final String tag = item[0];
                    final String type = item[1];

                    if (tag.isNotEmpty) {
                      Widget? itemIcon;
                      switch (type) {
                        case 'history':
                          itemIcon = Icon(Icons.history);
                          break;
                        case 'database':
                          itemIcon = Icon(Icons.archive);
                          break;
                        case 'loading':
                          itemIcon = CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
                          );
                          break;
                        default:
                          itemIcon = Icon(null);
                          break;
                      }
                      return ListTile(
                        horizontalTitleGap: 4,
                        minLeadingWidth: 20,
                        minVerticalPadding: 0,
                        leading: itemIcon,
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

                          String multiIndex = replaceString.startsWith(RegExp(r"\d+#")) ? replaceString.split("#")[0] + "#" : "";
                          // Keep minus if its in the beggining of current (last) tag
                          bool isExclude = RegExp(r'^-').hasMatch(replaceString.replaceAll(RegExp(r"\d+#"), ""));
                          bool isOr = RegExp(r'^~').hasMatch(replaceString.replaceAll(RegExp(r"\d+#"), ""));
                          String newTag = "";
                          if (searchHandler.currentTab.selectedBooru.value.type == "Hydrus"){
                            newTag = multiIndex + (isExclude ? '-' : '') + (isOr ? '~' : '') + tag.replaceAll("_", " ") + ",";
                          } else {
                            newTag = multiIndex + (isExclude ? '-' : '') + (isOr ? '~' : '') + tag + " ";
                          }
                          String newInput = "";
                          if (startIndex >= 0 && replaceString.isNotEmpty){
                            newInput = searchHandler.searchTextController.text.replaceFirst(replaceString, newTag, startIndex);
                          } else if (startIndex == -1){
                            newInput = newTag + (searchHandler.currentTab.selectedBooru.value.type == "Hydrus" ? "," : " ") + searchHandler.searchTextController.text;
                          } else {
                            newInput = searchHandler.searchTextController.text + newTag;
                          }

                          searchHandler.searchTextController.text = newInput;
                          // Set the cursor to the end of the search and reset the overlay data
                          searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: newInput.length));
                          animateTransition();

                          tagStuff();
                          combinedSearch();
                          this._overlayEntry!.markNeedsBuild();

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
      child: Container(
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
                  searchHandler.searchTextController.text = input + ' ';
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
              fillColor: Get.theme.colorScheme.surface,
              filled: true,
              hintText: searchHandler.searchTextController.text.length == 0 ? "Enter Tags" : '',
              prefixIcon: isFocused //searchHandler.searchTextController.text.length > 0
                ? IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      searchHandler.searchTextController.clear();
                      tagStuff();
                      combinedSearch();
                      this._overlayEntry!.markNeedsBuild();
                      setState(() {});
                    },
                    icon: Icon(Icons.clear, color: Get.theme.colorScheme.onBackground),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
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
              contentPadding: EdgeInsets.fromLTRB(15, 0, 5, 0), // left,top,right,bottom
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
                borderRadius: BorderRadius.circular(50),
                gapPadding: 0,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.errorColor),
                borderRadius: BorderRadius.circular(50),
                gapPadding: 0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
                borderRadius: BorderRadius.circular(50),
                gapPadding: 0,
              ),
            ),
          )
        )
      )
    );
  }
}
