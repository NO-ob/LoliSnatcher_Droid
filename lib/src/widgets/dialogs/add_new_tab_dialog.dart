import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';

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
  bool addSecondaryBoorus = false, useCustomPage = false, switchToNew = true;
  List<Booru> secondaryBoorus = [];
  TabAddMode addMode = TabAddMode.end; // prev, next, end
  _Querymode queryMode = _Querymode.defaultTags;
  final TextEditingController customTagsController = TextEditingController(), customPageController = TextEditingController();
  GlobalKey secondaryBoorusDropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    secondaryBoorus = searchHandler.currentSecondaryBoorus.value ?? [];
    customPageController.text = searchHandler.currentTab.booruHandler.pageNum.toString();
  }

  @override
  void dispose() {
    customTagsController.dispose();
    customPageController.dispose();
    super.dispose();
  }

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
      secondaryBoorus: (addSecondaryBoorus && secondaryBoorus.isNotEmpty) ? [...secondaryBoorus] : null,
      switchToNew: switchToNew,
      addMode: addMode,
      customPage: (int.tryParse(customPageController.text) ?? 0) - 1,
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
                      enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                    )
                  : Text(
                      usedQuery.isEmpty ? '[empty]' : usedQuery,
                    ),
            ),
            Material(
              color: Colors.transparent,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: addSecondaryBoorus
                    ? ListTile(
                        shape: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: borderWidth,
                          ),
                        ),
                        title: LoliMultiselectDropdown(
                          key: secondaryBoorusDropdownKey,
                          value: secondaryBoorus,
                          onChanged: (List<Booru> value) {
                            setState(() {
                              secondaryBoorus = value;
                            });
                          },
                          items: settingsHandler.booruList,
                          itemBuilder: (item) => Container(
                            padding: const EdgeInsets.only(left: 16),
                            height: kMinInteractiveDimension,
                            child: TabBooruSelectorItem(booru: item),
                          ),
                          labelText: 'Secondary boorus to include',
                          selectedItemBuilder: (List<Booru> value) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  for (final item in value)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: TabBooruSelectorItem(
                                        booru: item,
                                        compact: true,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : SettingsToggle(
                        value: addSecondaryBoorus,
                        onChanged: (v) {
                          setState(() {
                            addSecondaryBoorus = v;
                            if (secondaryBoorus.isEmpty) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => (secondaryBoorusDropdownKey.currentWidget as LoliMultiselectDropdown<Booru>?)?.showDialog(context),
                              );
                            }
                          });
                        },
                        title: secondaryBoorus.isEmpty ? 'Add secondary boorus' : 'Keep secondary boorus',
                        subtitle: const Text('aka Multibooru mode'),
                      ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: useCustomPage
                    ? ListTile(
                        shape: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: borderWidth,
                          ),
                        ),
                        title: SettingsTextInput(
                          title: 'Page #',
                          hintText: 'Page #',
                          onlyInput: true,
                          controller: customPageController,
                          autofocus: true,
                          inputType: TextInputType.number,
                          numberButtons: true,
                          numberStep: 1,
                          numberMin: -1,
                          numberMax: double.infinity,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a number';
                            } else if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                      )
                    : SettingsToggle(
                        value: useCustomPage,
                        onChanged: (v) {
                          setState(() {
                            useCustomPage = v;
                          });
                        },
                        title: 'Start from custom page number',
                      ),
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
