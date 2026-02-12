import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/data/settings/image_quality.dart';
import 'package:lolisnatcher/src/data/settings/video_cache_mode.dart';
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

  late VideoCacheMode videoCacheMode;
  late String extPathOverride;
  late ImageQuality snatchMode;
  bool jsonWrite = false,
      thumbnailCache = true,
      mediaCache = false,
      downloadNotifications = true,
      snatchOnFavourite = false,
      favouriteOnSnatch = false;

  static const List<_CacheType> cacheTypes = [
    _CacheType(_CacheTypeEnum.total, null),
    // TODO ask before deleting favicons, since they cause unneeded network requests on each render if not cached
    _CacheType(_CacheTypeEnum.favicons, 'favicons'),
    _CacheType(_CacheTypeEnum.thumbnails, 'thumbnails'),
    _CacheType(_CacheTypeEnum.samples, 'samples'),
    _CacheType(_CacheTypeEnum.media, 'media'),
    _CacheType(_CacheTypeEnum.webView, 'WebView'),
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

    final cacheTypesToGet = folder == null
        ? cacheTypes
        : cacheTypes.where((e) => e.folder == folder || e.folder == null).toList();

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
    await settingsHandler.saveSettings(restate: false);
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
    final String label = type.type.locName;
    final String size = Tools.formatBytes(stat['totalSize']!, 2);
    final int fileCount = stat['fileNum'] ?? 0;
    final bool isEmpty = stat['fileNum'] == 0 || stat['totalSize'] == 0;
    final bool isLoading = stat['type'] == 'loading';
    final String text = isLoading
        ? context.loc.settings.cache.loading
        : (isEmpty
              ? context.loc.settings.cache.empty
              : (fileCount == 1
                    ? context.loc.settings.cache.inFileSingular(size: size)
                    : context.loc.settings.cache.inFilesPlural(size: size, count: fileCount)));

    final bool allowedToClear = folder != null && folder != 'favicons' && !isEmpty;

    return SettingsButton(
      name: '$label: $text',
      icon: isLoading ? const CircularProgressIndicator() : Icon(allowedToClear ? Icons.delete_forever : null),
      action: () async {
        if (allowedToClear) {
          FlashElements.showSnackbar(
            context: context,
            position: FlashPosition.top,
            duration: const Duration(seconds: 2),
            title: Text(
              context.loc.settings.cache.cacheCleared,
              style: const TextStyle(fontSize: 20),
            ),
            content: Text(
              context.loc.settings.cache.clearedCacheType(type: label),
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
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: SettingsAppBar(
          title: context.loc.settings.cache.title,
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsOptionsList<ImageQuality>(
                value: snatchMode,
                items: ImageQuality.values,
                onChanged: (ImageQuality? newValue) {
                  setState(() {
                    snatchMode = newValue ?? ImageQuality.defaultValue;
                  });
                },
                title: context.loc.settings.cache.snatchQuality,
                itemTitleBuilder: (e) => e?.locName ?? '',
              ),
              SettingsTextInput(
                controller: snatchCooldownController,
                title: context.loc.settings.cache.snatchCooldown,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.settings.cache.pleaseEnterAValidTimeout;
                  } else if (parse < 10) {
                    return context.loc.settings.cache.biggerThan10;
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
                title: context.loc.settings.cache.showDownloadNotifications,
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
                title: context.loc.settings.cache.snatchItemsOnFavouriting,
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
                title: context.loc.settings.cache.favouriteItemsOnSnatching,
              ),
              SettingsToggle(
                value: (!Platform.isAndroid || extPathOverride.isNotEmpty) && jsonWrite,
                onChanged: (newValue) {
                  setState(() {
                    jsonWrite = newValue;
                  });
                },
                enabled: !Platform.isAndroid || extPathOverride.isNotEmpty,
                title: context.loc.settings.cache.writeImageDataOnSave,
                subtitle: (!Platform.isAndroid || extPathOverride.isNotEmpty)
                    ? null
                    : Text(context.loc.settings.cache.requiresCustomStorageDirectory),
              ),
              SettingsButton(
                name: context.loc.settings.cache.setStorageDirectory,
                subtitle: extPathOverride.isEmpty
                    ? null
                    : Text(context.loc.settings.cache.currentPath(path: extPathOverride)),
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
                      title: Text(
                        context.loc.settings.cache.errorExclamation,
                        style: const TextStyle(fontSize: 20),
                      ),
                      content: Text(
                        context.loc.settings.cache.notAvailableForPlatform,
                        style: const TextStyle(fontSize: 16),
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
                  name: context.loc.settings.cache.resetStorageDirectory,
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
                title: context.loc.settings.cache.cachePreviews,
              ),
              SettingsToggle(
                value: mediaCache,
                onChanged: (newValue) {
                  setState(() {
                    mediaCache = newValue;
                  });
                },
                title: context.loc.settings.cache.cacheMedia,
              ),
              SettingsOptionsList<VideoCacheMode>(
                value: videoCacheMode,
                items: VideoCacheMode.values,
                onChanged: (VideoCacheMode? newValue) {
                  setState(() {
                    videoCacheMode = newValue ?? VideoCacheMode.defaultValue;
                  });
                },
                title: context.loc.settings.cache.videoCacheMode,
                itemTitleBuilder: (e) => e?.locName ?? '',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.cache.videoCacheModesTitle),
                          contentItems: [
                            Text(context.loc.settings.cache.videoCacheModeStream),
                            Text(context.loc.settings.cache.videoCacheModeCache),
                            Text(context.loc.settings.cache.videoCacheModeStreamCache),
                            const Text(''),
                            Text(context.loc.settings.cache.videoCacheNoteEnable),
                            const Text(''),
                            if (SettingsHandler.isDesktopPlatform)
                              Text(context.loc.settings.cache.videoCacheWarningDesktop),
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
                title: context.loc.settings.cache.deleteCacheAfter,
              ),
              SettingsTextInput(
                controller: cacheSizeController,
                title: context.loc.settings.cache.cacheSizeLimit,
                hintText: context.loc.settings.cache.maximumTotalCacheSize,
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['cacheSize']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 0,
                numberMax: double.infinity,
              ),
              const SettingsButton(name: '', enabled: false),
              SettingsButton(name: context.loc.settings.cache.cacheStats),
              ...cacheTypes.map(buildCacheButton),
              SettingsButton(
                name: context.loc.settings.cache.clearAllCache,
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
                action: () async {
                  FlashElements.showSnackbar(
                    context: context,
                    position: FlashPosition.top,
                    title: Text(
                      context.loc.settings.cache.cacheCleared,
                      style: const TextStyle(fontSize: 20),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.loc.settings.cache.clearedCacheCompletely,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          context.loc.settings.cache.appRestartRequired,
                          style: const TextStyle(fontSize: 16),
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

enum _CacheTypeEnum {
  total,
  favicons,
  thumbnails,
  samples,
  media,
  webView,
  ;

  String get locName {
    switch (this) {
      case total:
        return loc.settings.cache.cacheTypeTotal;
      case favicons:
        return loc.settings.cache.cacheTypeFavicons;
      case thumbnails:
        return loc.settings.cache.cacheTypeThumbnails;
      case samples:
        return loc.settings.cache.cacheTypeSamples;
      case media:
        return loc.settings.cache.cacheTypeMedia;
      case webView:
        return loc.settings.cache.cacheTypeWebView;
    }
  }
}

class _CacheType {
  const _CacheType(
    this.type,
    this.folder,
  );

  final _CacheTypeEnum type;
  final String? folder;
}
