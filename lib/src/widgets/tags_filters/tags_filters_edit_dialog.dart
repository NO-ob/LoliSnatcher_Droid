import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tags_filters_list_item.dart';

class TagsFiltersEditDialog extends StatefulWidget {
  const TagsFiltersEditDialog({
    Key? key,
    required this.tag,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

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

  void onSubmit(String text) {
    if (text.trim() != '') {
      widget.onEdit(text.trim().toLowerCase());
      Navigator.of(context).pop(true);
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: const Text("Empty input!", style: TextStyle(fontSize: 20)),
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
      contentItems: <Widget>[
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
            title: "Edit Filter",
            hintText: "Edit Filter",
            onlyInput: true,
            controller: _controller,
            autofocus: false,
            inputType: TextInputType.text,
            clearable: false,
            resetText: () => widget.tag,
            onSubmitted: onSubmit,
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () => onSubmit(_controller.text),
            leading: const Icon(Icons.save),
            title: const Text('Save Filter'),
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: onDelete,
            leading: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
            title: const Text('Delete'),
          ),
        ),
      ],
      actionButtons: const [
        CancelButton(),
      ],
    );
  }
}
