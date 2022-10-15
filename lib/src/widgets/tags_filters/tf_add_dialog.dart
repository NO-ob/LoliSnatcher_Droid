import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersAddDialog extends StatefulWidget {
  const TagsFiltersAddDialog({
    Key? key,
    required this.onAdd,
    required this.tagFilterType,
  }) : super(key: key);

  final Function(String) onAdd;
  final String tagFilterType;

  @override
  State<TagsFiltersAddDialog> createState() => _TagsFiltersAddDialogState();
}

class _TagsFiltersAddDialogState extends State<TagsFiltersAddDialog> {
  final TextEditingController _controller = TextEditingController();

  void onSubmit(String text) {
    if (text.trim() != '') {
      widget.onAdd(text.trim().toLowerCase());
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

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      contentItems: <Widget>[
        SizedBox(
          width: double.maxFinite,
          child: AbsorbPointer(
            absorbing: true,
            child: TagsFiltersListItem(
              tag: '[Add New ${widget.tagFilterType} Filter]',
              overrideIcon: const Icon(Icons.add),
            ),
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: SettingsTextInput(
            title: "New ${widget.tagFilterType} Tag Filter",
            hintText: "New Filter",
            onlyInput: true,
            controller: _controller,
            autofocus: true,
            inputType: TextInputType.text,
            clearable: true,
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
            title: const Text('Add Filter'),
          ),
        ),
      ],
      actionButtons: const [
        CancelButton(),
      ],
    );
  }
}
