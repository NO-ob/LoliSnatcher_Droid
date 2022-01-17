import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class PageNumberDialog extends StatelessWidget {
  PageNumberDialog({Key? key}) : super(key: key);

  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  final TextEditingController pageNumberController = TextEditingController();
  final TextEditingController delayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pageNumberController.text = searchHandler.currentBooruHandler.pageNum.toString();
    delayController.text = 200.toString();

    final int total = searchHandler.currentBooruHandler.totalCount.value;
    final int possibleMaxPageNum = total != 0 ? (total / settingsHandler.limit).round() : 0;

    return SettingsDialog(
      contentItems: <Widget>[
        SettingsTextInput(
          title: "Page #",
          hintText: "Page #",
          onlyInput: true,
          controller: pageNumberController,
          autofocus: true,
          inputType: TextInputType.numberWithOptions(signed: false, decimal: false),
          numberButtons: true,
          numberStep: 1,
          numberMin: -1,
          numberMax: double.infinity,
        ),
        SettingsTextInput(
          title: "Delay between loadings",
          hintText: "Delay in ms",
          onlyInput: true,
          controller: delayController,
          autofocus: false,
          inputType: TextInputType.numberWithOptions(signed: false, decimal: false),
          numberButtons: true,
          numberStep: 100,
          numberMin: 0,
          numberMax: 10000,
        ),
        SettingsButton(
          name: 'Current page #${searchHandler.pageNum.value}',
          action: () {
            pageNumberController.text = searchHandler.pageNum.value.toString();
          },
          drawTopBorder: true,
        ),
        if (possibleMaxPageNum != 0)
          SettingsButton(
            name: 'Possible max page #~$possibleMaxPageNum',
            action: () {
              pageNumberController.text = possibleMaxPageNum.toString();
            },
          ),
      ],
      actionButtons: <Widget>[
        ElevatedButton(
          child: Text('Jump to page'),
          onPressed: () {
            if (pageNumberController.text.isNotEmpty) {
              searchHandler.changeCurrentTabPageNumber((int.tryParse(pageNumberController.text) ?? 0) - 1);
              Navigator.of(context).pop();
            }
          },
        ),
        ElevatedButton(
          child: Text('Search until page'),
          onPressed: () {
            if (pageNumberController.text.isNotEmpty) {
              searchHandler.searchCurrentTabUntilPageNumber(
                (int.tryParse(pageNumberController.text) ?? 0) - 1,
                customDelay: (int.tryParse(delayController.text) ?? 200),
              );
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
