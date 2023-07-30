import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/timed_progress_controller.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/restartable_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/gallery/snatched_status_icon.dart';
import 'package:lolisnatcher/src/widgets/gallery/toolbar_action.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

// TODO decouple share and autoscroll stuff into separate widgets

class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HideableAppBar({
    required this.pageController,
    required this.onOpenDrawer,
    super.key,
  });

  final PreloadPageController pageController;
  final VoidCallback onOpenDrawer;

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  State<HideableAppBar> createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  ImageWriter imageWriter = ImageWriter();

  BooruItem? sharedItem;
  double shareProgress = 0;
  int shareProgressLastTick = 0;
  CancelToken? shareCancelToken;

  late StreamSubscription<bool> appbarListener;

  ////////// Auto Scroll Stuff ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///

  bool autoScroll = false;
  Timer? autoScrollTimer;
  TimedProgressController? autoScrollProgressController;

  void setScrollTimer() {
    autoScrollProgressController?.restart();
    autoScrollTimer = Timer.periodic(Duration(milliseconds: settingsHandler.galleryAutoScrollTime), (timer) {
      scrollToNextPage();
      autoScrollProgressController?.restart();
    });
  }

  void unsetScrollTimer() {
    autoScrollTimer?.cancel();
    autoScrollProgressController?.stop();
  }

  void autoScrollState(bool newState) {
    final bool isNotLastPage = (searchHandler.viewedIndex.value + 1) < searchHandler.currentFetched.length;
    if (autoScroll != newState) {
      if (isNotLastPage) {
        setState(() {
          autoScroll = newState;
        });
        newState ? setScrollTimer() : unsetScrollTimer();
      } else {
        if (newState == true) {
          FlashElements.showSnackbar(
            context: context,
            title: const Text("Can't start Slideshow", style: TextStyle(fontSize: 20)),
            content: const Text('Reached the Last loaded Item', style: TextStyle(fontSize: 16)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
        setState(() {
          autoScroll = false;
        });
        unsetScrollTimer();
      }
    }
  }

  void pageListener() {
    if (autoScroll) {
      if (autoScrollTimer?.isActive == true) {
        // reset slideshow timer if user scrolled earlier
        // TODO bug: progress animation lags for a few frames when scroll is automatic
        unsetScrollTimer();
        setScrollTimer();
      }
    }
  }

  void scrollToNextPage() {
    // Not sure if video and gifs should be autoscrolled, could maybe add a listener for video playtime so it changes at the end
    final int viewedIndex = searchHandler.viewedIndex.value;
    final bool isImage = searchHandler.currentFetched[viewedIndex].mediaType.value == MediaType.image;
    // TODO video and gifs support
    // TODO check if item is loaded
    if (viewedIndex < (searchHandler.currentFetched.length - 1)) {
      if (isImage && autoScroll) {
        // print("autoscrolling");
        widget.pageController.jumpToPage(viewedIndex + 1);
      }
    } else {
      autoScrollState(false);
    }
  }

  ////////// Auto Scroll Stuff END ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
  ////////// Toolbar Stuff ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  List<Widget> getActions() {
    List<List<String>> filteredButtonOrder = settingsHandler.buttonOrder.where((btn) {
      if (searchHandler.viewedIndex.value == -1) {
        return false;
      }

      final bool isImageItem = searchHandler.currentFetched[searchHandler.viewedIndex.value].mediaType.value.isImageOrAnimation;
      final bool isScaleButton = btn[0] == 'reloadnoscale';
      final bool isScaleAllowed =
          isScaleButton ? (isImageItem && !settingsHandler.disableImageScaling) : true; // allow reloadnoscale button if not a video and scaling is not disabled

      final bool isFavButton = btn[0] == 'favourite';
      final bool isFavAllowed = isFavButton ? settingsHandler.dbEnabled : true; // allow favourite button if db is enabled

      return isScaleAllowed && isFavAllowed;
    }).toList();

    List<Widget> actions = [];
    List<List<String>> overFlowList = [];
    List<List<String>> buttonList = [];
    // first 4 buttons will show on toolbar
    final int listSplit = (MediaQuery.of(context).size.width / 100).floor();
    // print(MediaQuery.of(context).size.width);
    if (listSplit < filteredButtonOrder.length) {
      overFlowList = filteredButtonOrder.sublist(listSplit);
      buttonList = filteredButtonOrder.sublist(0, listSplit);
    } else {
      buttonList = filteredButtonOrder;
    }
    for (final value in buttonList) {
      final String name = value[0];

      actions.add(
        ToolbarAction(
          key: ValueKey(name),
          icon: buttonIcon(name),
          subIcon: buttonSubicon(name),
          onTap: () async {
            await buttonClick(name);
          },
          onLongTap: () {
            buttonHold(name);
          },
          stackWidget: buttonStackWidget(name),
        ),
      );
    }

    // Debug - print current item info
    // actions.add(IconButton(
    //   icon: Icon(Icons.developer_board),
    //   color: Colors.white,
    //   onPressed: () {
    //     print(searchHandler.viewedItem.value.toJSON().toString());
    //   },
    // ));

    // all buttons after that will be in overflow menu
    if (overFlowList.isNotEmpty) {
      final bool isAutoscrollOverflowed = overFlowList.indexWhere((btn) => btn[0] == 'autoscroll') != -1;

      actions.add(
        PopupMenuButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              if (autoScroll && isAutoscrollOverflowed)
                RestartableProgressIndicator(
                  controller: autoScrollProgressController!,
                ),
              const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          color: Theme.of(context).colorScheme.surface,
          itemBuilder: (BuildContext itemBuilder) => overFlowList.map(
            (value) {
              final String name = value[0];

              return PopupMenuItem(
                padding: const EdgeInsets.all(0),
                value: name,
                child: SizedBox(
                  width: double.infinity, // force button to take full width
                  child: ListTile(
                    onLongPress: () {
                      buttonHold(name);
                    },
                    onTap: () async {
                      Navigator.of(context).pop(); // remove overflow menu
                      await buttonClick(name);
                    },
                    leading: ToolbarAction(
                      key: ValueKey(name),
                      icon: buttonIcon(name),
                      subIcon: buttonSubicon(name),
                      onTap: null,
                      stackWidget: buttonStackWidget(name),
                    ),
                    title: Text(buttonText(value)),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      );
    }
    return actions;
  }

  Widget buttonIcon(String action) {
    late IconData icon;
    switch (action) {
      case 'info':
        icon = Icons.info;
        break;
      case 'open':
        icon = Icons.public;
        break;
      case 'autoscroll':
        icon = autoScroll ? Icons.pause : Icons.play_arrow;
        break;
      case 'snatch':
        icon = Icons.save;
        break;
      case 'favourite':
        // icon = isFav == true ? Icons.favorite : Icons.favorite_border;
        // early return to override with animated icon
        return Obx(() {
          if (searchHandler.viewedIndex.value == -1) {
            return const Icon(Icons.favorite_border);
          }

          final bool? isFav = searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value;
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isFav == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Icon(Icons.favorite),
            secondChild: Icon(isFav == true ? Icons.favorite : (isFav == false ? Icons.favorite_border : CupertinoIcons.heart_slash)),
          );
        });
      case 'share':
        icon = Icons.share;
        break;
      case 'reloadnoscale':
        icon = Icons.refresh;
        break;
    }
    return Icon(icon);
  }

  Widget buttonSubicon(String action) {
    switch (action) {
      case 'snatch':
        return Obx(() {
          if (searchHandler.viewedIndex.value == -1) {
            return Container();
          }

          final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];
          final booru = searchHandler.currentBooru;

          final bool isSnatched = item.isSnatched.value == true;
          if (!isSnatched) {
            return const SizedBox();
          } else {
            return Positioned(
              right: 2,
              bottom: 5,
              child: SnatchedStatusIcon(item: item, booru: booru),
            );
          }
        });

      default:
        return const SizedBox();
    }
  }

  Widget? buttonStackWidget(String name) {
    switch (name) {
      case 'autoscroll':
        if (autoScroll) {
          return RestartableProgressIndicator(
            controller: autoScrollProgressController!,
          );
        }
        break;
      case 'share':
        if (sharedItem != null && shareProgress != 0) {
          return AnimatedProgressIndicator(
            value: shareProgress,
            animationDuration: const Duration(milliseconds: 150),
            indicatorStyle: IndicatorStyle.circular,
            valueColor: Theme.of(context).progressIndicatorTheme.color?.withOpacity(0.66),
            minHeight: 4,
          );
        }
        break;
    }
    return null;
  }

  String buttonText(List<String> actionAndLabel) {
    String action = actionAndLabel[0], defaultLabel = actionAndLabel[1];
    late String label;

    if (searchHandler.viewedIndex.value == -1) {
      return defaultLabel;
    }

    switch (action) {
      case 'autoscroll':
        label = "${autoScroll ? 'Pause' : 'Start'} $defaultLabel";
        break;
      case 'favourite':
        label = searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value == true ? 'Unfavourite' : defaultLabel;
        break;
      case 'reloadnoscale':
        label = searchHandler.currentFetched[searchHandler.viewedIndex.value].isNoScale.value ? 'Reload with scaling' : defaultLabel;
        break;
      default:
        // use default text
        label = defaultLabel;
        break;
    }
    return label;
  }

  Future<void> buttonClick(String action) async {
    switch (action) {
      case 'info':
        widget.onOpenDrawer();
        break;
      case 'open':
        // url to html encoded
        final String url = Uri.encodeFull(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
        ServiceHandler.launchURL(url);
        break;
      case 'autoscroll':
        autoScrollState(!autoScroll);
        break;
      case 'snatch':
        await getPerms();
        // call a function to save the currently viewed image when the save button is pressed
        snatchHandler.queue(
          [searchHandler.currentFetched[searchHandler.viewedIndex.value]],
          searchHandler.currentBooru,
          settingsHandler.snatchCooldown,
          false,
        );
        break;
      case 'favourite':
        await searchHandler.toggleItemFavourite(searchHandler.viewedIndex.value);

        // set viewed item again in case favourites filter is enabled
        WidgetsBinding.instance.addPostFrameCallback((_) {
          searchHandler.setViewedItem(searchHandler.viewedIndex.value);
        });
        break;
      case 'share':
        onShareClick();
        break;
      case 'reloadnoscale':
        searchHandler.currentFetched[searchHandler.viewedIndex.value].isNoScale.toggle();
        break;
    }
  }

  Future<void> buttonHold(String action) async {
    // TODO long press slideshow button to set the timer
    switch (action) {
      case 'share':
        ServiceHandler.vibrate();
        // Ignore share setting on long press
        showShareDialog(showTip: false);
        break;
      case 'snatch':
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

            return SettingsDialog(
              title: const Text('Snatch?'),
              content: Column(
                children: [
                  SelectableText(item.fileURL),
                  const SizedBox(height: 16),
                  if (item.isSnatched.value == true) ...[
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      ),
                      onTap: () async {
                        item.isSnatched.value = false;
                        await settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.local);
                        Navigator.of(context).pop();
                      },
                      leading: const Icon(Icons.file_download_off_outlined),
                      title: const Text('Drop Snatched status'),
                    ),
                    const SizedBox(height: 16),
                  ],
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () async {
                      await getPerms();
                      snatchHandler.queue(
                        [item],
                        searchHandler.currentBooru,
                        settingsHandler.snatchCooldown,
                        true,
                      );
                      Navigator.of(context).pop();
                    },
                    leading: const Icon(Icons.file_download_outlined),
                    title: Text('Snatch ${item.isSnatched.value == true ? '(forced)' : ''}'.trim()),
                  ),
                ],
              ),
            );
          },
        );
        break;
    }
  }

  void onShareClick() {
    final String shareSetting = settingsHandler.shareAction;
    switch (shareSetting) {
      case 'Post URL':
        if (searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL != '') {
          shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: const Text('No Post URL!', style: TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
        break;
      case 'File URL':
        shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].fileURL);
        break;
      case 'Hydrus':
        shareHydrusAction(searchHandler.currentFetched[searchHandler.viewedIndex.value]);
        break;
      case 'File':
        shareFileAction();
        break;
      case 'Ask':
      default:
        showShareDialog();
        break;
    }
  }

  void shareTextAction(String text) {
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: Uri.encodeFull(text)));
      FlashElements.showSnackbar(
        context: context,
        duration: const Duration(seconds: 2),
        title: const Text('Copied to clipboard!', style: TextStyle(fontSize: 20)),
        content: Text(Uri.encodeFull(text), style: const TextStyle(fontSize: 16)),
        leadingIcon: Icons.copy,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler.loadShareTextIntent(text);
    }
  }

  void shareHydrusAction(BooruItem item) {
    if (settingsHandler.hasHydrus) {
      final Booru hydrus = settingsHandler.booruList.where((element) => element.type == BooruType.Hydrus).first;
      final HydrusHandler hydrusHandler = HydrusHandler(hydrus, 10);
      hydrusHandler.addURL(item);
    }
  }

  Future<void> shareFileAction() async {
    final BooruItem item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

    if (sharedItem != null) {
      final dialogRes = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Share File'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Already downloading file for sharing, do you want to abort and share a new file?'),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  height: 150,
                  child: ThumbnailBuild(item: item),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('new');
                },
                child: const Text('Share new'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('abort');
                },
                child: const Text('Abort'),
              ),
            ],
          );
        },
      );

      if (dialogRes == 'new' || dialogRes == 'abort') {
        shareCancelToken?.cancel();
        shareProgress = 0;
        sharedItem = null;
        setState(() {});
        await imageWriter.deleteFileFromCache(item.fileURL, 'media', fileNameExtras: item.fileNameExtras);
      }

      if (dialogRes == 'abort' || dialogRes == null) {
        return;
      }
    }

    String? path = await imageWriter.getCachePath(item.fileURL, 'media', fileNameExtras: item.fileNameExtras);

    // TODO delete from cache after share window closes

    if (path != null) {
      // File is already in cache - share from there
      await ServiceHandler.loadShareFileIntent(path, '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}');
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Loading File...', style: TextStyle(fontSize: 20)),
        content: const Text('This can take some time, please wait...', style: TextStyle(fontSize: 16)),
        overrideLeadingIconWidget: const SizedBox(
          width: 50,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CircularProgressIndicator(),
          ),
        ),
        sideColor: Colors.yellow,
      );

      shareCancelToken?.cancel();
      shareCancelToken = CancelToken();
      shareProgress = 0;
      sharedItem = item;

      final String cacheFilePath = await imageWriter.getCachePathString(
        item.fileURL,
        'media',
        clearName: true,
        fileNameExtras: item.fileNameExtras,
      );
      await DioNetwork.download(
        item.fileURL,
        cacheFilePath,
        cancelToken: shareCancelToken,
        headers: await Tools.getFileCustomHeaders(
          searchHandler.currentBooru,
          checkForReferer: true,
        ),
        onReceiveProgress: (int received, int total) {
          if (total != -1) {
            shareProgress = received / total;
            if ((DateTime.now().millisecondsSinceEpoch - shareProgressLastTick) > 100) {
              setState(() {});
              shareProgressLastTick = DateTime.now().millisecondsSinceEpoch;
            }
          }
        },
      );

      final File cacheFile = File(await imageWriter.getCachePath(item.fileURL, 'media', fileNameExtras: item.fileNameExtras) ?? '');
      if (await cacheFile.exists()) {
        path = cacheFile.path;
        await ServiceHandler.loadShareFileIntent(path, '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}');
      } else {
        FlashElements.showSnackbar(
          context: context,
          title: const Text('Error!', style: TextStyle(fontSize: 20)),
          content: const Text('Something went wrong when saving the File before Sharing', style: TextStyle(fontSize: 16)),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.red,
          sideColor: Colors.red,
        );
      }

      shareProgress = 0;
      shareCancelToken = null;
      sharedItem = null;
      setState(() {});

      // TODO: find a way to detect when share menu was closed, orherwise this is triggered immediately and file is deleted before sending to another app
      // imageWriter.deleteFileFromCache(path, 'media');
    }
  }

  void showShareDialog({bool showTip = true}) {
    // TODO change layout so the buttons set their width automatically, without padding stuff
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('What you want to Share?'),
          contentItems: <Widget>[
            const SizedBox(height: 15),
            Column(
              children: [
                if (searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL != '')
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
                    },
                    leading: const Icon(CupertinoIcons.link),
                    title: const Text('Post URL'),
                  ),
                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].fileURL);
                  },
                  leading: const Icon(CupertinoIcons.link),
                  title: const Text('File URL'),
                ),
                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    shareFileAction();
                  },
                  leading: const Icon(Icons.file_present),
                  title: const Text('File'),
                ),
                const SizedBox(height: 15),
                if (settingsHandler.hasHydrus && searchHandler.currentBooru.type != BooruType.Hydrus)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      shareHydrusAction(searchHandler.currentFetched[searchHandler.viewedIndex.value]);
                    },
                    leading: const Icon(Icons.file_present),
                    title: const Text('Hydrus'),
                  )
                else
                  Container()
              ],
            ),
            const SizedBox(height: 15),
            Text(showTip ? '[Tip]: You can set default action in settings' : ''),
          ],
        );
      },
    );
  }

  ////////// Toolbar Stuff END ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///

  @override
  void initState() {
    super.initState();

    ServiceHandler.setSystemUiVisibility(!settingsHandler.autoHideImageBar);
    viewerHandler.displayAppbar.value = !settingsHandler.autoHideImageBar;

    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      ServiceHandler.setSystemUiVisibility(value);
      setState(() {});
    });

    widget.pageController.addListener(pageListener);

    autoScrollProgressController = TimedProgressController(
      duration: Duration(milliseconds: settingsHandler.galleryAutoScrollTime),
    );
  }

  @override
  void dispose() {
    widget.pageController.removeListener(pageListener);
    autoScrollProgressController?.dispose();
    autoScrollTimer?.cancel();
    appbarListener.cancel();
    ServiceHandler.setSystemUiVisibility(true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear currently loading item from cache to avoid creating broken files
        // TODO move sharing download routine to somewhere in global context?
        shareCancelToken?.cancel();
        if (sharedItem != null) {
          unawaited(
            imageWriter.deleteFileFromCache(
              sharedItem!.fileURL,
              'media',
              fileNameExtras: sharedItem!.fileNameExtras,
            ),
          );
        }
        return true;
      },
      child: SafeArea(
        // to fix height bug when bar on top
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          color: Colors.transparent,
          height: viewerHandler.displayAppbar.value ? widget.defaultHeight : 0.0,
          child: AppBar(
            // toolbarHeight: widget.defaultHeight,
            elevation: 1, // set to zero to disable a shadow behind
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shadowColor: Colors.black54,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              // to ignore icon change
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Obx(() {
                final String formattedViewedIndex = (searchHandler.viewedIndex.value + 1).toString();
                final String formattedTotal = searchHandler.currentFetched.length.toString();
                return Text('$formattedViewedIndex/$formattedTotal', style: const TextStyle(color: Colors.white));
              }),
            ),
            actions: getActions(),
          ),
        ),
      ),
    );
  }
}
