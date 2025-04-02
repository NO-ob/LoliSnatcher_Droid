import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersAddDialog extends StatefulWidget {
  const TagsFiltersAddDialog({
    required this.onAdd,
    required this.tagFilterType,
    super.key,
  });

  final Function(String) onAdd;
  final String tagFilterType;

  @override
  State<TagsFiltersAddDialog> createState() => _TagsFiltersAddDialogState();
}

class _TagsFiltersAddDialogState extends State<TagsFiltersAddDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit(String text) {
    if (text.trim() != '') {
      widget.onAdd(text.trim().toLowerCase());
      Navigator.of(context).pop(true);
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Empty input!', style: TextStyle(fontSize: 20)),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      contentItems: [
        SizedBox(
          width: double.maxFinite,
          child: AbsorbPointer(
            absorbing: true,
            child: TagsFiltersListItem(
              tag: '[Add new ${widget.tagFilterType} filter]',
              overrideIcon: const Icon(Icons.add),
            ),
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: SettingsTextInput(
            title: 'New ${widget.tagFilterType} tag filter',
            hintText: 'New filter',
            onlyInput: true,
            controller: _controller,
            autofocus: true,
            inputType: TextInputType.text,
            clearable: true,
            pasteable: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            onSubmitted: onSubmit,
            enableIMEPersonalizedLearning: !SettingsHandler.instance.incognitoKeyboard,
          ),
        ),
      ],
      actionButtons: [
        const CancelButton(
          withIcon: true,
        ),
        ConfirmButton(
          text: 'Add',
          withIcon: true,
          customIcon: Icons.save,
          action: () => onSubmit(_controller.text),
        ),
      ],
    );
  }
}
