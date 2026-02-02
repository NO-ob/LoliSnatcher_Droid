import 'package:flutter/material.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/save_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersEditDialog extends StatefulWidget {
  const TagsFiltersEditDialog({
    required this.tag,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final String tag;
  final Function(String) onEdit;
  final Function(String) onDelete;

  @override
  State<TagsFiltersEditDialog> createState() => _TagsFiltersEditDialogState();
}

class _TagsFiltersEditDialogState extends State<TagsFiltersEditDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.tag;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit(String text) {
    if (text.trim() != '') {
      widget.onEdit(text.trim().toLowerCase());
      Navigator.of(context).pop(true);
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.tagsFiltersDialogs.emptyInput,
          style: const TextStyle(fontSize: 20),
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
    }
  }

  void onDelete() {
    widget.onDelete(widget.tag);
    Navigator.of(context).pop(true);
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
              tag: widget.tag,
            ),
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: SettingsTextInput(
            title: context.loc.tagsFiltersDialogs.editFilter,
            titleAsLabel: true,
            onlyInput: true,
            controller: _controller,
            autofocus: false,
            inputType: TextInputType.text,
            clearable: false,
            resetText: () => widget.tag,
            onSubmitted: onSubmit,
            enableIMEPersonalizedLearning: !SettingsHandler.instance.incognitoKeyboard,
          ),
        ),
      ],
      actionButtons: [
        const CancelButton(
          withIcon: true,
        ),
        DeleteButton(
          withIcon: true,
          action: onDelete,
        ),
        SaveButton(
          withIcon: true,
          action: () => onSubmit(_controller.text),
        ),
      ],
    );
  }
}
