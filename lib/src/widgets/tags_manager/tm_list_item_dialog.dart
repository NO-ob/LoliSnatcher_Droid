import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';

class TagsManagerListItemDialog extends StatefulWidget {
  const TagsManagerListItemDialog({
    Key? key,
    required this.tag,
    required this.onDelete,
    required this.onChangedType,
  }) : super(key: key);

  final Tag tag;
  final void Function() onDelete;
  final void Function(TagType?) onChangedType;

  @override
  State<TagsManagerListItemDialog> createState() => _TagsManagerListItemDialogState();
}

class _TagsManagerListItemDialogState extends State<TagsManagerListItemDialog> {
  void _onChangedType(TagType? value) {
    widget.onChangedType(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      contentItems: <Widget>[
        SizedBox(width: double.maxFinite, child: TagsManagerListItem(tag: widget.tag)),
        //
        const SizedBox(height: 10),
        SettingsDropdown(
          value: widget.tag.tagType,
          items: TagType.values,
          onChanged: _onChangedType,
          title: 'Type',
          drawBottomBorder: false,
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            SearchHandler.instance.addTabByString(widget.tag.fullString);

            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: const Text("Added a tab!", style: TextStyle(fontSize: 20)),
              content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.add_circle_outline),
          trailing: Favicon(SearchHandler.instance.currentBooruHandler.booru.faviconURL ?? ""),
          title: const Text('Add a tab'),
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.tag.fullString));
            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: const Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
              content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.copy),
          title: const Text('Copy'),
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: widget.onDelete,
          leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
          title: const Text('Delete'),
        ),
      ],
    );
  }
}
