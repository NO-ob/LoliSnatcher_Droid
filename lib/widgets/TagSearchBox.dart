import 'dart:ui';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:get/get.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';


class TagSearchBox extends StatefulWidget {
  SearchGlobals searchGlobals;
  TextEditingController searchTagsController;
  FocusNode _focusNode;
  SettingsHandler settingsHandler;
  Function searchAction;
  TagSearchBox(this.searchGlobals, this.searchTagsController, this._focusNode, this.settingsHandler, this.searchAction);
  @override
  _TagSearchBoxState createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  OverlayEntry? _overlayEntry;
  String input = "";
  String lastTag = "";
  List splitInput = [];
  ScrollController scrollController = ScrollController();

  void setBooruHandler() {
    List temp = new BooruHandlerFactory()
        .getBooruHandler(widget.searchGlobals.selectedBooru!, widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    widget.searchGlobals.booruHandler = temp[0];
    widget.searchGlobals.pageNum = temp[1];
    if (widget.searchGlobals.booruHandler!.booru.type == "Szurubooru" &&
        widget.searchGlobals.booruHandler!.booru.apiKey != "" &&
        widget.searchGlobals.booruHandler!.booru.userID != "") {
      widget.searchGlobals.booruHandler!.tagSearchEnabled = false;
    }
  }

  @override
  void initState() {
    super.initState();
    widget._focusNode.addListener(onFocusChange);
    input = widget.searchTagsController.text;
    splitInput = input.split(" ");
    lastTag = input;
  }

  void onFocusChange(){
    if (widget._focusNode.hasFocus){
      createOverlay();
    } else {
      removeOverlay();
    }
  }

  void createOverlay() {
    if (widget._focusNode.hasFocus){
      if (this._overlayEntry == null){
        tagStuff();
        this._overlayEntry = _createOverlayEntry();
      }
      this._updateOverlay();
    }
  }

  void removeOverlay(){
    if (this._overlayEntry != null){
      if (this._overlayEntry!.mounted) {
        this._overlayEntry!.remove();
      }
    }
  }

  void _updateOverlay() {
    if (widget._focusNode.hasFocus) {
      print("textbox is focused");
      if (!this._overlayEntry!.mounted) {
        Overlay.of(context)!.insert(this._overlayEntry!);
      } else {
        tagStuff();
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
    widget._focusNode.unfocus();
    super.dispose();
  }

  void tagStuff(){
    if (widget.searchGlobals.booruHandler!.tagSearchEnabled) {
      input = widget.searchTagsController.text;
      splitInput = input.split(" ");
      // lastTag = input;
      // if (splitInput.length > 1) {
        // Get last tag in the input and remove minus (exclude symbol)
        // TODO /bug?: use the tag behind the current cursor position, not the last tag
        setState(() {
          lastTag = splitInput[splitInput.length - 1].replaceAll(new RegExp(r'^-'), '');
        });
      // }
    }
  }

  Future<List<List<String>?>> combinedSearch(String input) async {
    List<String?>? getFromBooru = await widget.searchGlobals.booruHandler!.tagSearch(lastTag);
    final List<List<String>> booruResults = getFromBooru?.map((tag){
      final String tagTemp = tag != null ? tag : '';
      return [tagTemp, 'booru'];
    }).toList() ?? [];

    final List<List<String>> historyResults = input.isNotEmpty
      ? (await widget.settingsHandler.dbHandler.getSearchHistoryByInput(input, 2)).map((tag){
        return [tag, 'history'];
      }).toList()
      : [];
    final List<List<String>> favouritesResults = input.isNotEmpty
      ? (await widget.settingsHandler.dbHandler.getTags(input, 2)).map((tag){
        return [tag, 'favourites'];
      }).toList()
      : [];

    // TODO add a list of search modifiers (rating:s, sort:score...) to every booru handler
    // final List<List<String>> searchModifiersResults = input.isNotEmpty
    //   ? widget.searchGlobals.booruHandler!.searchModifiers().where((String sm) => sm.contains(input))
    //   : [];

    return [
      ...historyResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1), // filter out duplicates
      ...favouritesResults.where((tag) => booruResults.indexWhere((btag) => btag[0].toLowerCase() == tag[0].toLowerCase()) == -1 && historyResults.indexWhere((htag) => htag[0].toLowerCase() == tag[0].toLowerCase()) == -1),
      ...booruResults
    ];
  }


  OverlayEntry? _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    setBooruHandler();
    widget.searchGlobals.booruHandler!.limit = 20;
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
            child: FutureBuilder(
                future: combinedSearch(lastTag),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                    if(snapshot.data.length == 0) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text('No results!', style: TextStyle(fontSize: 16))
                      );
                    } else {
                      return Scrollbar(
                        controller: scrollController,
                        interactive: true,
                        isAlwaysShown: true,
                        thickness: 10,
                        radius: Radius.circular(10),
                        child: ListView.builder(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final List<String> item = snapshot.data[index];
                            if (item[0].isNotEmpty){
                              IconData? itemIcon;
                              switch (item[1]) {
                                case 'history':
                                  itemIcon = Icons.history;
                                break;
                                case 'favourites':
                                  itemIcon = Icons.archive;
                                break;
                              }
                              return ListTile(
                                horizontalTitleGap: 4,
                                minLeadingWidth: 20,
                                minVerticalPadding: 0,
                                leading: Icon(itemIcon),
                                title: MarqueeText(
                                  text: item[0],
                                  fontSize: 16,
                                  startPadding: 0,
                                  isExpanded: false,
                                ),
                                onTap: (() {
                                  // widget._focusNode.unfocus();
                                  // Keep minus if its in the beggining of current (last) tag
                                  bool isExclude = new RegExp(r'^-').hasMatch(splitInput[splitInput.length - 1]);
                                  String newInput = input.substring(0, input.lastIndexOf(" ") + 1) + (isExclude ? '-' : '') + item[0] + " ";
                                  setState(() {
                                    widget.searchTagsController.text = newInput;

                                    // Set the cursor to the end of the search and reset the overlay data
                                    widget.searchTagsController.selection = TextSelection.fromPosition(TextPosition(offset: newInput.length));
                                  });
                                  this._overlayEntry!.markNeedsBuild();
                                }),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                        )
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
          controller: widget.searchTagsController,
          focusNode: widget._focusNode,
          onChanged: (text) {
            createOverlay();
          },
          onSubmitted: (String text) {
            widget._focusNode.unfocus();
            widget.searchAction(text);
          },
          onEditingComplete: (){
            widget._focusNode.unfocus();
          },
          onTap: (){
            if(!widget._focusNode.hasFocus) {
              // set cursor to the end when tapped unfocused
              widget.searchTagsController.selection = TextSelection.fromPosition(TextPosition(offset: widget.searchTagsController.text.length));
            }
          },
          decoration: InputDecoration(
            fillColor: Get.context!.theme.canvasColor,
            filled: true,
            hintText: "Enter Tags",
            prefixIcon: widget.searchTagsController.text.length > 0
              ? IconButton(
                  padding: const EdgeInsets.all(5),
                  onPressed: () => setState(() {widget.searchTagsController.clear();}),
                  icon: Icon(Icons.clear),
                )
              : null,
            contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0), // left,top,right,bottom
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(30),
              gapPadding: 0,
            ),
          ),
        )
    );
  }
}
