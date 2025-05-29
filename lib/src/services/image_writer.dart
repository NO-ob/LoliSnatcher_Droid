import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class ImageWriter {
  ImageWriter() {
    setPaths();
  }
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  String path = '', cacheRootPath = '';

  /// return null - file already exists
  /// return String - file saved
  /// return Error - something went wrong
  Future write(
    BooruItem item,
    Booru booru,
    void Function(int, int)? onProgress,
    bool ignoreExists,
    void Function(CancelToken)? onCancelTokenCreate,
  ) async {
    final String fileName = getFilename(item, booru);
    await setPaths();

    // Don't do anything if file already exists
    final File image = File(path + fileName);
    // print(path! + fileName);
    final bool fileExists = await image.exists();
    // if (fileExists) return null;
    if (!ignoreExists && (fileExists || item.isSnatched.value == true)) {
      item.isSnatched.value = true;
      if (settingsHandler.dbEnabled) {
        await settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.local);
      }
      return null;
    }
    try {
      final fileNameSplit = fileName.split('.');
      final fileNameWoutExt = fileNameSplit.sublist(0, fileNameSplit.length - 1).join('.');

      final headers = {
        'Accept': '*/*',
        'Content-Type': '*/*',
        ...await Tools.getFileCustomHeaders(booru, checkForReferer: true),
      };

      final String url = ((settingsHandler.snatchMode == 'Sample' && item.sampleURL.isNotEmpty)
          ? item.sampleURL
          : item.fileURL);

      final cancelToken = CancelToken();
      if (onCancelTokenCreate != null) {
        onCancelTokenCreate(cancelToken);
      }

      if (Platform.isAndroid && settingsHandler.extPathOverride.isNotEmpty) {
        await DioNetwork.downloadCustom(
          url,
          '$path/',
          fileNameWoutExt,
          item.fileExt!,
          item.mediaType.toJson(),
          options: Options(
            responseType: ResponseType.bytes,
            contentType: '*/*',
          ),
          headers: headers,
          onReceiveProgress: onProgress,
          cancelToken: cancelToken,
        );
      } else {
        await DioNetwork.download(
          url,
          '$path/$fileName',
          options: Options(
            responseType: ResponseType.bytes,
            contentType: '*/*',
          ),
          headers: headers,
          onReceiveProgress: onProgress,
          cancelToken: cancelToken,
        );
      }

      try {
        if (settingsHandler.jsonWrite) {
          if (Platform.isAndroid &&
              settingsHandler.extPathOverride.isNotEmpty &&
              await ServiceHandler.getAndroidSDKVersion() >= 31) {
            final String? safPath = await ServiceHandler.createFileStreamFromSAFDirectory(
              fileNameWoutExt,
              'application/json',
              'json',
              '$path/',
            );
            if (safPath != null) {
              await ServiceHandler.writeStreamToFileFromSAFDirectory(
                safPath,
                Uint8List.fromList(jsonEncode(item.toJson()).codeUnits),
              );
              await ServiceHandler.closeStreamToFileFromSAFDirectory(safPath);
            }
          } else if (Platform.isAndroid && await ServiceHandler.getAndroidSDKVersion() < 31) {
            final File jsonFile = File('$path$fileNameWoutExt.json');
            await jsonFile.writeAsString(
              jsonEncode(item.toJson()),
              mode: FileMode.write,
              flush: true,
            );
          }
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'ImageWriter',
          'write',
          LogTypes.exception,
          s: s,
        );
      }

      print('Image written: $path$fileName');
      item.isSnatched.value = true;
      if (settingsHandler.dbEnabled) {
        await settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.local);
      }

      try {
        if (Platform.isAndroid) {
          if (settingsHandler.extPathOverride.isNotEmpty && await ServiceHandler.getAndroidSDKVersion() >= 31) {
            final bool result = await ServiceHandler.existsFileFromSAFDirectory(path, fileName);
            if (!result) {
              throw Exception('SAF file not found');
            }
          } else {
            await ServiceHandler.callMediaScanner(image.path);
          }
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'ImageWriter',
          'write',
          LogTypes.exception,
          s: s,
        );
        return e;
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'ImageWriter',
        'write',
        LogTypes.exception,
        s: s,
      );
      return e;
    }
    return fileName;
  }

  String getFilename(
    BooruItem item,
    Booru booru,
  ) {
    final int queryLastIndex = item.fileURL.lastIndexOf('?');
    final int lastIndex = queryLastIndex != -1 ? queryLastIndex : item.fileURL.length;
    String fileName = '';
    if (booru.type == BooruType.BooruOnRails || booru.type == BooruType.Philomena) {
      fileName = '${item.fileNameExtras}.${item.fileExt!}';
    } else if (booru.type == BooruType.Hydrus) {
      fileName = '${item.fileNameExtras}_${item.md5String}.${item.fileExt}';
    } else if (booru.baseURL!.contains('yande.re') || booru.baseURL!.contains('paheal.net')) {
      fileName = '${booru.name}_${item.md5String}.${item.fileExt}';
    } else {
      fileName = '${booru.name!}_${item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1, lastIndex)}';
    }
    print('filename is $fileName');
    return fileName;
  }

  Future<String> getFilePath(
    BooruItem item,
    Booru booru,
  ) async {
    await setPaths();
    final String fileName = getFilename(item, booru);
    return path + fileName;
  }

  Stream<Map<String, dynamic>> writeMultiple(
    List<BooruItem> snatched,
    Booru booru,
    int cooldown,
    void Function(int, int)? onProgress,
    bool ignoreExists,
    void Function(CancelToken)? onCancelTokenCreate,
  ) async* {
    int snatchedCounter = 1;
    final List<BooruItem> existsList = [], failedList = [], cancelledList = [];
    for (int i = 0; i < snatched.length; i++) {
      await Future.delayed(Duration(milliseconds: cooldown), () async {
        final snatchResult = await write(
          snatched.elementAt(i),
          booru,
          onProgress,
          ignoreExists,
          onCancelTokenCreate,
        );
        if (snatchResult == null) {
          existsList.add(snatched[i]);
        } else if (snatchResult is! String) {
          if (snatchResult is DioException && CancelToken.isCancel(snatchResult)) {
            cancelledList.add(snatched[i]);
          } else {
            failedList.add(snatched[i]);
          }
        }
      });
      snatchedCounter++;
      yield {
        'snatched': snatchedCounter,
      };
    }

    yield {
      'snatched': snatchedCounter,
      'exists': existsList,
      'failed': failedList,
      'cancelled': cancelledList,
    };
  }

  Future<File?> writeCacheFromBytes(
    String fileURL,
    List<int> bytes,
    String typeFolder, {
    required String fileNameExtras,
    bool clearName = true,
  }) async {
    File? image;
    try {
      await setPaths();
      final String cachePath = '$cacheRootPath$typeFolder/';
      // print("write cahce from bytes:: cache path is $cachePath");
      await Directory(cachePath).create(recursive: true);

      final String fileName = sanitizeName(
        clearName ? parseThumbUrlToName(fileURL) : fileURL,
        fileNameExtras: fileNameExtras,
      );
      image = File(cachePath + fileName);
      await image.writeAsBytes(bytes, flush: true);
    } catch (e) {
      print('Image Writer Exception :: cache write bytes :: $e');
      return null;
    }
    return image;
  }

  // Deletes file from given cache folder
  // returns true if successful, false if there was an exception and null if file didn't exist
  Future deleteFileFromCache(
    String fileURL,
    String typeFolder, {
    required String fileNameExtras,
  }) async {
    try {
      await setPaths();
      final String cachePath = '$cacheRootPath$typeFolder/';
      final String fileName = sanitizeName(parseThumbUrlToName(fileURL), fileNameExtras: fileNameExtras);
      final File file = File(cachePath + fileName);
      if (await file.exists()) {
        await file.delete();
        return true;
      } else {
        return null;
      }
    } catch (e) {
      print('Image Writer Exception :: delete from cache :: $e');
      return false;
    }
  }

  Future deleteCacheFolder(String typeFolder) async {
    try {
      await setPaths();
      final String cachePath = '$cacheRootPath$typeFolder/';
      final Directory folder = Directory(cachePath);
      if (await folder.exists()) {
        await folder.delete(recursive: true);
        return true;
      } else {
        return null;
      }
    } catch (e) {
      print('Image Writer Exception :: delete cache folder :: $e');
      return false;
    }
  }

  Future<String?> getCachePath(
    String fileURL,
    String typeFolder, {
    required String fileNameExtras,
    bool clearName = true,
  }) async {
    String cachePath;
    try {
      await setPaths();
      cachePath = '$cacheRootPath$typeFolder/';

      final String fileName = sanitizeName(
        clearName ? parseThumbUrlToName(fileURL) : fileURL,
        fileNameExtras: fileNameExtras,
      );
      final File cacheFile = File(cachePath + fileName);
      if (await cacheFile.exists()) {
        if (await cacheFile.length() > 0) {
          return cachePath + fileName;
        } else {
          // somehow some files can save with zero bytes - we remove them
          await cacheFile.delete();
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Image Writer Exception :: get cache path :: $e');
      return null;
    }
  }

  Future<String> getCachePathString(
    String fileURL,
    String typeFolder, {
    required String fileNameExtras,
    bool clearName = true,
  }) async {
    await setPaths();
    String cachePath;
    cachePath = '$cacheRootPath$typeFolder/';

    final String fileName = sanitizeName(
      clearName ? parseThumbUrlToName(fileURL) : fileURL,
      fileNameExtras: fileNameExtras,
    );
    return cachePath + fileName;
  }

  // calculates cache (total or by type) size and file count
  Future<Map<String, int>> getCacheStat(String? typeFolder) async {
    String cacheDirPath;
    int fileNum = 0;
    int totalSize = 0;
    try {
      await setPaths();
      cacheDirPath = "$cacheRootPath${typeFolder ?? ''}/";

      final Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        final List<FileSystemEntity> files = await cacheDir.list(recursive: true, followLinks: false).toList();
        for (final FileSystemEntity file in files) {
          if (file is File) {
            fileNum++;
            totalSize += await file.length();
          }
        }
      }
    } catch (e) {
      print('Image Writer Exception :: get cache stat :: $e');
    }

    return {'fileNum': fileNum, 'totalSize': totalSize};
  }

  // keep files that are 100mb of the cache limit
  static const double fileSizeToKeep = 100 * 1024 * 1024;

  // TODO move to isolate?
  Future<void> clearStaleCache() async {
    final bool isStaleClearActive = settingsHandler.cacheDuration.inMilliseconds > 0;

    final timeNow = DateTime.now().millisecondsSinceEpoch;
    final timeMonthAgo = DateTime.now().subtract(const Duration(days: 30)).millisecondsSinceEpoch;

    String cacheDirPath;
    try {
      await setPaths();
      cacheDirPath = '$cacheRootPath/';

      final Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        final List<FileSystemEntity> files = await cacheDir.list(recursive: true, followLinks: false).toList();
        for (final FileSystemEntity file in files) {
          if (file is File) {
            try {
              final bool isNotExcludedExt = Tools.getFileExt(file.path) != 'ico';
              final DateTime lastModified = await file.lastModified();
              if (isStaleClearActive) {
                final bool isStale =
                    (lastModified.millisecondsSinceEpoch + settingsHandler.cacheDuration.inMilliseconds) < timeNow;
                if (isNotExcludedExt && isStale) {
                  await file.delete();
                }
              } else {
                // delete files that are too big and older than 30 days, even when stale cache clearing is disabled
                final bool isTooBig = await file.length() > fileSizeToKeep;
                final bool isMonthOld = lastModified.millisecondsSinceEpoch < timeMonthAgo;
                if (isNotExcludedExt && isTooBig && isMonthOld) {
                  await file.delete();
                }
              }
            } catch (e) {
              print('Image Writer Exception :: clear stale cache :: $e');
              try {
                await file.delete();
              } catch (_) {}
            }
          }
        }
      }
    } catch (e) {
      print('Image Writer Exception :: clear stale cache :: $e');
    }
    return;
  }

  // TODO move to isolate?
  Future<void> clearCacheOverflow() async {
    // never clear cache overflow if limit is 0
    // TODO maybe check available space left and ignore that setting if not enough space?
    if (settingsHandler.cacheSize == 0) {
      return;
    }

    String cacheDirPath;
    final List<FileSystemEntity> toDelete = [];
    int toDeleteSize = 0;
    int currentCacheSize = 0;
    try {
      await setPaths();
      cacheDirPath = '$cacheRootPath/';

      final Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        final List<File> files = (await cacheDir.list(recursive: true, followLinks: false).toList())
            .whereType<File>()
            .toList();
        for (final File file in files) {
          currentCacheSize += await file.length();
        }

        final int limitSize = settingsHandler.cacheSize * pow(1024, 3) as int;
        final int overflowSize = currentCacheSize - limitSize;
        if (overflowSize > 0) {
          files.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));

          for (final File file in files) {
            try {
              final bool isNotExcludedExt = Tools.getFileExt(file.path) != 'ico';
              final bool stillOverflows = toDeleteSize < overflowSize;
              if (isNotExcludedExt && stillOverflows) {
                final fileSize = await file.length();
                if (fileSize <= fileSizeToKeep) {
                  // if file is smaller than fileSizeToKeep, we delete it
                  // otherwise leave it to be deleted by clearStaleCache after a month or manually by user
                  toDelete.add(file);
                  toDeleteSize += fileSize;
                }
              }
            } catch (e) {
              print('Image Writer Exception :: clear cache overflow :: $e');
              try {
                await file.delete();
              } catch (_) {}
            }
          }
        }
      }
    } catch (e) {
      print('Image Writer Exception :: clear cache overflow :: $e');
    }

    // print(toDelete);
    // print(toDeleteSize);
    for (final file in toDelete) {
      await file.delete();
    }
    return;
  }

  String parseThumbUrlToName(String thumbURL) {
    String result = '';
    if (thumbURL.contains('Hydrus-Client')) {
      result = "hydrusThumb_${thumbURL.split("&")[0].split("=")[1]}";
    } else {
      final int queryLastIndex = thumbURL.lastIndexOf('?'); // Sankaku fix
      final int lastIndex = queryLastIndex != -1 ? queryLastIndex : thumbURL.length;
      result = thumbURL.substring(thumbURL.lastIndexOf('/') + 1, lastIndex);
      if (result.startsWith('thumb.')) {
        //Paheal/shimmie(?) fix
        final String unthumbedURL = thumbURL.replaceAll('/thumb', '');
        result = unthumbedURL.substring(unthumbedURL.lastIndexOf('/') + 1);
      }
    }

    return result;
  }

  String sanitizeName(String fileName, {required String fileNameExtras}) {
    return '${Tools.sanitize(fileNameExtras)}${Tools.sanitize(fileName)}';
  }

  Future<String> writeMascotImage(String contentUri) async {
    await setPaths();
    if (contentUri.isNotEmpty) {
      final Uint8List? fileBytes = await ServiceHandler.getSAFFile(contentUri);
      final String fileExt = await ServiceHandler.getSAFFileExtension(contentUri);
      if (fileBytes != null && fileExt.isNotEmpty) {
        final String path = await ServiceHandler.getConfigDir();
        await File('${path}mascot.$fileExt').writeAsBytes(fileBytes);
        return '${path}mascot.$fileExt';
      }
    }
    return '';
  }

  Future<bool> setPaths() async {
    if (path.isEmpty) {
      if (settingsHandler.extPathOverride.isEmpty) {
        path = await ServiceHandler.getPicturesDir();
      } else {
        path = settingsHandler.extPathOverride;
      }
    }

    if (cacheRootPath.isEmpty) {
      cacheRootPath = await ServiceHandler.getCacheDir();
    }

    // print('path: $path');
    // print('cache path: $cacheRootPath');
    return true;
  }
}
