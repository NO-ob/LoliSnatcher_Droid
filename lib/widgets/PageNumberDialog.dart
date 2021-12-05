import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class PageNumberDialog extends StatefulWidget {
  PageNumberDialog({Key? key}) : super(key: key);

  @override
  _PageNumberDialogState createState() => _PageNumberDialogState();
}

class _PageNumberDialogState extends State<PageNumberDialog> {
  SearchHandler searchHandler = Get.find<SearchHandler>();
  SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  TextEditingController pageNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pageNumberController.text = searchHandler.currentTab.booruHandler.pageNum.toString();

    int total = searchHandler.currentTab.booruHandler.totalCount.value;
    int possibleMaxPageNum = total != 0 ? (total / settingsHandler.limit).round() : 0;
    return SettingsDialog(
      contentItems: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                if(pageNumberController.text.isNotEmpty) {
                  int newPageNum = int.parse(pageNumberController.text) - 1;
                  if(newPageNum > -2) pageNumberController.text = newPageNum.toString();
                }
              },
              child: Icon(Icons.exposure_minus_1),
            ),
            const SizedBox(width: 5),
            Expanded(child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SettingsTextInput(
                title: "Page #",
                hintText: "Page #",
                onlyInput: true,
                controller: pageNumberController,
                autofocus: false,
                inputType: TextInputType.numberWithOptions(signed: false, decimal: false),
                onSubmitted: (String text) {

                },
              )
            )),
            const SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {
                if(pageNumberController.text.isNotEmpty) {
                  int newPageNum = int.parse(pageNumberController.text) + 1;
                  pageNumberController.text = newPageNum.toString();
                }
              },
              child: Icon(Icons.exposure_plus_1),
            ),
          ],
        ),
        SettingsButton(name: 'Current page #${searchHandler.currentTab.booruHandler.pageNum.value}', drawTopBorder: true),
        if(possibleMaxPageNum != 0)
          SettingsButton(
            name: 'Possible max page #~$possibleMaxPageNum',
            action: () {
              pageNumberController.text = possibleMaxPageNum.toString();
            },
          ),
      ],
      actionButtons: <Widget>[
        ElevatedButton(
          child: Text('Start from page'),
          onPressed: () {
            if(pageNumberController.text.isNotEmpty) {
              searchHandler.changeCurrentTabPageNumber(int.parse(pageNumberController.text) - 1);
              setState(() { });
              Navigator.of(context).pop();
            }
          },
        ),
        ElevatedButton(
          child: Text('Search to page'),
          onPressed: () {
            if(pageNumberController.text.isNotEmpty) {
              searchHandler.searchCurrentTabUntilPageNumber(int.parse(pageNumberController.text) - 1);
              setState(() { });
              Navigator.of(context).pop();
            }
          },
        ),
      ],
      contentPadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
    );
  }
}