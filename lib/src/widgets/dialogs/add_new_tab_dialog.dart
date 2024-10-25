import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class AddNewTabDialog extends StatefulWidget {
  const AddNewTabDialog({
    super.key,
  });

  @override
  State<AddNewTabDialog> createState() => _AddNewTabDialogState();
}

enum _Querymode {
  defaultTags,
  currentInput,
  custom;

  String get locName {
    switch (this) {
      case defaultTags:
        return 'Default';
      case currentInput:
        return 'Current';
      case custom:
        return 'Custom';
    }
  }
}

class _AddNewTabDialogState extends State<AddNewTabDialog> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  Booru? booru;
  bool switchToNew = true;
  TabAddMode addMode = TabAddMode.end; // prev, next, end
  _Querymode queryMode = _Querymode.defaultTags;
  TextEditingController customTagsController = TextEditingController();

  String get usedQuery {
    final usedBooru = booru ?? searchHandler.currentBooru;
    switch (queryMode) {
      case _Querymode.defaultTags:
        return usedBooru.defTags?.isNotEmpty == true ? usedBooru.defTags! : settingsHandler.defTags;

      case _Querymode.currentInput:
        return searchHandler.searchTextController.text;

      case _Querymode.custom:
        return customTagsController.text;
    }
  }

  void addNewTab() {
    searchHandler.searchTextController.text = usedQuery;
    searchHandler.addTabByString(
      usedQuery,
      customBooru: booru,
      switchToNew: switchToNew,
      addMode: addMode,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: const Text(
        'Add new tab',
        style: TextStyle(fontSize: 20),
      ),
      contentItems: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            SettingsBooruDropdown(
              value: booru,
              title: 'Booru',
              placeholder: 'Select a booru or leave empty',
              nullable: true,
              onChanged: (value) {
                setState(() {
                  booru = value;
                });
              },
            ),
            SettingsSegmentedButton(
              value: addMode,
              values: TabAddMode.values,
              itemTitleBuilder: (v) => v.locName,
              onChanged: (v) {
                setState(() {
                  addMode = v;
                });
              },
              title: 'Add position:',
            ),
            SettingsSegmentedButton(
              value: queryMode,
              values: _Querymode.values,
              itemTitleBuilder: (v) => v.locName,
              onChanged: (v) {
                setState(() {
                  queryMode = v;
                });
              },
              title: 'Used query:',
              subtitle: queryMode == _Querymode.custom
                  ? SettingsTextInput(
                      controller: customTagsController,
                      title: 'Custom query',
                      onlyInput: true,
                      inputType: TextInputType.text,
                      clearable: true,
                      pasteable: true,
                    )
                  : Text(
                      usedQuery.isEmpty ? '[empty]' : usedQuery,
                    ),
            ),
            SettingsToggle(
              value: switchToNew,
              onChanged: (v) {
                setState(() {
                  switchToNew = v;
                });
              },
              title: 'Switch to new tab',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 16,
                runSpacing: 10,
                children: [
                  const CancelButton(
                    withIcon: true,
                  ),
                  ElevatedButton.icon(
                    onPressed: addNewTab,
                    label: const Text('Add'),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
