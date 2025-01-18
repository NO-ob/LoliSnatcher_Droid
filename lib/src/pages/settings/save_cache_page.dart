import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/services/image_writer_isolate.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class SaveCachePage extends StatefulWidget {
  const SaveCachePage({super.key});

  @override
  State<SaveCachePage> createState() => _SaveCachePageState();
}

class _SaveCachePageState extends State<SaveCachePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ImageWriter imageWriter = ImageWriter();

  final TextEditingController snatchCooldownController = TextEditingController();
  final TextEditingController cacheSizeController = TextEditingController();

  late String videoCacheMode, extPathOverride, snatchMode;
  bool jsonWrite = false, thumbnailCache = true, mediaCache = false, downloadNotifications = true, snatchOnFavourite = false, favouriteOnSnatch = false;

  static const List<_CacheType> cacheTypes = [
    _CacheType('Total', null),
    // TODO ask before deleting favicons, since they cause unneeded network requests on each render if not cached
    _CacheType('Favicons', 'favicons'),
    _CacheType('Thumbnails', 'thumbnails'),
    _CacheType('Samples', 'samples'),
    _CacheType('Media', 'media'),
    _CacheType('WebView', 'WebView'),
  ]; // {displayed name, cache folder}
  List<Map<String, dynamic>> cacheStats = [];
  Map<String, dynamic>? cacheDurationSelected;
  late Duration cacheDuration;
  Isolate? isolate;

  @override
  void initState() {
    super.initState();

    snatchCooldownController.text = settingsHandler.snatchCooldown.toString();
    thumbnailCache = settingsHandler.thumbnailCache;
    mediaCache = settingsHandler.mediaCache;
    videoCacheMode = settingsHandler.videoCacheMode;
    extPathOverride = settingsHandler.extPathOverride;
    snatchMode = settingsHandler.snatchMode;
    jsonWrite = settingsHandler.jsonWrite;
    cacheDuration = settingsHandler.cacheDuration;
    cacheDurationSelected = settingsHandler.map['cacheDuration']!['options']!.firstWhere((dur) {
      return dur['value'].inSeconds == cacheDuration.inSeconds;
    });
    cacheSizeController.text = settingsHandler.cacheSize.toString();
    downloadNotifications = settingsHandler.downloadNotifications;
    snatchOnFavourite = settingsHandler.snatchOnFavourite;
    favouriteOnSnatch = settingsHandler.favouriteOnSnatch;

    getCacheStats(null);
  }

  @override
  void dispose() {
    snatchCooldownController.dispose();
    cacheSizeController.dispose();
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
    super.dispose();
  }

  Future<void> getCacheStats(String? folder) async {
    if (folder != null) {
      // delete selected folder stats + global
      cacheStats.removeWhere((e) => e['type'] == folder || e['type'] == '' || e['type'] == null);
    } else {
      cacheStats = [];
    }

    final cacheTypesToGet = folder == null ? cacheTypes : cacheTypes.where((e) => e.folder == folder || e.folder == null).toList();

    for (final _CacheType type in cacheTypesToGet) {
      final ReceivePort receivePort = ReceivePort();
      isolate = await Isolate.spawn(_isolateEntry, receivePort.sendPort);

      receivePort.listen((dynamic data) async {
        if (mounted) {
          if (data is SendPort) {
            data.send({
              'path': await ServiceHandler.getCacheDir(),
              'type': type.folder,
            });
          } else {
            cacheStats.add(data);
            setState(() {});
          }
        }
      });
    }
    return;
  }

  static Future<void> _isolateEntry(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final config = await receivePort.first;
    d.send(await ImageWriterIsolate(config['path']).getCacheStat(config['type']));
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.snatchCooldown = int.parse(snatchCooldownController.text);
    settingsHandler.jsonWrite = jsonWrite;
    settingsHandler.mediaCache = mediaCache;
    settingsHandler.thumbnailCache = thumbnailCache;
    settingsHandler.videoCacheMode = videoCacheMode;
    settingsHandler.cacheDuration = cacheDuration;
    settingsHandler.cacheSize = int.parse(cacheSizeController.text);
    settingsHandler.extPathOverride = extPathOverride;
    settingsHandler.snatchMode = snatchMode;
    settingsHandler.downloadNotifications = downloadNotifications;
    settingsHandler.snatchOnFavourite = snatchOnFavourite;
    settingsHandler.favouriteOnSnatch = favouriteOnSnatch;
    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  void setPath(String path) {
    if (path.isNotEmpty) {
      settingsHandler.extPathOverride = path;
    }
  }

  Widget buildCacheButton(_CacheType type) {
    final Map<String, dynamic> stat = cacheStats.firstWhere(
      (stat) => stat['type'] == type.folder,
      orElse: () => {
        'type': 'loading',
        'totalSize': -1,
        'fileNum': -1,
      },
    );
    final String? folder = type.folder;
    final String label = type.label;
    final String size = Tools.formatBytes(stat['totalSize']!, 2);
    final int fileCount = stat['fileNum'] ?? 0;
    final bool isEmpty = stat['fileNum'] == 0 || stat['totalSize'] == 0;
    final bool isLoading = stat['type'] == 'loading';
    final String text = isLoading ? 'Loading...' : (isEmpty ? 'Empty' : '$size in $fileCount ${Tools.pluralize('file', fileCount)}');

    final bool allowedToClear = folder != null && folder != 'favicons' && !isEmpty;

    return SettingsButton(
      name: '$label: $text',
      icon: isLoading ? const CircularProgressIndicator() : Icon(allowedToClear ? Icons.delete_forever : null),
      action: () async {
        if (allowedToClear) {
          FlashElements.showSnackbar(
            context: context,
            position: Positions.top,
            duration: const Duration(seconds: 2),
            title: const Text(
              'Cache cleared!',
              style: TextStyle(fontSize: 20),
            ),
            content: Text(
              'Cleared $label cache!',
              style: const TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.delete_forever,
            leadingIconColor: Colors.red,
            leadingIconSize: 40,
            sideColor: Colors.yellow,
          );
          await imageWriter.deleteCacheFolder(folder);
          await getCacheStats(folder);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Snatching & Caching'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsOptionsList(
                value: snatchMode,
                items: settingsHandler.map['snatchMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    snatchMode = newValue ?? settingsHandler.map['snatchMode']!['default'];
                  });
                },
                title: 'Snatch quality',
              ),
              SettingsTextInput(
                controller: snatchCooldownController,
                title: 'Snatch cooldown (in ms)',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['snatchCooldown']!['default']!.toString(),
                numberButtons: true,
                numberStep: 50,
                numberMin: 0,
                numberMax: double.infinity,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid timeout value';
                  } else if (parse < 10) {
                    return 'Please enter a value bigger than 10ms';
                  } else {
                    return null;
                  }
                },
              ),
              SettingsToggle(
                value: downloadNotifications,
                onChanged: (newValue) {
                  setState(() {
                    downloadNotifications = newValue;
                  });
                },
                title: 'Show download notifications',
              ),
              SettingsToggle(
                value: snatchOnFavourite,
                onChanged: (newValue) {
                  setState(() {
                    snatchOnFavourite = newValue;
                  });
                },
                trailingIcon: const Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    Icon(Icons.arrow_right_alt_rounded),
                    Icon(Icons.save),
                  ],
                ),
                title: 'Snatch items on favouriting',
              ),
              SettingsToggle(
                value: favouriteOnSnatch,
                onChanged: (newValue) {
                  setState(() {
                    favouriteOnSnatch = newValue;
                  });
                },
                trailingIcon: const Row(
                  children: [
                    Icon(Icons.save),
                    Icon(Icons.arrow_right_alt_rounded),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
                title: 'Favourite items on snatching',
              ),
              SettingsToggle(
                value: (!Platform.isAndroid || extPathOverride.isNotEmpty) && jsonWrite,
                onChanged: (newValue) {
                  setState(() {
                    jsonWrite = newValue;
                  });
                },
                enabled: !Platform.isAndroid || extPathOverride.isNotEmpty,
                title: 'Write image data to JSON on save',
                subtitle: (!Platform.isAndroid || extPathOverride.isNotEmpty) ? null : const Text('Requires custom storage directory'),
              ),
              SettingsButton(
                name: 'Set storage directory',
                subtitle: extPathOverride.isEmpty ? null : Text('Current: $extPathOverride'),
                icon: const Icon(Icons.folder_outlined),
                action: () async {
                  //String url = await ServiceHandler.setExtDir();

                  if (Platform.isAndroid) {
                    final String newPath = await ServiceHandler.setExtDir();
                    extPathOverride = newPath;
                    setState(() {});
                    // TODO Store uri in settings and make another button so can set seetings dir and pictures dir
                  } else {
                    // TODO need to update dir picker to work on desktop
                    // String? value;
                    // if(settingsHandler.appMode.value.isDesktop) {
                    //   value = await showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return Dialog(
                    //         child: SizedBox(
                    //           width: 500,
                    //           child: DirPicker(path),
                    //         ),
                    //       );
                    //     },
                    //   );
                    // } else {
                    // TODO remove this Get
                    //   value = await Get.to(() => DirPicker(path))!;
                    // }
                    // setPath(value ?? "");

                    FlashElements.showSnackbar(
                      context: context,
                      title: const Text(
                        'Error!',
                        style: TextStyle(fontSize: 20),
                      ),
                      content: const Text(
                        'Currently not available for this platform',
                        style: TextStyle(fontSize: 16),
                      ),
                      leadingIcon: Icons.error_outline,
                      leadingIconColor: Colors.red,
                      sideColor: Colors.red,
                    );
                  }
                },
              ),
              if (extPathOverride.isNotEmpty)
                SettingsButton(
                  name: 'Reset storage directory',
                  icon: const Icon(Icons.refresh),
                  action: () {
                    setState(() {
                      extPathOverride = '';
                    });
                  },
                ),
              const SettingsButton(name: '', enabled: false),
              SettingsToggle(
                value: thumbnailCache,
                onChanged: (newValue) {
                  setState(() {
                    thumbnailCache = newValue;
                  });
                },
                title: 'Cache previews',
              ),
              SettingsToggle(
                value: mediaCache,
                onChanged: (newValue) {
                  setState(() {
                    mediaCache = newValue;
                  });
                },
                title: 'Cache media',
              ),
              SettingsOptionsList(
                value: videoCacheMode,
                items: settingsHandler.map['videoCacheMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    videoCacheMode = newValue ?? settingsHandler.map['videoCacheMode']!['default'];
                  });
                },
                title: 'Video cache mode',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: const Text('Video cache modes'),
                          contentItems: [
                            const Text("- Stream - Don't cache, start playing as soon as possible"),
                            const Text('- Cache - Saves the file to device storage, plays only when download is complete'),
                            const Text('- Stream+Cache - Mix of both, but currently leads to double download'),
                            const Text(''),
                            const Text("[Note]: Videos will cache only if 'Cache Media' is enabled."),
                            const Text(''),
                            if (SettingsHandler.isDesktopPlatform) const Text('[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsDropdown(
                value: (cacheDurationSelected?['label'] ?? '') as String,
                items: List<String>.from(
                  settingsHandler.map['cacheDuration']!['options'].map((dur) {
                    return dur['label'];
                  }),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    cacheDurationSelected = settingsHandler.map['cacheDuration']!['options'].firstWhere((dur) {
                      return dur['label'] == newValue;
                    });
                    cacheDuration = cacheDurationSelected!['value'];
                  });
                },
                title: 'Delete cache after:',
              ),
              SettingsTextInput(
                controller: cacheSizeController,
                title: 'Cache size Limit (in GB)',
                hintText: 'Maximum total cache size',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['cacheSize']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 0,
                numberMax: double.infinity,
              ),
              const SettingsButton(name: '', enabled: false),
              const SettingsButton(name: 'Cache stats:'),
              ...cacheTypes.map(buildCacheButton),
              SettingsButton(
                name: 'Clear all cache',
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
                action: () async {
                  FlashElements.showSnackbar(
                    context: context,
                    position: Positions.top,
                    title: const Text(
                      'Cache cleared!',
                      style: TextStyle(fontSize: 20),
                    ),
                    content: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cleared cache completely!',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'App Restart may be required!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    leadingIcon: Icons.delete_forever,
                    leadingIconColor: Colors.red,
                    leadingIconSize: 40,
                    sideColor: Colors.yellow,
                  );
                  await imageWriter.deleteCacheFolder('');
                  // await serviceHandler.emptyCache();
                  await getCacheStats(null);
                },
                drawBottomBorder: false,
              ),
              const SettingsButton(name: '', enabled: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _CacheType {
  const _CacheType(
    this.label,
    this.folder,
  );

  final String label;
  final String? folder;
}
