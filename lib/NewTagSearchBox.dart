import 'dart:ui';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:flutter/painting.dart';
class NewTagSearchBox extends StatefulWidget {
  SearchGlobals searchGlobals;
  TextEditingController searchTagsController;
  SettingsHandler settingsHandler;
  Function searchAction;
  FocusNode _focusNode;
  BooruHandler? booruHandler;
  int pageNum = 0;
  bool displayTags = false;
  NewTagSearchBox(this.searchGlobals, this.searchTagsController, this._focusNode,this.settingsHandler, this.searchAction);
  @override
  _NewTagSearchBoxState createState() => _NewTagSearchBoxState();
}

class _NewTagSearchBoxState extends State<NewTagSearchBox> {
  void setBooruHandler() {
    List temp = new BooruHandlerFactory()
        .getBooruHandler(widget.searchGlobals.selectedBooru!, widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    widget.searchGlobals.booruHandler = temp[0];
    widget.searchGlobals.pageNum = temp[1];
    if (widget.searchGlobals.booruHandler!.booru.type == "Szurubooru" &&
        widget.searchGlobals.booruHandler!.booru.apiKey != "" &&
        widget.searchGlobals.booruHandler!.booru.userID != "") {
      widget.searchGlobals.booruHandler!.tagSearchEnabled = false;
    } else if (widget.searchGlobals.booruHandler!.booru.type == "Shimmie" &&
        widget.searchGlobals.booruHandler!.booru.baseURL!
            .contains("rule34.paheal.net")) {
      widget.searchGlobals.booruHandler!.tagSearchEnabled = false;
    }
  }
  @override
  void initState() {
    super.initState();
    widget._focusNode.addListener((){
      if(widget._focusNode.hasFocus){
        if (widget.booruHandler == null){
          setBooruHandler();
        }
        setState(() {
          widget.displayTags = true;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> splitInput = widget.searchTagsController.text.split(" ");
    String lastTag = widget.searchTagsController.text;
    if (splitInput.length > 1) {
      // Get last tag in the input and remove minus (exclude symbol)
      // TODO /bug?: use the tag behind the current cursor position, not the last tag
      lastTag = splitInput[splitInput.length - 1].replaceAll(new RegExp(r'^-'), '');
    }
    print("new tag box lasttag: $lastTag enable: ${widget.displayTags}");
    return Expanded(
      child: Column(children: [
        TextField(
          controller: widget.searchTagsController,
          focusNode: widget._focusNode,
          onChanged: (text) {
            setState(() {
              widget.displayTags = true;
            });
          },
          onSubmitted: (String text) {
            widget.searchAction(text);
          },
          onEditingComplete: () {
            setState(() {
              widget.displayTags = false;
            });
          },
          onTap: (){
            setState(() {
              widget.displayTags = !widget.displayTags;
            });
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
            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            // left,top,right,bottom
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50),
              gapPadding: 0,
            ),
          ),
        ),
        widget.displayTags ? Container(
          alignment: Alignment.topLeft,
          width: 200,
          height: 300,
          child: Material(
            elevation: 4.0,child: FutureBuilder(
            future: widget.searchGlobals.booruHandler!.tagSearch(lastTag),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if ((snapshot.connectionState == ConnectionState.done) &&
                  snapshot.data.length > 0) {
                if (snapshot.data.isNotEmpty) {
                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.data[index].isNotEmpty){
                          return ListTile(
                              title: Text(snapshot.data[index]),
                              onTap: (() {
                                // widget._focusNode.unfocus();
                                // Keep minus if its in the beggining of current (last) tag
                                bool isExclude = new RegExp(r'^-').hasMatch(splitInput[splitInput.length - 1]);
                                String newInput = widget.searchTagsController.text.substring(0, widget.searchTagsController.text.lastIndexOf(" ") + 1) + (isExclude ? '-' : '') + snapshot.data[index] + " ";
                                setState(() {
                                  widget.searchTagsController.text = newInput;
                                  // Set the cursor to the end of the search and reset the overlay data
                                  widget.searchTagsController.selection = TextSelection.fromPosition(TextPosition(offset: newInput.length));
                                });
                              }));
                        } else {
                          return Container(width: 0, height: 0,);
                        }
                      });
                } else {
                  return Container(width: 0,height: 0,);
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),),
          ) : Container(width: 0,height: 0,),
      ],
      ),
    );
  }
}
