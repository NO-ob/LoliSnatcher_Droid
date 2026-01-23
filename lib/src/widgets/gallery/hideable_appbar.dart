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
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/timed_progress_controller.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/restartable_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/gallery/image_search_dialog.dart';
import 'package:lolisnatcher/src/widgets/gallery/snatched_status_icon.dart';
import 'package:lolisnatcher/src/widgets/gallery/toolbar_action.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

// TODO decouple share and autoscroll stuff into separate widgets

class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HideableAppBar({
    required this.tab,
    required this.pageController,
    this.canSelect = true,
    this.onOpenDrawer,
    super.key,
  });

  final SearchTab tab;
  final PreloadPageController pageController;
  final bool canSelect;
  final VoidCallback? onOpenDrawer;

  double get defaultHeight => kToolbarHeight; // 56

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  State<HideableAppBar> createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  final ValueNotifier<int> page = ValueNotifier(0);

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
    final bool isNotLastPage = (page.value + 1) < widget.tab.booruHandler.filteredFetched.length;
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
            title: Text(context.loc.viewer.appBar.cantStartSlideshow, style: const TextStyle(fontSize: 20)),
            content: Text(context.loc.viewer.appBar.reachedLastLoadedItem, style: const TextStyle(fontSize: 16)),
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
    page.value = widget.pageController.page?.round() ?? 0;
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
    final int viewedIndex = page.value;
    final bool isImage = widget.tab.booruHandler.filteredFetched[viewedIndex].mediaType.value.isImage;
    // TODO video and gifs support
    // TODO check if item is loaded
    if (viewedIndex < (widget.tab.booruHandler.filteredFetched.length - 1)) {
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
      if (page.value == -1 || widget.tab.booruHandler.filteredFetched.isEmpty) {
        return false;
      }

      if (name == 'info') {
        // Info button should always be available (if onOpenDrawer is present)
        return widget.onOpenDrawer != null;
      }

      if (disabled.contains(name)) {
        return false;
      }

      final item = widget.tab.booruHandler.filteredFetched[page.value];
      final bool isImage = item.mediaType.value.isImageOrAnimation;
      final bool isVideo = item.mediaType.value.isVideo;

      switch (name) {
        case 'favourite':
          return settingsHandler.dbEnabled;
        case 'reloadnoscale':
          return isImage && !settingsHandler.disableImageScaling;
        case 'toggle_quality':
          return isImage && item.sampleURL != item.fileURL;
        case 'select':
          return widget.canSelect;
        case 'external_player':
          return isVideo && Platform.isAndroid;
        case 'image_search':
          return isImage;
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

      final bool isSelected = widget.tab.selected.contains(
        widget.tab.booruHandler.filteredFetched[page.value],
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

    final item = widget.tab.booruHandler.filteredFetched[page.value];

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
          if (page.value == -1 || widget.tab.booruHandler.filteredFetched.isEmpty) {
            return const Icon(CupertinoIcons.heart_slash);
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
        return Obx(() {
          final int selectedIndex = widget.tab.selected.indexOf(item);
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
        });
      case 'reloadnoscale':
        icon = Icons.refresh;
        break;
      case 'toggle_quality':
        final bool isHq = settingsHandler.galleryMode.isFullRes ? !item.toggleQuality.value : item.toggleQuality.value;
        icon = isHq ? Icons.high_quality : Icons.high_quality_outlined;
      case 'external_player':
        icon = Icons.exit_to_app;
        break;
      case 'image_search':
        icon = Icons.image_search_rounded;
        break;
    }
    return Icon(icon);
  }

  Widget buttonSubicon(String action) {
    final item = widget.tab.booruHandler.filteredFetched[page.value];

    switch (action) {
      case 'snatch':
        return Obx(() {
          if (page.value == -1 || widget.tab.booruHandler.filteredFetched.isEmpty) {
            return const SizedBox.shrink();
          }

          final booru = widget.tab.booruHandler.booru;

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
        if (page.value == -1 || widget.tab.booruHandler.filteredFetched.isEmpty) {
          return null;
        }

        final item = widget.tab.booruHandler.filteredFetched[page.value];
        return Obx(() {
          final bool isBeingSnatched =
              snatchHandler.current.value?.booruItems[snatchHandler.queueProgress.value] == item &&
              snatchHandler.total.value != 0;

          if (!isBeingSnatched) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.all(2),
            child: Obx(
              () => AnimatedProgressIndicator(
                value: snatchHandler.currentProgress,
                animationDuration: const Duration(milliseconds: 50),
                indicatorStyle: IndicatorStyle.circular,
                valueColor: Theme.of(context).progressIndicatorTheme.color?.withValues(alpha: 0.66),
                minHeight: 4,
              ),
            ),
          );
        });
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

    if (page.value == -1) {
      return defaultLabel;
    }

    final item = widget.tab.booruHandler.filteredFetched[page.value];

    switch (name) {
      case 'autoscroll':
        label = '${autoScroll ? context.loc.viewer.appBar.pause : context.loc.viewer.appBar.start} $defaultLabel';
        break;
      case 'favourite':
        label = item.isFavourite.value == true ? context.loc.viewer.appBar.unfavourite : defaultLabel;
        break;
      case 'select':
        final bool isSelected = widget.tab.selected.contains(item);
        label = isSelected ? context.loc.viewer.appBar.deselect : defaultLabel;
        break;
      case 'reloadnoscale':
        label = item.isNoScale.value ? context.loc.viewer.appBar.reloadWithScaling : defaultLabel;
        break;
      case 'toggle_quality':
        final bool isHq = settingsHandler.galleryMode.isFullRes ? !item.toggleQuality.value : item.toggleQuality.value;
        label = isHq ? context.loc.viewer.appBar.loadSampleQuality : context.loc.viewer.appBar.loadHighQuality;
        break;
      default:
        // use default text
        label = defaultLabel;
        break;
    }
    return label;
  }

  Future<void> buttonClick(String action) async {
    final item = widget.tab.booruHandler.filteredFetched[page.value];

    switch (action) {
      case 'info':
        widget.onOpenDrawer?.call();
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
          widget.tab.booruHandler.booru,
          settingsHandler.snatchCooldown,
          false,
        );
        if (settingsHandler.favouriteOnSnatch) {
          await widget.tab.toggleItemFavourite(
            page.value,
            forcedValue: true,
            skipSnatching: true,
          );
        }
        break;
      case 'favourite':
        await widget.tab.toggleItemFavourite(page.value);

        // set viewed item again in case favourites filter is enabled
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Future.delayed(const Duration(seconds: 1));
          viewerHandler.setCurrent(widget.tab.booruHandler.filteredFetched[page.value]);
        });
        break;
      case 'share':
        await onShareClick();
        break;
      case 'select':
        final bool isSelected = widget.tab.selected.contains(item);
        if (isSelected) {
          widget.tab.selected.remove(item);
        } else {
          widget.tab.selected.add(item);
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
      case 'image_search':
        await showImageSearchDialog(context, item);
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
            final item = widget.tab.booruHandler.filteredFetched[page.value];

            return SettingsDialog(
              title: Text(context.loc.gallery.snatchQuestion),
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
                          ? Text(context.loc.viewer.appBar.dropSnatchedStatus)
                          : Text(context.loc.viewer.appBar.setSnatchedStatus),
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
                        widget.tab.booruHandler.booru,
                        settingsHandler.snatchCooldown,
                        true,
                      );
                      if (settingsHandler.favouriteOnSnatch) {
                        await widget.tab.toggleItemFavourite(
                          page.value,
                          forcedValue: true,
                          skipSnatching: true,
                        );
                      }
                      Navigator.of(context).pop();
                    },
                    leading: const Icon(Icons.file_download_outlined),
                    title: Text(
                      '${context.loc.viewer.appBar.snatch} ${item.isSnatched.value == true ? context.loc.viewer.appBar.forced : ''}'
                          .trim(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
        break;
    }
  }

  Future<void> onShareClick() async {
    final shareSetting = settingsHandler.shareAction;
    final item = widget.tab.booruHandler.filteredFetched[page.value];

    switch (shareSetting) {
      case .postUrl:
        if (item.postURL.isEmpty) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(context.loc.gallery.noPostUrl, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        shareTextAction(item.postURL);
        break;
      case .postUrlWithTags:
        if (item.postURL.isEmpty) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(context.loc.gallery.noPostUrl, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        final tags = await showSelectTagsDialog(context, item.tagsList);
        if (tags.isNotEmpty) {
          shareTextAction('${item.postURL} \n ${tags.join(' ')}');
        } else {
          shareTextAction(item.postURL);
        }
        break;
      case .fileUrl:
        shareTextAction(item.fileURL);
        break;
      case .fileUrlWithTags:
        final tags = await showSelectTagsDialog(context, item.tagsList);
        if (tags.isNotEmpty) {
          shareTextAction('${item.fileURL} \n ${tags.join(' ')}');
        } else {
          shareTextAction(item.fileURL);
        }
        break;
      case .file:
        await shareFileAction();
        break;
      case .fileWithTags:
        final tags = await showSelectTagsDialog(context, item.tagsList);
        if (tags.isNotEmpty) {
          await shareFileAction(text: tags.join(' '));
        } else {
          await shareFileAction();
        }
        break;
      case .hydrus:
        await shareHydrusAction(item);
        break;
      case .ask:
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
        title: Text(context.loc.copiedToClipboard, style: const TextStyle(fontSize: 20)),
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
            title: Text(context.loc.viewer.appBar.hydrusShare),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.loc.viewer.appBar.whichUrlToShareToHydrus),
                const SizedBox(height: 12),
                ListTile(
                  title: Text(context.loc.viewer.appBar.postURL),
                  leading: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop('post');
                  },
                ),
                ListTile(
                  title: Text(context.loc.viewer.appBar.fileURL),
                  leading: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop('file');
                  },
                ),
                ListTile(
                  title: Text(context.loc.cancel),
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
        title: Text(context.loc.viewer.appBar.hydrusNotConfigured, style: const TextStyle(fontSize: 20)),
      );
    }
  }

  Future<void> shareFileAction({String? text}) async {
    final BooruItem item = widget.tab.booruHandler.filteredFetched[page.value];

    final bool alreadyLoading = sharedItem != null;
    final bool alreadyLoadingSame = alreadyLoading && sharedItem == item;

    if (alreadyLoading) {
      final double thumbWidth = MediaQuery.sizeOf(context).shortestSide * (alreadyLoadingSame ? 0.3 : 0.2);
      final double thumbHeight = thumbWidth / 9 * 16;

      final dialogRes = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(context.loc.viewer.appBar.shareFile),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (alreadyLoadingSame)
                  Text(context.loc.viewer.appBar.alreadyDownloadingThisFile)
                else
                  Text(
                    context.loc.viewer.appBar.alreadyDownloadingFile,
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        if (!alreadyLoadingSame) Text(context.loc.viewer.appBar.current),
                        SizedBox(
                          width: thumbWidth,
                          height: thumbHeight,
                          child: ThumbnailBuild(
                            item: sharedItem!,
                            handler: widget.tab.booruHandler,
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
                          Text(context.loc.viewer.appBar.kNew),
                          SizedBox(
                            width: thumbWidth,
                            height: thumbHeight,
                            child: ThumbnailBuild(
                              item: item,
                              handler: widget.tab.booruHandler,
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
                  child: Text(context.loc.viewer.appBar.shareNew),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('abort');
                },
                child: Text(context.loc.viewer.appBar.abort),
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
      if (Platform.isAndroid) {
        // File is already in cache - share from there
        await ServiceHandler.loadShareFileIntent(
          path,
          '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}',
          text: text,
        );
      }
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      FlashElements.showSnackbar(
        context: context,
        title: Text(context.loc.gallery.loadingFile, style: const TextStyle(fontSize: 20)),
        content: Text(context.loc.gallery.loadingFileMessage, style: const TextStyle(fontSize: 16)),
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
          widget.tab.booruHandler.booru,
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
        if (Platform.isAndroid) {
          await ServiceHandler.loadShareFileIntent(
            path,
            '${item.mediaType.value.isVideo ? 'video' : 'image'}/${item.fileExt!}',
            text: text,
          );
        }
      } else {
        FlashElements.showSnackbar(
          context: context,
          title: Text(context.loc.viewer.appBar.error, style: const TextStyle(fontSize: 20)),
          content: Text(
            context.loc.viewer.appBar.savingFileError,
            style: const TextStyle(fontSize: 16),
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
    final item = widget.tab.booruHandler.filteredFetched[page.value];

    // TODO change layout so the buttons set their width automatically, without padding stuff
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text(context.loc.viewer.appBar.whatToShare),
          contentItems: [
            const SizedBox(height: 15),
            Column(
              children: [
                if (item.postURL.isNotEmpty) ...[
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: settingsHandler.shareAction.isPostUrl ? 3 : 1,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      shareTextAction(item.postURL);
                    },
                    leading: const Icon(CupertinoIcons.link),
                    title: Text(context.loc.viewer.appBar.postURL),
                  ),

                  const SizedBox(height: 15),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: settingsHandler.shareAction.isPostUrlWithTags ? 3 : 1,
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      final tags = await showSelectTagsDialog(context, item.tagsList);
                      if (tags.isNotEmpty) {
                        shareTextAction('${item.postURL} \n ${tags.join(' ')}');
                      } else {
                        shareTextAction(item.postURL);
                      }
                    },
                    leading: const Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(CupertinoIcons.link),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: Icon(CupertinoIcons.tag, size: 14),
                        ),
                      ],
                    ),
                    title: Text(context.loc.viewer.appBar.postURLWithTags),
                  ),
                  const SizedBox(height: 15),
                ],
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: settingsHandler.shareAction.isFileUrl ? 3 : 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    shareTextAction(item.fileURL);
                  },
                  leading: const Icon(CupertinoIcons.link),
                  title: Text(context.loc.viewer.appBar.fileURL),
                ),
                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: settingsHandler.shareAction.isFileUrlWithTags ? 3 : 1,
                    ),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final tags = await showSelectTagsDialog(context, item.tagsList);
                    if (tags.isNotEmpty) {
                      shareTextAction('${item.fileURL} \n ${tags.join(' ')}');
                    } else {
                      shareTextAction(item.fileURL);
                    }
                  },
                  leading: const Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(CupertinoIcons.link),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Icon(CupertinoIcons.tag, size: 14),
                      ),
                    ],
                  ),
                  title: Text(context.loc.viewer.appBar.fileURLWithTags),
                ),
                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: settingsHandler.shareAction.isFile ? 3 : 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    shareFileAction();
                  },
                  leading: const Icon(Icons.file_present),
                  title: Text(context.loc.viewer.appBar.file),
                ),
                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: settingsHandler.shareAction.isFileWithTags ? 3 : 1,
                    ),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final tags = await showSelectTagsDialog(context, item.tagsList);
                    if (tags.isNotEmpty) {
                      await shareFileAction(text: tags.join(' '));
                    } else {
                      await shareFileAction();
                    }
                  },
                  leading: const Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.file_present),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Icon(CupertinoIcons.tag, size: 14),
                      ),
                    ],
                  ),
                  title: Text(context.loc.viewer.appBar.fileWithTags),
                ),
                const SizedBox(height: 15),
                if (settingsHandler.hasHydrus && widget.tab.booruHandler.booru.type?.isHydrus != true)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: settingsHandler.shareAction.isHydrus ? 3 : 1,
                      ),
                    ),
                    onTap: () async {
                      await shareHydrusAction(item);
                      Navigator.of(context).pop();
                    },
                    leading: const Icon(Icons.file_present),
                    title: Text(context.loc.viewer.appBar.hydrus),
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

    isOnTop = settingsHandler.galleryBarPosition.isTop;

    ServiceHandler.setSystemUiVisibility(!settingsHandler.autoHideImageBar);
    viewerHandler.displayAppbar.value = !settingsHandler.autoHideImageBar;

    viewerHandler.displayAppbar.addListener(appbarListener);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => pageListener(),
    );
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
          child: ValueListenableBuilder(
            valueListenable: page,
            builder: (context, page, _) {
              return AppBar(
                // toolbarHeight: widget.defaultHeight,
                elevation: 0,
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
                  child: ValueListenableBuilder(
                    valueListenable: widget.tab.booruHandler.filteredFetched,
                    builder: (_, fetched, _) {
                      final String formattedViewedIndex = (page + 1).toString();
                      final String formattedTotal = fetched.length.toString();
                      return Text(
                        '$formattedViewedIndex/$formattedTotal',
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                actions: getActions(),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<List<String>> showSelectTagsDialog(
  BuildContext context,
  List<Tag> tags,
) async {
  if (tags.isEmpty) return [];

  tags = tags.where((t) => t.fullString.trim().isNotEmpty).toList();

  final tagHandler = TagHandler.instance;

  final Map<TagType, List<Tag>> tagMap = {
    for (final type in TagType.values) type: [],
  };
  for (final t in tags) {
    final tag = tagHandler.getTag(t.fullString);
    tagMap[tag.tagType]?.add(tag);
  }
  final List<Tag> items = tagMap.values.expand((i) => i).toList();

  final List<Tag> selectedTags = [];
  final res = await LoliMultiselectDropdown(
    value: selectedTags,
    onChanged: (value) {
      selectedTags.clear();
      selectedTags.addAll(value);
    },
    expandableByScroll: false,
    items: items,
    itemBuilder: (item) => Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
      ),
      constraints: const BoxConstraints(
        minHeight: kMinInteractiveDimension,
      ),
      alignment: Alignment.centerLeft,
      child: Builder(
        builder: (context) {
          final color = item.getColour();
          return Text(
            item.fullString,
            style: TextStyle(
              color: color,
              backgroundColor: color?.withValues(alpha: 0.1),
            ),
          );
        },
      ),
    ),
    selectedItemBuilder: (items) => Text(items.join(', ')),
    labelText: context.loc.viewer.appBar.selectTags,
  ).showDialog(context);

  if (res) {
    return selectedTags.map((t) => t.fullString).toList();
  }

  return [];
}
