import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

// TODO
// - make the search box wider? use the same OverlayEntry method? https://stackoverflow.com/questions/60884031/draw-outside-listview-bounds-in-flutter
// - debounce search a bit


class TagSearchBox extends StatefulWidget {
  TagSearchBox();
  @override
  _TagSearchBoxState createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  ScrollController suggestionsScrollController = ScrollController();
  ScrollController searchScrollController = ScrollController();
  ScrollController tagsScrollController = ScrollController();

  OverlayEntry? _overlayEntry;
  bool isFocused = false;

  String input = "";
  String lastTag = "";
  List<String> splitInput = [];
  RxList<String> inputTags = RxList([]);

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
      }
    }
  }

  void updateOverlay() {
    if (searchHandler.searchBoxFocus.hasFocus) {
      print("textbox is focused");
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
                            searchHandler.searchTextController.text += '_';
                            // set cursor to the end when tapped unfocused
                            searchHandler.searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: searchHandler.searchTextController.text.length));
                            animateTransition();
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
      final bool isExclude = stringContent.startsWith('-');
      if(isExclude) {
        stringContent = stringContent.substring(1);
      }

      // TODO mark stuff like rating:safe, order:id... with purple color
      // final bool isModifier = false;

      if(stringContent.isEmpty) {
        // skip creating chip element for empty tags (i.e double spaces...)
        continue;
      }

      final Container tag = Container(
        decoration: BoxDecoration(
          color: isExclude ? Get.theme.colorScheme.error : Colors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 0, 3),
              child: Text(
                stringContent,
                style: TextStyle(
                  fontSize: 16,
                  color: isExclude ? Get.theme.colorScheme.onError : Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                splitInput.removeAt(i);
                searchHandler.searchTextController.text = splitInput.join(' ');
                tagStuff();
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  // color: Colors.yellow.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Icon(Icons.cancel, size: 24),
                  )
                )
              )
            ),
          ],
        ),
      );
      tags.add(tag);
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
    // Get last tag in the input and remove minus (exclude symbol)
    // TODO /bug?: use the tag behind the current cursor position, not the last tag
    lastTag = splitInput.last.replaceAll(RegExp(r'^-'), '');
    setState(() { });
  }

  void searchBooru(String input) async {
    booruResults.value = [[' ', 'loading']];
    List<String?>? getFromBooru = await searchHandler.currentTab.booruHandler.tagSearch(lastTag);
    booruResults.value = getFromBooru?.map((tag){
      final String tagTemp = tag != null ? tag : '';
      return [tagTemp, 'booru'];
    }).toList() ?? [];
  }
  void searchHistory(String input) async {
    historyResults.value = [[' ', 'loading']];
    historyResults.value = input.isNotEmpty
      ? (await settingsHandler.dbHandler.getSearchHistoryByInput(input, 2)).map((tag){
        return [tag, 'history'];
      }).toList()
      : [];
    historyResults.value = historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1).toList(); // filter out duplicates
  }
  void searchDatabase(String input) async {
    databaseResults.value = [[' ', 'loading']];
    databaseResults.value = input.isNotEmpty
      ? (await settingsHandler.dbHandler.getTags(input, 2)).map((tag){
        return [tag, 'database'];
      }).toList()
      : [];
    databaseResults.value = databaseResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1).toList();
  }
  // void searchModifiers(String input) async { }

  void combinedSearch() {
    searchBooru(lastTag);
    searchHistory(lastTag);
    searchDatabase(lastTag);
    // searchModifiers(lastTag);
  }

  Future<List<List<String>?>> combinedSearchOld(String input) async {
    List<String?>? getFromBooru = await searchHandler.currentTab.booruHandler.tagSearch(lastTag);
    final List<List<String>> booruResults = getFromBooru?.map((tag){
      final String tagTemp = tag != null ? tag : '';
      return [tagTemp, 'booru'];
    }).toList() ?? [];

    final List<List<String>> historyResults = input.isNotEmpty
      ? (await settingsHandler.dbHandler.getSearchHistoryByInput(input, 2)).map((tag){
        return [tag, 'history'];
      }).toList()
      : [];
    final List<List<String>> databaseResults = input.isNotEmpty
      ? (await settingsHandler.dbHandler.getTags(input, 2)).map((tag){
        return [tag, 'database'];
      }).toList()
      : [];

    // TODO add a list of search modifiers (rating:s, sort:score...) to every booru handler
    // final List<List<String>> searchModifiersResults = input.isNotEmpty
    //   ? searchHandler.booruHandler.searchModifiers().where((String sm) => sm.contains(input))
    //   : [];

    return [
      ...historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1), // filter out duplicates
      ...databaseResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
      ...booruResults
    ];
  }


  OverlayEntry? _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    // searchHandler.currentTab.booruHandler.limit = 20;
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
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> item = items[index];
                    final String tag = item[0];
                    if (tag.isNotEmpty) {
                      Widget? itemIcon;
                      switch (item[1]) {
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
                          // widget.searchBoxFocus.unfocus();
                          // Keep minus if its in the beggining of current (last) tag
                          bool isExclude = RegExp(r'^-').hasMatch(splitInput.last);
                          String newInput = "";

                          if (searchHandler.currentTab.selectedBooru.value.type == "Hydrus"){
                            newInput = input.substring(0, input.lastIndexOf(",") + 1) + (isExclude ? '-' : '') + tag.replaceAll("_", " ") + ",";
                          } else {
                            newInput = input.substring(0, input.lastIndexOf(" ") + 1) + (isExclude ? '-' : '') + tag + " ";
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
                          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
              contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0), // left,top,right,bottom
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
