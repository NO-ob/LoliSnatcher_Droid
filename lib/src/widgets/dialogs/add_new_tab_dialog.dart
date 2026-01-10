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
  custom
  ;

  String locName(BuildContext context) {
    switch (this) {
      case defaultTags:
        return context.loc.tabs.queryModeDefault;
      case currentInput:
        return context.loc.tabs.queryModeCurrent;
      case custom:
        return context.loc.tabs.queryModeCustom;
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
  final TextEditingController customTagsController = TextEditingController(),
      customPageController = TextEditingController();
  GlobalKey secondaryBoorusDropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    secondaryBoorus = searchHandler.currentSecondaryBoorus.value ?? <Booru>[];
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
      title: Text(
        context.loc.tabs.addNewTab,
        style: const TextStyle(fontSize: 20),
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
              title: context.loc.booru,
              placeholder: context.loc.tabs.selectABooruOrLeaveEmpty,
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
              itemTitleBuilder: (v) => v.locName(context),
              onChanged: (v) {
                setState(() {
                  addMode = v;
                });
              },
              title: context.loc.tabs.addPosition,
            ),
            SettingsSegmentedButton(
              value: queryMode,
              values: _Querymode.values,
              itemTitleBuilder: (v) => v.locName(context),
              onChanged: (v) {
                setState(() {
                  queryMode = v;
                });
              },
              title: context.loc.tabs.usedQuery,
              subtitle: queryMode == _Querymode.custom
                  ? SettingsTextInput(
                      controller: customTagsController,
                      title: context.loc.tabs.customQuery,
                      onlyInput: true,
                      inputType: TextInputType.text,
                      clearable: true,
                      pasteable: true,
                      enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                    )
                  : Text(
                      usedQuery.isEmpty ? context.loc.tabs.empty : usedQuery,
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
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 6),
                          child: LoliMultiselectDropdown(
                            key: secondaryBoorusDropdownKey,
                            value: secondaryBoorus,
                            onChanged: (List<Booru> value) {
                              setState(() {
                                secondaryBoorus = value;
                              });
                            },
                            expandableByScroll: true,
                            items: settingsHandler.booruList,
                            itemBuilder: (item) => Container(
                              padding: const EdgeInsets.only(left: 16),
                              height: kMinInteractiveDimension,
                              child: TabBooruSelectorItem(booru: item),
                            ),
                            labelText: context.loc.multibooru.labelSecondaryBoorusToInclude,
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
                        ),
                      )
                    : SettingsToggle(
                        value: addSecondaryBoorus,
                        onChanged: (v) {
                          setState(() {
                            addSecondaryBoorus = v;
                            if (secondaryBoorus.isEmpty) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => (secondaryBoorusDropdownKey.currentWidget as LoliMultiselectDropdown<Booru>?)
                                    ?.showDialog(context),
                              );
                            }
                          });
                        },
                        title: secondaryBoorus.isEmpty
                            ? context.loc.tabs.addSecondaryBoorus
                            : context.loc.tabs.keepSecondaryBoorus,
                        subtitle: Text(context.loc.multibooru.akaMultibooruMode),
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
                          title: context.loc.pageNumber,
                          hintText: context.loc.pageNumber,
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
                              return context.loc.validationErrors.invalidNumber;
                            } else if (int.tryParse(value) == null) {
                              return context.loc.validationErrors.invalidNumericValue;
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
                        title: context.loc.tabs.startFromCustomPageNumber,
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
              title: context.loc.tabs.switchToNewTab,
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
                    label: Text(context.loc.tabs.add),
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
