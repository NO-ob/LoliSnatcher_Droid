import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TagsManagerAddDialog extends StatefulWidget {
  const TagsManagerAddDialog({super.key});

  @override
  State<TagsManagerAddDialog> createState() => _TagsManagerAddDialogState();
}

class _TagsManagerAddDialogState extends State<TagsManagerAddDialog> {
  final TextEditingController _controller = TextEditingController();
  TagType _type = TagType.none;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: const Text('Add Tag'),
      contentItems: [
        SettingsTextInput(
          controller: _controller,
          title: 'Name',
          drawBottomBorder: false,
          pasteable: true,
          enableIMEPersonalizedLearning: !SettingsHandler.instance.incognitoKeyboard,
        ),
        SettingsDropdown(
          value: _type,
          items: TagType.values,
          onChanged: (TagType? newValue) {
            setState(() {
              _type = newValue!;
            });
          },
          title: 'Type',
          drawBottomBorder: false,
        ),
      ],
      actionButtons: [
        const CancelButton(
          text: 'Close',
          withIcon: true,
          returnData: null,
        ),
        ElevatedButton.icon(
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          onPressed: () {
            final String tagName = _controller.text.trim();
            if (tagName.isNotEmpty) {
              Navigator.of(context).pop(
                Tag(
                  tagName,
                  tagType: _type,
                ),
              );
            } else {
              Navigator.of(context).pop(null);
            }
          },
        ),
      ],
    );
  }
}
