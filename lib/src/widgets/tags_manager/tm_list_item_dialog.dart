import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';

class TagsManagerListItemDialog extends StatefulWidget {
  const TagsManagerListItemDialog({
    required this.tag,
    required this.onChangedType,
    this.onSetStale,
    this.onResetStale,
    this.onSetUnstaleable,
    this.onDelete,
    this.debug = false,
    super.key,
  });

  final Tag tag;
  final void Function(TagType?) onChangedType;
  final void Function()? onSetStale;
  final void Function()? onResetStale;
  final void Function()? onSetUnstaleable;
  final void Function()? onDelete;
  final bool debug;

  @override
  State<TagsManagerListItemDialog> createState() => _TagsManagerListItemDialogState();
}

class _TagsManagerListItemDialogState extends State<TagsManagerListItemDialog> {
  void callbackWithSetState(Function callback) {
    callback();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String staleText = DateTime.fromMillisecondsSinceEpoch(
      widget.tag.updatedAt,
    ).add(const Duration(milliseconds: Constants.tagStaleTime)).toString();

    return SettingsDialog(
      contentItems: [
        SizedBox(
          width: double.maxFinite,
          child: TagsManagerListItem(
            tag: widget.tag,
            debug: widget.debug,
          ),
        ),
        //
        if (widget.debug) ...[
          const SizedBox(height: 10),
          Text(context.loc.tagsManager.staleAfter(staleText: staleText)),
        ],
        //
        const SizedBox(height: 10),
        SettingsDropdown(
          value: widget.tag.tagType,
          items: TagType.values,
          onChanged: (TagType? newValue) {
            callbackWithSetState(() {
              widget.onChangedType(newValue);
            });
          },
          title: context.loc.tagsManager.type,
          drawBottomBorder: false,
          itemBuilder: (item) => Row(
            children: [
              if (item != null && item.isNone == false)
                Container(
                  height: 24,
                  width: 6,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: item.getColour(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              Text(item == null ? 'Any' : item.locName),
            ],
          ),
          itemTitleBuilder: (item) => item == null ? 'Any' : item.locName,
        ),
        //
        if (widget.debug) ...[
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
                title: Text(context.loc.tagsManager.addedATab, style: const TextStyle(fontSize: 20)),
                content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
                leadingIcon: Icons.copy,
                sideColor: Colors.green,
              );
              Navigator.of(context).pop(true);
            },
            leading: const Icon(Icons.add_circle_outline),
            trailing: BooruFavicon(SearchHandler.instance.currentBooruHandler.booru),
            title: Text(context.loc.tagsManager.addATab),
          ),
        ],
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
              title: Text(context.loc.tagsManager.copiedToClipboard, style: const TextStyle(fontSize: 20)),
              content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.copy),
          title: Text(context.loc.tagsManager.copy),
        ),
        //
        // don't need this since we shouldn't delete tags from sqlite
        // const SizedBox(height: 10),
        // ListTile(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(5),
        //     side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        //   ),
        //   onTap: widget.onDelete,
        //   leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
        //   title: const Text('Delete'),
        // ),
        //
        if (widget.onSetStale != null) ...[
          const SizedBox(height: 10),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () => callbackWithSetState(widget.onSetStale!),
            leading: const Icon(Icons.timer_off),
            title: Text(context.loc.tagsManager.setStale),
          ),
        ],
        //
        if (widget.onResetStale != null) ...[
          const SizedBox(height: 10),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () => callbackWithSetState(widget.onResetStale!),
            leading: const Icon(Icons.restore),
            title: Text(context.loc.tagsManager.resetStale),
          ),
        ],
        //
        if (widget.onSetUnstaleable != null) ...[
          const SizedBox(height: 10),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () => callbackWithSetState(widget.onSetUnstaleable!),
            leading: const Icon(Icons.lock_clock),
            title: Text(context.loc.tagsManager.makeUnstaleable),
          ),
        ],
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () => Navigator.of(context).pop(),
          leading: const Icon(Icons.cancel_outlined),
          title: Text(context.loc.tagsManager.close),
        ),
      ],
    );
  }
}
