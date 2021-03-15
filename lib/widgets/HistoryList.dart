import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/ScrollingText.dart';

class HistoryList extends StatefulWidget {
  List<SearchGlobals> searchGlobals;
  int globalsIndex;
  TextEditingController searchTagsController;
  SettingsHandler settingsHandler;
  final Function setParentGlobalsIndex;
  HistoryList(this.searchGlobals, this.globalsIndex, this.searchTagsController, this.settingsHandler, this.setParentGlobalsIndex);
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<List<String>> history = [];

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  void getHistory() async {
    history = (widget.settingsHandler.dbEnabled && widget.settingsHandler.searchHistoryEnabled)
      ? await widget.settingsHandler.dbHandler.getSearchHistory()
      : [];
    history.sort(compareFavourites);
    setState(() {});
  }

  int compareFavourites(a, b) {
    if(a[4] == '1' && b[4] != '1') {
      return -1;
    } else if(a[4] != '1' && b[4] == '1') {
      return 1;
    } else {
      return 0;
    }
  }
  

  void showHistoryEntryActions(Widget row, List<String> data) {
    showDialog(context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          null,
          [
            AbsorbPointer(absorbing: true, child: row),
            // TODO: convert time to local device's format and correct timezone
            Text("Last searched on: ${data[5]}"),
            const SizedBox(height: 20),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () async {
                await widget.settingsHandler.dbHandler.deleteFromSearchHistory(data[0]);
                setState(() {
                  history = history.where((el) => el[0] != data[0]).toList();
                });
                Navigator.of(context).pop(true);
              },
              icon: Icon(Icons.delete_forever, color: Get.context!.theme.errorColor),
              label: Expanded(child: Text('Delete', style: TextStyle(color: Get.context!.theme.errorColor))),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () {
                int indexWhere = history.indexWhere((el) => el[0] == data[0]);
                bool newFavourite = data[4] == '1' ? false : true;
                print(data);
                data[4] = data[4] == '1' ? '0' : '1';
                setState(() {
                  history[indexWhere] = data;
                  history.sort(compareFavourites);
                });
                widget.settingsHandler.dbHandler.setFavouriteSearchHistory(data[0], newFavourite);
                
                Navigator.of(context).pop(true);
              },
              icon: Icon(data[4] == '1' ? Icons.favorite_border : Icons.favorite, color: data[4] == '1' ? Colors.grey : Colors.red),
              label: Expanded(child: Text(data[4] == '1' ? 'Remove from Favourites' : 'Set as Favourite', style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () async {
                Clipboard.setData(new ClipboardData(text: data[1]));
                ServiceHandler.displayToast('Text copied to clipboard!');
                Navigator.of(context).pop(true);
              },
              icon: Icon(Icons.copy),
              label: Expanded(child: Text('Copy', style: TextStyle(color: Colors.white))),
            ),
            
          ],
          CrossAxisAlignment.center
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      history.length > 0 ? const SizedBox() : Text('Search History is empty.'),
      const SizedBox(height: 10),
      ClipRRect(
        borderRadius: new BorderRadius.circular(10),
        child: Container(
          height: (MediaQuery.of(context).size.height / 2) + 20,
          child: Material(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              shrinkWrap: true,
              itemCount: history.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                List<String> currentEntry = history[index]; //0-id, 1-text, 2-booru type, 3-booru name, 4-isFavourite, 5-timestamp
                Booru? booru;
                if (widget.settingsHandler.booruList.isNotEmpty) {
                  booru = widget.settingsHandler.booruList.firstWhere((b) => b.type == currentEntry[2] && b.name == currentEntry[3]);
                }

                Widget entryRow = TextButton.icon(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: () {
                    widget.searchTagsController.text = currentEntry[1];
                    if (booru != null) {
                      setState(() {
                        widget.searchGlobals[widget.globalsIndex].tags = currentEntry[1];
                        widget.searchGlobals[widget.globalsIndex].selectedBooru = booru;
                      });
                    }
                    Navigator.of(context).pop(true);
                    widget.setParentGlobalsIndex(widget.globalsIndex, currentEntry[1]);
                  },
                  icon: booru != null
                      ? (booru.type == "Favourites"
                          ? Icon(Icons.favorite,
                              color: Colors.red, size: 18)
                          : Image.network(booru.faviconURL!,
                              width: 16, errorBuilder: (_, __, ___) {
                              return Icon(Icons.broken_image,
                                  size: 18);
                            }))
                      : Icon(CupertinoIcons.question, size: 18),
                  label: Expanded(child: ScrollingText(currentEntry[1], 25, "infiniteWithPause", Colors.white)),
                );


                return Row(children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () {showHistoryEntryActions(entryRow, currentEntry);},
                      child: entryRow
                    )
                  ),
                  if(currentEntry[4] == '1') 
                    Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0), child: Icon(Icons.favorite, color: Colors.red)),
                ]);
              }
            )
          )
        )
      )
    ]);
  }
}
