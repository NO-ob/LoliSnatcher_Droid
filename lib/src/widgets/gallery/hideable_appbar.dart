import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:external_video_player_launcher/external_video_player_launcher.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
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

  double get defaultHeight => kToolbarHeight; // 56

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
  bool isOnTop = true;

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
    final disabled = settingsHandler.disabledButtons;
    final List<String> filteredButtonOrder = settingsHandler.buttonOrder.where((name) {
      if (name == 'info') {
        // Info button should always be available
        return true;
      }

      if (disabled.contains(name)) {
        return false;
      }

      if (searchHandler.viewedIndex.value == -1 || searchHandler.currentFetched.isEmpty) {
        return false;
      }

      final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];
      final bool isImage = item.mediaType.value.isImageOrAnimation;
      final bool isVideo = item.mediaType.value.isVideo;

      switch (name) {
        case 'favourite':
          return settingsHandler.dbEnabled;
        case 'reloadnoscale':
          return isImage && !settingsHandler.disableImageScaling;
        case 'toggle_quality':
          return isImage && item.sampleURL != item.fileURL;
        case 'external_player':
          return isVideo && Platform.isAndroid;
      }

      return true;
    }).toList();

    final List<Widget> actions = [];
    List<String> overFlowList = [];
    List<String> buttonList = [];
    // at least first 4 buttons will show on toolbar
    final int listSplit = max(4, (MediaQuery.sizeOf(context).width / 100).floor());
    if (listSplit < filteredButtonOrder.length) {
      overFlowList = filteredButtonOrder.sublist(listSplit);
      buttonList = filteredButtonOrder.sublist(0, listSplit);
    } else {
      buttonList = filteredButtonOrder;
    }
    for (final name in buttonList) {
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
      final bool isAutoscrollOverflowed = overFlowList.indexWhere((btn) => btn == 'autoscroll') != -1;
      final bool isSelectOverflowed = overFlowList.indexWhere((btn) => btn == 'select') != -1;

      final bool isSelected = searchHandler.currentSelected.contains(
        searchHandler.currentFetched[searchHandler.viewedIndex.value],
      );

      actions.add(
        PopupMenuButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              if (autoScroll && isAutoscrollOverflowed)
                RestartableProgressIndicator(
                  controller: autoScrollProgressController!,
                ),
              Row(
                children: [
                  if (isSelected && isSelectOverflowed)
                    const Icon(
                      Icons.check_box,
                      color: Colors.white,
                      size: 18,
                    ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          color: Theme.of(context).colorScheme.surface,
          itemBuilder: (BuildContext itemBuilder) => overFlowList.map(
            (name) {
              return PopupMenuItem(
                padding: EdgeInsets.zero,
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
                      stackWidget: buttonStackWidget(name),
                    ),
                    title: Text(buttonText(name)),
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

    final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

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
          if (searchHandler.viewedIndex.value == -1 || searchHandler.currentFetched.isEmpty) {
            return const Icon(Icons.favorite_border);
          }

          final bool? isFav = item.isFavourite.value;
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isFav == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Icon(Icons.favorite),
            secondChild: Icon(
              isFav == true ? Icons.favorite : (isFav == false ? Icons.favorite_border : CupertinoIcons.heart_slash),
            ),
          );
        });
      case 'share':
        icon = Icons.share;
        break;
      case 'select':
        final int selectedIndex = searchHandler.currentSelected.indexOf(item);
        final bool isSelected = selectedIndex != -1;

        // early return to override custom widget
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 24,
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 24,
                maxHeight: 24,
              ),
              alignment: Alignment.center,
              child: Center(
                child: isSelected
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          maxHeight: 20,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 20),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              (selectedIndex + 1).toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.check_box_outline_blank,
                        size: 24,
                      ),
              ),
            ),
          ],
        );
      case 'reloadnoscale':
        icon = Icons.refresh;
        break;
      case 'toggle_quality':
        final bool isHq = settingsHandler.galleryMode == 'Full Res'
            ? !item.toggleQuality.value
            : item.toggleQuality.value;
        icon = isHq ? Icons.high_quality : Icons.high_quality_outlined;
      case 'external_player':
        icon = Icons.exit_to_app;
        break;
    }
    return Icon(icon);
  }

  Widget buttonSubicon(String action) {
    final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

    switch (action) {
      case 'snatch':
        return Obx(() {
          if (searchHandler.viewedIndex.value == -1 || searchHandler.currentFetched.isEmpty) {
            return const SizedBox.shrink();
          }

          final booru = searchHandler.currentBooru;

          final bool isSnatched = item.isSnatched.value == true;
          if (!isSnatched) {
            return const SizedBox.shrink();
          } else {
            return Positioned(
              right: 2,
              bottom: 5,
              child: SnatchedStatusIcon(item: item, booru: booru),
            );
          }
        });

      default:
        return const SizedBox.shrink();
    }
  }

  Widget? buttonStackWidget(String name) {
    switch (name) {
      case 'snatch':
        if (searchHandler.viewedIndex.value == -1 || searchHandler.currentFetched.isEmpty) {
          return null;
        }

        final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];
        final bool isBeingSnatched =
            snatchHandler.current.value?.booruItems[snatchHandler.queueProgress.value] == item &&
            snatchHandler.total.value != 0;
        if (!isBeingSnatched) {
          return null;
        } else {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: AnimatedProgressIndicator(
              value: snatchHandler.currentProgress,
              animationDuration: const Duration(milliseconds: 50),
              indicatorStyle: IndicatorStyle.circular,
              valueColor: Theme.of(context).progressIndicatorTheme.color?.withValues(alpha: 0.66),
              minHeight: 4,
            ),
          );
        }
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
            animationDuration: const Duration(milliseconds: 50),
            indicatorStyle: IndicatorStyle.circular,
            valueColor: Theme.of(context).progressIndicatorTheme.color?.withValues(alpha: 0.66),
            minHeight: 4,
          );
        }
        break;
    }
    return null;
  }

  String buttonText(String name) {
    final String defaultLabel = SettingsHandler.buttonNames[name] ?? '';
    late String label;

    if (searchHandler.viewedIndex.value == -1) {
      return defaultLabel;
    }

    final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

    switch (name) {
      case 'autoscroll':
        label = "${autoScroll ? 'Pause' : 'Start'} $defaultLabel";
        break;
      case 'favourite':
        label = item.isFavourite.value == true ? 'Unfavourite' : defaultLabel;
        break;
      case 'select':
        final bool isSelected = searchHandler.currentSelected.contains(item);
        label = isSelected ? 'Deselect' : defaultLabel;
        break;
      case 'reloadnoscale':
        label = item.isNoScale.value ? 'Reload with scaling' : defaultLabel;
        break;
      case 'toggle_quality':
        final bool isHq = settingsHandler.galleryMode == 'Full Res'
            ? !item.toggleQuality.value
            : item.toggleQuality.value;
        label = isHq ? 'Load Sample Quality' : 'Load High Quality';
        break;
      default:
        // use default text
        label = defaultLabel;
        break;
    }
    return label;
  }

  Future<void> buttonClick(String action) async {
    final item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

    switch (action) {
      case 'info':
        widget.onOpenDrawer();
        break;
      case 'open':
        // url to html encoded
        final String url = Uri.encodeFull(item.postURL);
        unawaited(
          launchUrlString(
            url,
            mode: LaunchMode.externalApplication,
          ),
        );
        break;
      case 'autoscroll':
        autoScrollState(!autoScroll);
        break;
      case 'snatch':
        if (!await setPermissions()) return;

        // call a function to save the currently viewed image when the save button is pressed
        snatchHandler.queue(
          [item],
          searchHandler.currentBooru,
          settingsHandler.snatchCooldown,
          false,
        );
        if (settingsHandler.favouriteOnSnatch) {
          await searchHandler.toggleItemFavourite(
            searchHandler.viewedIndex.value,
            forcedValue: true,
            skipSnatching: true,
          );
        }
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
      case 'select':
        final bool isSelected = searchHandler.currentSelected.contains(item);
        if (isSelected) {
          searchHandler.currentTab.selected.remove(item);
        } else {
          searchHandler.currentTab.selected.add(item);
        }
        break;
      case 'reloadnoscale':
        item.isNoScale.toggle();
        break;
      case 'toggle_quality':
        item.toggleQuality.toggle();
        break;
      case 'external_player':
        ExternalVideoPlayerLauncher.launchOtherPlayer(item.fileURL, MIME.video, null);
        break;
    }
  }

  Future<void> buttonHold(String action) async {
    // TODO long press slideshow button to set the timer
    switch (action) {
      case 'share':
        await ServiceHandler.vibrate();
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
                  if (item.isSnatched.value != null)
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      ),
                      onTap: () async {
                        item.isSnatched.value = !item.isSnatched.value!;
                        await settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.local);
                        Navigator.of(context).pop();
                      },
                      leading: item.isSnatched.value == true ? const Icon(Icons.clear) : const Icon(Icons.check),
                      title: item.isSnatched.value == true
                          ? const Text('Drop snatched status')
                          : const Text('Set snatched status'),
                    ),
                  //
                  const SizedBox(height: 16),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () async {
                      if (!await setPermissions()) return;

                      snatchHandler.queue(
                        [item],
                        searchHandler.currentBooru,
                        settingsHandler.snatchCooldown,
                        true,
                      );
                      if (settingsHandler.favouriteOnSnatch) {
                        await searchHandler.toggleItemFavourite(
                          searchHandler.viewedIndex.value,
                          forcedValue: true,
                          skipSnatching: true,
                        );
                      }
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
    if (SettingsHandler.isDesktopPlatform) {
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

  Future<void> shareHydrusAction(BooruItem item) async {
    if (settingsHandler.hasHydrus) {
      final Booru? hydrus = settingsHandler.booruList.firstWhereOrNull((element) => element.type?.isHydrus == true);
      if (hydrus == null) return;
      final HydrusHandler hydrusHandler = HydrusHandler(hydrus, 10);

      final res = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hydrus Share'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Which URL you want to share to Hydrus?'),
                const SizedBox(height: 12),
                ListTile(
                  title: const Text('Post URL'),
                  leading: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop('post');
                  },
                ),
                ListTile(
                  title: const Text('File URL'),
                  leading: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop('file');
                  },
                ),
                ListTile(
                  title: const Text('Cancel'),
                  leading: const Icon(Icons.cancel_outlined),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );

      if (res == null) {
        return;
      }

      await hydrusHandler.addURL(item, usePostUrl: res == 'post');
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Hydrus is not configured!', style: TextStyle(fontSize: 20)),
      );
    }
  }

  Future<void> shareFileAction() async {
    final BooruItem item = searchHandler.currentFetched[searchHandler.viewedIndex.value];

    final bool alreadyLoading = sharedItem != null;
    final bool alreadyLoadingSame = alreadyLoading && sharedItem == item;

    if (alreadyLoading) {
      final double thumbWidth = MediaQuery.sizeOf(context).shortestSide * (alreadyLoadingSame ? 0.3 : 0.2);
      final double thumbHeight = thumbWidth / 9 * 16;

      final dialogRes = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Share File'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (alreadyLoadingSame)
                  const Text('Already downloading this file for sharing, do you want to abort?')
                else
                  const Text(
                    'Already downloading file for sharing, do you want to abort current file and share a new file?',
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        if (!alreadyLoadingSame) const Text('Current:'),
                        SizedBox(
                          width: thumbWidth,
                          height: thumbHeight,
                          child: ThumbnailBuild(
                            item: sharedItem!,
                            booru: searchHandler.currentBooru,
                            selectable: false,
                          ),
                        ),
                      ],
                    ),
                    if (!alreadyLoadingSame) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          const Text('New:'),
                          SizedBox(
                            width: thumbWidth,
                            height: thumbHeight,
                            child: ThumbnailBuild(
                              item: item,
                              booru: searchHandler.currentBooru,
                              selectable: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ],
            ),
            actions: [
              if (!alreadyLoadingSame)
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
      await ServiceHandler.loadShareFileIntent(
        path,
        '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}',
      );
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
          item: item,
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

      final File cacheFile = File(
        await imageWriter.getCachePath(item.fileURL, 'media', fileNameExtras: item.fileNameExtras) ?? '',
      );
      if (await cacheFile.exists()) {
        path = cacheFile.path;
        await ServiceHandler.loadShareFileIntent(
          path,
          '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}',
        );
      } else {
        FlashElements.showSnackbar(
          context: context,
          title: const Text('Error!', style: TextStyle(fontSize: 20)),
          content: const Text(
            'Something went wrong when saving the File before Sharing',
            style: TextStyle(fontSize: 16),
          ),
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
          contentItems: [
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
                if (settingsHandler.hasHydrus && searchHandler.currentBooru.type?.isHydrus != true)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () async {
                      await shareHydrusAction(searchHandler.currentFetched[searchHandler.viewedIndex.value]);
                      Navigator.of(context).pop();
                    },
                    leading: const Icon(Icons.file_present),
                    title: const Text('Hydrus'),
                  ),
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

    isOnTop = settingsHandler.galleryBarPosition == 'Top';

    ServiceHandler.setSystemUiVisibility(!settingsHandler.autoHideImageBar);
    viewerHandler.displayAppbar.value = !settingsHandler.autoHideImageBar;

    viewerHandler.displayAppbar.addListener(appbarListener);

    widget.pageController.addListener(pageListener);

    autoScrollProgressController = TimedProgressController(
      duration: Duration(milliseconds: settingsHandler.galleryAutoScrollTime),
    );
  }

  void appbarListener() {
    ServiceHandler.setSystemUiVisibility(viewerHandler.displayAppbar.value);
    setState(() {});
  }

  @override
  void dispose() {
    widget.pageController.removeListener(pageListener);
    autoScrollProgressController?.dispose();
    autoScrollTimer?.cancel();
    viewerHandler.displayAppbar.removeListener(appbarListener);
    ServiceHandler.setSystemUiVisibility(true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double extraPadding = isOnTop ? 0 : MediaQuery.paddingOf(context).bottom;

    return PopScope(
      onPopInvokedWithResult: (bool didPop, _) {
        // clear currently loading item from cache to avoid creating broken files
        // TODO move sharing download routine to somewhere in global context?
        shareCancelToken?.cancel();
        if (sharedItem != null) {
          imageWriter.deleteFileFromCache(
            sharedItem!.fileURL,
            'media',
            fileNameExtras: sharedItem!.fileNameExtras,
          );
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black54,
        surfaceTintColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          color: Colors.transparent,
          height: viewerHandler.displayAppbar.value ? (isOnTop ? null : (widget.defaultHeight + extraPadding)) : 0,
          padding: isOnTop ? null : EdgeInsets.only(bottom: extraPadding),
          child: Obx(
            () => AppBar(
              // toolbarHeight: widget.defaultHeight,
              elevation: searchHandler.viewedIndex.value == 0
                  ? 0
                  : 0, // hack to force restate to rebuild actions // set to zero to disable a shadow behind
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
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
                  return Text(
                    '$formattedViewedIndex/$formattedTotal',
                    style: const TextStyle(color: Colors.white),
                  );
                }),
              ),
              actions: getActions(),
            ),
          ),
        ),
      ),
    );
  }
}
