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
  TagSearchBox(this.searchGlobals, this.searchTagsController, this._focusNode, this.settingsHandler);
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

  OverlayEntry _createOverlayEntry() {
    RenderObject renderBox = context.findRenderObject()!;
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
      if (input.split(" ").length > 1) {
        input = input.split(" ")[input.split(" ").length - 1];
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
                future: widget.searchGlobals.booruHandler!.tagSearch(input),
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
                                  widget._focusNode.unfocus();
                                  widget.searchTagsController.text = widget
                                          .searchTagsController.text
                                          .substring(
                                              0,
                                              widget.searchTagsController.text
                                                      .lastIndexOf(" ") +
                                                  1) +
                                      snapshot.data[index];
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
        setState(() {
          if (this._overlayEntry != null) {
            this._overlayEntry!.remove();
          }
          this._updateOverLay();
        });
      },
      onEditingComplete: (){
        widget._focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Enter Tags",
        contentPadding:
            new EdgeInsets.fromLTRB(15, 0, 15, 0), // left,top,right,bottom
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(50),
          gapPadding: 0,
        ),
      ),
    ));
  }
}
