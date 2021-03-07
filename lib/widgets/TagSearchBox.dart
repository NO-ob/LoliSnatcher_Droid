import 'dart:ui';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';


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

  void setBooruHandler() {
    List temp = new BooruHandlerFactory()
        .getBooruHandler(widget.searchGlobals.selectedBooru!, widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    widget.searchGlobals.booruHandler = temp[0];
    widget.searchGlobals.pageNum = temp[1];
  }
  @override
  void initState() {
    super.initState();
    widget._focusNode.addListener(_updateOverLay);
  }

  void updateOverlay() {
    setState(() {
      if (this._overlayEntry != null) {
        this._overlayEntry!.remove();
      }
      this._updateOverLay();
    });
  }

  void _updateOverLay() {
    if (widget._focusNode.hasFocus) {
      print("textbox is focused");
      this._overlayEntry = this._createOverlayEntry();
      if (this._overlayEntry != null) {
        Overlay.of(context)!.insert(this._overlayEntry!);
      }
    } else {
      if (this._overlayEntry != null) {
        this._overlayEntry!.remove();
      }
    }
  }

  @override
  void dispose() {
    widget._focusNode.unfocus();
    super.dispose();
  }

  OverlayEntry? _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    setBooruHandler();
    widget.searchGlobals.booruHandler!.limit = 20;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    if (widget.searchGlobals.booruHandler!.booru.type == "Szurubooru" &&
        widget.searchGlobals.booruHandler!.booru.apiKey != "" &&
        widget.searchGlobals.booruHandler!.booru.userID != "") {
      widget.searchGlobals.booruHandler!.tagSearchEnabled = true;
    } else if (widget.searchGlobals.booruHandler!.booru.type == "Shimmie" &&
        widget.searchGlobals.booruHandler!.booru.baseURL!
            .contains("rule34.paheal.net")) {
      widget.searchGlobals.booruHandler!.tagSearchEnabled = true;
    }
    if (widget.searchGlobals.booruHandler!.tagSearchEnabled) {
      String input = widget.searchTagsController.text;
      List<String> splitInput = input.split(" ");
      String lastTag = input;
      if (splitInput.length > 1) {
        // Get last tag in the input and remove minus (exclude symbol)
        // TODO /bug?: use the tag behind the current cursor position, not the last tag
        lastTag = splitInput[splitInput.length - 1].replaceAll(new RegExp(r'^-'), '');
      }
      return OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          height: 300,
          child: Material(
            elevation: 4.0,
            child: FutureBuilder(
                future: widget.searchGlobals.booruHandler!.tagSearch(lastTag),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if ((snapshot.connectionState == ConnectionState.done) &&
                      snapshot.data.length > 0) {
                    if (snapshot.data[0] != null) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text(snapshot.data[index]),
                                onTap: (() {
                                  // widget._focusNode.unfocus();
                                  // Keep minus if its in the beggining of current (last) tag
                                  bool isExclude = new RegExp(r'^-').hasMatch(splitInput[splitInput.length - 1]);
                                  String newInput = input.substring(0, input.lastIndexOf(" ") + 1) + (isExclude ? '-' : '') + snapshot.data[index] + " ";
                                  widget.searchTagsController.text = newInput;

                                  // Set the cursor to the end of the search and reset the overlay data
                                  widget.searchTagsController.selection = TextSelection.fromPosition(TextPosition(offset: newInput.length));
                                  updateOverlay();
                                }));
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
          controller: widget.searchTagsController,
          focusNode: widget._focusNode,
          onChanged: (text) {
            updateOverlay();
          },
          onSubmitted: (String text) {
            widget.searchAction(text);
            widget._focusNode.unfocus();
          },
          onEditingComplete: (){
            widget._focusNode.unfocus();
          },
          decoration: InputDecoration(
            hintText: "Enter Tags",
            suffixIcon: widget.searchTagsController.text.length > 0
                ? IconButton(
              padding: const EdgeInsets.all(5),
              onPressed: () => widget.searchTagsController.clear(),
              icon: Icon(Icons.clear),
            )
                : Container(width: 0.0),
            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0), // left,top,right,bottom
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50),
              gapPadding: 0,
            ),
          ),
        )
    );
  }
}
