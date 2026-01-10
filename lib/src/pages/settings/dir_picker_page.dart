import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DirPicker extends StatefulWidget {
  const DirPicker(this.path, {super.key});
  final String path;

  @override
  State<DirPicker> createState() => _DirPickerState();
}

// Need to make this return the seslected directory to previous page. Might use getx variable not sure yet
// Might also use a grid and add folder icons isntead of listing text
// Need to make a dialog to create a new folder
class _DirPickerState extends State<DirPicker> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final newDirNameController = TextEditingController();
  String path = '';

  @override
  void initState() {
    super.initState();
    path = widget.path;
  }

  @override
  void dispose() {
    newDirNameController.dispose();
    super.dispose();
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    if (path == '/storage') {
      final bool? shouldPop = await showDialog(
        context: context,
        builder: (context) {
          return SettingsDialog(
            title: Text(context.loc.areYouSure),
            contentItems: [
              Text(context.loc.settings.dirPicker.closeWithoutChoosing),
            ],
            actionButtons: [
              ElevatedButton.icon(
                icon: const Icon(Icons.cancel_outlined),
                label: Text(context.loc.settings.dirPicker.no),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: Text(context.loc.settings.dirPicker.yes),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );

      if (shouldPop ?? false) {
        Navigator.of(context).pop();
      }
    } else {
      if (path.lastIndexOf('/') > -1) {
        setState(() {
          path = path.substring(0, path.lastIndexOf('/'));
          print(path);
        });
      }
      return;
    }
  }

  void mkdir() {
    final dir = Directory('$path/${newDirNameController.text}');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    if (dir.existsSync()) {
      setState(() {
        path += '/${newDirNameController.text}';
        newDirNameController.text = '';
      });
    } else {
      newDirNameController.text = '';

      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.settings.dirPicker.error,
          style: const TextStyle(fontSize: 20),
        ),
        content: Text(
          context.loc.settings.dirPicker.failedToCreateDirectory,
          style: const TextStyle(fontSize: 16),
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
    }
  }

  bool isWritable() {
    final File file = File('$path/test.txt');
    try {
      file.createSync();
      file.writeAsStringSync('', mode: FileMode.write, flush: true);
      file.deleteSync();
      return true;
    } on FileSystemException {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.settings.dirPicker.error,
          style: const TextStyle(fontSize: 20),
        ),
        content: Text(
          context.loc.settings.dirPicker.directoryNotWritable,
          style: const TextStyle(fontSize: 16),
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
      return false;
    }
  }

  Future<List<String>> getDirs() async {
    final List<String> dirs = [];
    final dir = Directory(path);
    await dir.list(recursive: false).forEach((file) {
      if (file is Directory) {
        dirs.add(file.path.replaceAll(path, ''));
      }
    });
    return dirs;
  }

  @override
  Widget build(BuildContext context) {
    String title = context.loc.settings.dirPicker.selectADirectory;
    if (path != widget.path) {
      title = path.substring(path.lastIndexOf('/') + 1);
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDirs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.length > 0) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!path.endsWith(snapshot.data[index])) {
                              path += snapshot.data[index];
                              print(path);
                            }
                            settingsHandler.extPathOverride = '$path/';
                          });
                        },
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text(snapshot.data[index])),
                        ),
                      );
                    },
                  );
                } else if (title == 'emulated') {
                  return ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!path.endsWith('0')) {
                              path += '/0';
                              print(path);
                            }
                            settingsHandler.extPathOverride = '$path/';
                          });
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Center(child: Text('/0')),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (path == widget.path)
              const SizedBox.shrink()
            else
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  if (isWritable()) {
                    Navigator.of(context).pop('$path/');
                  }
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(Icons.check),
              ),
            Container(
              width: 5,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsDialog(
                      title: Text(context.loc.settings.dirPicker.newDirectory),
                      content: SettingsTextInput(
                        controller: newDirNameController,
                        title: context.loc.settings.dirPicker.directoryName,
                        hintText: context.loc.settings.dirPicker.directoryName,
                        onlyInput: true,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[aA-zZ]'))],
                      ),
                      actionButtons: [
                        const CancelButton(withIcon: true),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label: Text(context.loc.settings.dirPicker.create),
                          onPressed: () {
                            mkdir();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
