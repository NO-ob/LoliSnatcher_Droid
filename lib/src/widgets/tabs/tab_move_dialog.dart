import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';

class TabMoveDialog extends StatefulWidget {
  const TabMoveDialog({
    required this.row,
    required this.index,
    super.key,
  });

  final Widget row;
  final int index;

  @override
  State<TabMoveDialog> createState() => _TabMoveDialogState();
}

class _TabMoveDialogState extends State<TabMoveDialog> {
  final SearchHandler searchHandler = SearchHandler.instance;

  final TextEditingController indexController = TextEditingController();

  @override
  void initState() {
    super.initState();

    indexController.text = (widget.index + 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    int? controllerNumber = int.tryParse(indexController.text);
    if (controllerNumber != null) {
      if (controllerNumber < 1) {
        indexController.text = '1';
      } else if (controllerNumber > searchHandler.total) {
        indexController.text = searchHandler.total.toString();
      }
      controllerNumber = int.tryParse(indexController.text);
    }

    return SettingsDialog(
      contentItems: [
        SizedBox(width: double.maxFinite, child: widget.row),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () async {
            searchHandler.moveTab(widget.index, 0);
            Navigator.of(context).pop(true);
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.vertical_align_top),
          title: const Text('Move To Top'),
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () async {
            searchHandler.moveTab(widget.index, searchHandler.total - 1);
            Navigator.of(context).pop(true);
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.vertical_align_bottom),
          title: const Text('Move To Bottom'),
        ),
        //
        const SizedBox(height: 30),
        SettingsTextInput(
          title: 'Tab Number',
          hintText: 'Tab Number',
          onlyInput: true,
          controller: indexController,
          inputType: TextInputType.number,
          numberButtons: true,
          resetText: () => (widget.index + 1).toString(),
          numberStep: 1,
          numberMin: 1,
          numberMax: searchHandler.total.toDouble(),
          onChanged: (String value) {
            setState(() {});
          },
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          enabled: controllerNumber != null && controllerNumber != widget.index + 1,
          onTap: () async {
            final int? enteredIndex = int.tryParse(indexController.text);
            if (enteredIndex == null || (enteredIndex < 1 || enteredIndex > searchHandler.total)) {
              return await FlashElements.showSnackbar(
                title: const Text('Invalid Tab Number'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (enteredIndex == null)
                      const Text('Invalid Input')
                    else if (enteredIndex < 1 || enteredIndex > searchHandler.total)
                      const Text('Out of range'),
                    //
                    const SizedBox(height: 10),
                    const Text('Please enter a valid tab number'),
                  ],
                ),
              );
            } else {
              searchHandler.moveTab(widget.index, enteredIndex - 1);

              // close move dialog
              Navigator.of(context).pop(true);
              // close tab options dialog
              Navigator.of(context).pop(true);
            }
          },
          leading: const Icon(Icons.vertical_align_center),
          title: Text('Move To #${controllerNumber ?? '?'}'),
        ),
        //
        const SizedBox(height: 10),
        const Text('Preview:'),
        const SizedBox(height: 10),
        TabMovePreview(
          index: widget.index,
          indexController: indexController,
          setState: setState,
        ),
        const SizedBox(height: 20),
        const CancelButton(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class TabMovePreview extends StatelessWidget {
  const TabMovePreview({
    required this.index,
    required this.indexController,
    required this.setState,
    super.key,
  });

  final int index;
  final TextEditingController indexController;
  final Function(VoidCallback) setState;

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    int enteredIndex = int.tryParse(indexController.text) ?? index + 1;

    if (enteredIndex < 1) {
      enteredIndex = 1;
    } else if (enteredIndex > searchHandler.total) {
      enteredIndex = searchHandler.total;
    }

    // to make calculations easier
    enteredIndex -= 1;

    const double dotsSize = 20;
    const dotsWidget = Text('...', style: TextStyle(fontSize: dotsSize, height: 1));
    const dotsHeightPlaceholder = SizedBox(height: dotsSize);
    const tabHeightPlaceholder = SizedBox(height: 80);

    final List<Widget> children = <Widget>[];
    // first tab - show only when input is not on first
    if (enteredIndex != 0) {
      children.add(
        TabManagerItem(
          tab: searchHandler.getTabByIndex(index == 0 ? 1 : 0)!,
          index: 0,
          onTap: () {
            indexController.text = 1.toString();
            setState(() {});
          },
        ),
      );
    } else {
      children.add(tabHeightPlaceholder);
    }
    // show dots if more than 2 tabs away from first
    if (enteredIndex > 2) {
      children.add(dotsWidget);
    } else {
      children.add(dotsHeightPlaceholder);
    }
    // show prev tab if more than 1 tab away from first
    if (enteredIndex > 1) {
      children.add(
        TabManagerItem(
          tab: searchHandler.getTabByIndex(index < enteredIndex ? enteredIndex : enteredIndex - 1)!,
          index: enteredIndex - 1,
          onTap: () {
            indexController.text = enteredIndex.toString();
            setState(() {});
          },
        ),
      );
    } else {
      children.add(tabHeightPlaceholder);
    }
    // current tab at entered position
    children.add(
      TabManagerItem(
        tab: searchHandler.getTabByIndex(index)!,
        index: enteredIndex,
        isCurrent: true,
        onTap: () {
          // do nothing
        },
      ),
    );
    // show next tab if more than 1 tab away from last
    if (enteredIndex < searchHandler.total - 2) {
      children.add(
        TabManagerItem(
          tab: searchHandler.getTabByIndex(index <= enteredIndex ? enteredIndex + 1 : enteredIndex)!,
          index: enteredIndex + 1,
          onTap: () {
            indexController.text = (enteredIndex + 2).toString();
            setState(() {});
          },
        ),
      );
    } else {
      children.add(tabHeightPlaceholder);
    }
    // show dots if more than 2 tabs away from last
    if (enteredIndex < searchHandler.total - 3) {
      children.add(dotsWidget);
    } else {
      children.add(dotsHeightPlaceholder);
    }
    // last tab - show only when input is not on last
    if (enteredIndex < searchHandler.total - 1) {
      children.add(
        TabManagerItem(
          tab: searchHandler.getTabByIndex(searchHandler.total - (index + 1 == searchHandler.total ? 2 : 1))!,
          index: searchHandler.total - 1,
          onTap: () {
            indexController.text = searchHandler.total.toString();
            setState(() {});
          },
        ),
      );
    } else {
      children.add(tabHeightPlaceholder);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
