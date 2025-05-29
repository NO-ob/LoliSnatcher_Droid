import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart' hide FirstWhereOrNullExt;

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/pages/settings/logger_page.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/pages/snatcher_page.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/mascot_image.dart';
import 'package:lolisnatcher/src/widgets/common/retry_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/media_previews.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_bottom_bar.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_buttons.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_secondary_booru_selector.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;

  final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

  bool isDrawerOpened = false;

  void _toggleDrawer(InnerDrawerDirection? direction) {
    searchHandler.mainDrawerKey.currentState?.toggle(
      // if not set, the last direction will be used
      //InnerDrawerDirection.start OR InnerDrawerDirection.end
      direction: direction,
    );
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    final result = await _onBackPressed();
    if (result) {
      if (Platform.isAndroid) {
        // will close the app completely
        await SystemNavigator.pop();
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  Future<bool> _onBackPressed() async {
    if (isDrawerOpened) {
      // close the drawer if it's opened
      _toggleDrawer(null);
      return false;
    }

    // ... otherwise, ask to close the app
    final bool? shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('Are you sure?'),
          contentItems: const [
            Text('Do you want to exit the App?'),
          ],
          actionButtons: [
            ElevatedButton.icon(
              icon: const Icon(Icons.cancel),
              label: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton.icon(
              label: const Text('Yes'),
              icon: const Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! main build !!!');

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return InnerDrawer(
          key: searchHandler.mainDrawerKey,
          onTapClose: true,
          swipe: true,
          swipeChild: true,

          //When setting the vertical offset, be sure to use only top or bottom
          offset: IDOffset.only(
            bottom: 0,
            right: orientation == Orientation.landscape ? 0 : 0.5,
            left: orientation == Orientation.landscape ? 0 : 0.5,
          ),
          scale: const IDOffset.horizontal(1),

          proportionalChildArea: true,
          borderRadius: 10,
          leftAnimationType: InnerDrawerAnimation.quadratic,
          rightAnimationType: InnerDrawerAnimation.quadratic,
          backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),

          //when a pointer that is in contact with the screen and moves to the right or left
          onDragUpdate: (double val, InnerDrawerDirection? direction) {
            // return values between 1 and 0
            // print(val);
            // check if the swipe is to the right or to the left
            // print(direction==InnerDrawerDirection.start);
          },

          innerDrawerCallback: (bool isOpen, InnerDrawerDirection? direction) {
            // print('$isOpen $direction');
            isDrawerOpened = isOpen;
          }, // return  true (open) or false (close)

          leftChild: settingsHandler.handSide.value.isLeft
              ? const MainDrawer()
              : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),
          rightChild: settingsHandler.handSide.value.isRight
              ? const MainDrawer()
              : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),

          // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
          scaffold: Scaffold(
            key: mainScaffoldKey,
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: SafeArea(
              top: false,
              bottom: false,
              child: PopScope(
                canPop: false,
                onPopInvokedWithResult: _onPopInvoked,
                child: const RepaintBoundary(child: MediaPreviews()),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    // print('build drawer');

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Obx(() {
                if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                  return Container(
                    height: MainSearchBar.height,
                    margin: const EdgeInsets.fromLTRB(2, 24, 2, 12),
                    child: const MainSearchBarWithActions('drawer'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const TabSelector(),
              Expanded(
                child: ListView(
                  controller:
                      ScrollController(), // needed to avoid exception when list overflows into a scrollable size
                  clipBehavior: Clip.antiAlias,
                  children: [
                    const SizedBox(height: 12),
                    const TabButtons(true, WrapAlignment.spaceEvenly),
                    const SizedBox(height: 12),
                    const MergeBooruToggleAndSelector(),
                    //
                    Obx(() {
                      if (settingsHandler.isDebug.value) {
                        return SettingsButton(
                          name: 'Open Alice',
                          icon: const Icon(Icons.developer_board),
                          action: () {
                            settingsHandler.alice.showInspector();
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    //
                    Obx(() {
                      if ((settingsHandler.isDebug.value || EnvironmentConfig.isTesting) &&
                          settingsHandler.enabledLogTypes.isNotEmpty) {
                        return SettingsButton(
                          name: 'Open Logger',
                          icon: const Icon(Icons.print),
                          action: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => LoggerViewPage(talker: Logger.talker),
                              ),
                            );
                          },
                          drawTopBorder: true,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    ValueListenableBuilder(
                      valueListenable: LocalAuthHandler.instance.deviceSupportsBiometrics,
                      builder: (_, deviceSupportsBiometrics, __) => ValueListenableBuilder(
                        valueListenable: SettingsHandler.instance.useLockscreen,
                        builder: (_, useLockscreen, child) {
                          if (deviceSupportsBiometrics && useLockscreen) {
                            return child!;
                          }

                          return const SizedBox.shrink();
                        },
                        child: SettingsButton(
                          name: 'Lock app',
                          icon: const Icon(Icons.lock),
                          action: () => LocalAuthHandler.instance.lock(manually: true),
                        ),
                      ),
                    ),
                    SettingsButton(
                      name: 'Settings',
                      icon: const Icon(Icons.settings),
                      page: () => const SettingsPage(),
                    ),
                    Obx(() {
                      if (settingsHandler.booruList.isNotEmpty &&
                          searchHandler.list.isNotEmpty &&
                          BooruType.saveable.contains(searchHandler.currentBooru.type) &&
                          Tools.isOnPlatformWithWebviewSupport) {
                        return SettingsButton(
                          name: 'Open webview',
                          icon: const Icon(Icons.public),
                          action: () {
                            final String? url = searchHandler.currentBooru.baseURL;
                            final String userAgent = Tools.browserUserAgent;
                            if (url == null || url.isEmpty) {
                              return;
                            }

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InAppWebviewView(
                                  initialUrl: url,
                                  userAgent: userAgent,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    if (kDebugMode)
                      SettingsToggle(
                        value: settingsHandler.blurImages,
                        onChanged: (newValue) {
                          settingsHandler.blurImages = newValue;
                          searchHandler.rootRestate?.call();
                        },
                        title: 'Blur [DEV]',
                      ),
                    //
                    Obx(() {
                      if (settingsHandler.updateInfo.value != null &&
                          Constants.appBuildNumber < (settingsHandler.updateInfo.value!.buildNumber)) {
                        return SettingsButton(
                          name: 'Update Available!',
                          icon: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Icon(Icons.update),
                              Positioned(
                                top: 1,
                                left: 1,
                                child: Center(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          action: () async {
                            settingsHandler.showUpdate(true);
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    if (SettingsHandler.isDesktopPlatform)
                      SettingsButton(
                        name: 'Close the app',
                        icon: const Icon(Icons.exit_to_app),
                        action: () async {
                          // twice to trigger drawer close
                          await Navigator.of(context).maybePop();
                          await Future.delayed(const Duration(milliseconds: 400));
                          await Navigator.of(context).maybePop();
                        },
                      ),
                    //
                    if (settingsHandler.enableDrawerMascot) const MascotImage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadsDrawer extends StatefulWidget {
  const DownloadsDrawer({
    required this.toggleDrawer,
    super.key,
  });

  final void Function() toggleDrawer;

  @override
  State<DownloadsDrawer> createState() => _DownloadsDrawerState();
}

class _DownloadsDrawerState extends State<DownloadsDrawer> {
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  bool updating = false;

  Future<void> onStartSnatching(BuildContext context, bool isLongTap) async {
    final bool permsRes = await getPerms();
    if (!permsRes) {
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Please provide Storage permissions', style: TextStyle(fontSize: 20)),
        leadingIcon: Icons.warning,
        sideColor: Colors.red,
        leadingIconColor: Colors.red,
      );
      return;
    }

    if (searchHandler.currentSelected.isNotEmpty) {
      snatchHandler.queue(
        [...searchHandler.currentSelected],
        searchHandler.currentBooru,
        settingsHandler.snatchCooldown,
        isLongTap,
      );
      if (settingsHandler.favouriteOnSnatch) {
        await searchHandler.updateFavForMultipleItems(
          searchHandler.currentSelected,
          newValue: true,
          skipSnatching: true,
        );
      }
      await Future.delayed(const Duration(milliseconds: 100));
      searchHandler.currentTab.selected.clear();
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: const Text('No items selected', style: TextStyle(fontSize: 20)),
        overrideLeadingIconWidget: const Kaomoji(
          type: KaomojiType.angryHandsUp,
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }

  Future<void> onRetryFailedItem(
    ({Booru booru, BooruItem item}) record,
    bool isExists,
    bool isLongTap,
  ) async {
    setState(() {
      updating = true;
    });

    if (record.booru.type == BooruType.Sankaku) {
      try {
        // TODO detect when item data is outdated?
        // TODO expand to other boorus?
        final temp = BooruHandlerFactory().getBooruHandler([record.booru], 10);
        final sankakuHandler = temp[0] as SankakuHandler;
        await sankakuHandler.loadItem(item: record.item);
      } catch (_) {}
    }
    snatchHandler.onRetryItem(
      record,
      cooldown: settingsHandler.snatchCooldown,
      ignoreExists: isExists || isLongTap,
    );

    setState(() {
      updating = false;
    });
  }

  Future<void> onRetryAllFailed(bool isLongTap) async {
    setState(() {
      updating = true;
    });

    await snatchHandler.onRetryAll(
      cooldown: settingsHandler.snatchCooldown,
      ignoreExists: isLongTap,
    );

    setState(() {
      updating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO better design?
    // TODO detailed dl speed info
    // TODO rework snatchhandler? drop the queue and just use a single list?

    // print('build downloads drawer');

    final ScrollController scrollController = ScrollController();

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final int queuesLength = snatchHandler.queuedList.length;
                  final int activeLength = snatchHandler.current.value != null
                      ? snatchHandler.current.value!.booruItems.length - snatchHandler.queueProgress.value
                      : 0;
                  final int totalActiveAmount = queuesLength + activeLength;

                  final int existsLength = snatchHandler.existsItems.length;
                  final int failedLength = snatchHandler.failedItems.length;
                  final int cancelledLength = snatchHandler.cancelledItems.length;
                  final int totalRetryableAmount = existsLength + failedLength + cancelledLength;

                  if (totalActiveAmount == 0 && totalRetryableAmount == 0) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Kaomoji(
                            type: KaomojiType.shrug,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'No items queued',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  }

                  if (totalActiveAmount != 0) {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: totalActiveAmount,
                      itemExtent: 200,
                      itemBuilder: (BuildContext context, int index) {
                        if (activeLength != 0 && index < activeLength) {
                          final item =
                              snatchHandler.current.value!.booruItems[snatchHandler.queueProgress.value + index];
                          return Stack(
                            children: [
                              if (index == 0)
                                Positioned.fill(
                                  bottom: 0,
                                  left: 0,
                                  child: Obx(() {
                                    if (snatchHandler.total.value == 0) {
                                      return const SizedBox.shrink();
                                    }

                                    return AnimatedProgressIndicator(
                                      value: snatchHandler.currentProgress,
                                      valueColor: Theme.of(
                                        context,
                                      ).progressIndicatorTheme.color?.withValues(alpha: 0.5),
                                      indicatorStyle: IndicatorStyle.linear,
                                      borderRadius: 0,
                                      animationDuration: const Duration(milliseconds: 100),
                                    );
                                  }),
                                ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: SizedBox(
                                          width: 100,
                                          height: 150,
                                          child: ThumbnailBuild(
                                            item: item,
                                            selectable: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Obx(
                                          () => Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              if (snatchHandler.current.value!.booruItems.length != 1)
                                                Text(
                                                  '${snatchHandler.queueProgress.value + index + 1}/${snatchHandler.current.value!.booruItems.length}',
                                                  style: const TextStyle(fontSize: 16),
                                                ),
                                              //
                                              if (index == 0)
                                                CancelButton(
                                                  withIcon: true,
                                                  customIcon: Icons.cancel_outlined,
                                                  action: snatchHandler.onCancel,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                  //
                                  if (index == 0)
                                    Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: Row(
                                          children: [
                                            if (snatchHandler.total.value != 0)
                                              Text(
                                                '${Tools.formatBytes(
                                                  snatchHandler.received.value,
                                                  2,
                                                  withSpace: false,
                                                )}/${Tools.formatBytes(
                                                  snatchHandler.total.value,
                                                  2,
                                                  withSpace: false,
                                                )}',
                                                style: const TextStyle(fontSize: 16),
                                              )
                                            else
                                              const SizedBox.shrink(),
                                            const Spacer(),
                                            if (snatchHandler.total.value != 0)
                                              Text(
                                                '${(snatchHandler.currentProgress * 100.0).toStringAsFixed(2)}%',
                                                style: const TextStyle(fontSize: 16),
                                              )
                                            else
                                              const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          final int queueIndex = lerpDouble(
                            0,
                            max(0, queuesLength - 1),
                            (index - activeLength) / (queuesLength - 1),
                          )!.toInt();
                          final queue = snatchHandler.queuedList[queueIndex];
                          final firstItem = queue.booruItems.first;
                          final lastItem = queue.booruItems.last;

                          return Row(
                            children: [
                              Stack(
                                children: [
                                  if (firstItem != lastItem) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                      child: SizedBox(
                                        width: 100,
                                        height: 134,
                                        child: ThumbnailBuild(
                                          item: lastItem,
                                          selectable: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: ThumbnailBuild(
                                        item: firstItem,
                                        selectable: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                queue.booruItems.length == 1
                                    ? 'Item #$queueIndex'
                                    : 'Batch #$queueIndex (${queue.booruItems.length})',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          );
                        }
                      },
                    );
                  }

                  if (totalRetryableAmount != 0) {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: totalRetryableAmount,
                      itemExtent: 200,
                      itemBuilder: (BuildContext context, int index) {
                        final bool isExists = index < existsLength;
                        final bool isFailed = index < existsLength + failedLength;
                        // final bool isCancelled = index < existsLength + failedLength + cancelledLength;

                        final record = isExists
                            ? snatchHandler.existsItems[index]
                            : isFailed
                            ? snatchHandler.failedItems[index - existsLength]
                            : snatchHandler.cancelledItems[index - existsLength - failedLength];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: ThumbnailBuild(
                                      item: record.item,
                                      selectable: false,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    spacing: 8,
                                    children: [
                                      Text(
                                        isExists
                                            ? 'File already exists'
                                            : isFailed
                                            ? 'Failed to download'
                                            : 'Cancelled by user',
                                      ),
                                      RetryButton(
                                        text: isExists ? 'Save anyway' : 'Retry',
                                        withIcon: true,
                                        onTap: () => onRetryFailedItem(record, isExists, false),
                                        onLongTap: () => onRetryFailedItem(record, isExists, true),
                                      ),
                                      DeleteButton(
                                        text: 'Skip',
                                        customIcon: Icons.skip_next,
                                        action: () => snatchHandler.onRemoveRetryItem(record),
                                        withIcon: true,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                }),
              ),
              //
              Stack(
                children: [
                  Obx(
                    () => AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      alignment: Alignment.bottomCenter,
                      child: (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty)
                          ? ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.sizeOf(context).height * (snatchHandler.queuedList.isEmpty ? 0.7 : 0.5),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: Scrollbar(
                                  controller: scrollController,
                                  thumbVisibility: true,
                                  interactive: true,
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Obx(
                                          () => AnimatedSize(
                                            duration: const Duration(milliseconds: 200),
                                            alignment: Alignment.bottomCenter,
                                            child: snatchHandler.queuedList.isEmpty
                                                ? const SizedBox.shrink()
                                                : SettingsButton(
                                                    drawBottomBorder: false,
                                                    drawTopBorder: true,
                                                    action: () {
                                                      if (snatchHandler.active.value) {
                                                        snatchHandler.active.value = false;
                                                      } else {
                                                        if (snatchHandler.current.value == null) {
                                                          snatchHandler.trySnatch();
                                                        } else {
                                                          snatchHandler.active.value = true;
                                                        }
                                                      }
                                                    },
                                                    icon: snatchHandler.active.value
                                                        ? const Icon(Icons.pause)
                                                        : const Icon(Icons.play_arrow),
                                                    name: snatchHandler.active.value ? 'Pause' : 'Unpause',
                                                    subtitle: snatchHandler.active.value
                                                        ? const Text('(from next item in queue)')
                                                        : null,
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => AnimatedSize(
                                            duration: const Duration(milliseconds: 200),
                                            alignment: Alignment.bottomCenter,
                                            child:
                                                snatchHandler.active.value ||
                                                    (snatchHandler.existsItems.isEmpty &&
                                                        snatchHandler.failedItems.isEmpty &&
                                                        snatchHandler.cancelledItems.isEmpty)
                                                ? const SizedBox.shrink()
                                                : SettingsButton(
                                                    drawBottomBorder: false,
                                                    drawTopBorder: true,
                                                    action: () => onRetryAllFailed(false),
                                                    onLongPress: () => onRetryAllFailed(true),
                                                    icon: const Icon(Icons.refresh),
                                                    name:
                                                        'Retry all (${snatchHandler.existsItems.length + snatchHandler.failedItems.length + snatchHandler.cancelledItems.length})',
                                                    subtitle: const Text('Existing, failed or cancelled items'),
                                                  ),
                                          ),
                                        ),
                                        Obx(
                                          () => AnimatedSize(
                                            duration: const Duration(milliseconds: 200),
                                            alignment: Alignment.bottomCenter,
                                            child:
                                                snatchHandler.active.value ||
                                                    (snatchHandler.existsItems.isEmpty &&
                                                        snatchHandler.failedItems.isEmpty &&
                                                        snatchHandler.cancelledItems.isEmpty)
                                                ? const SizedBox.shrink()
                                                : SettingsButton(
                                                    drawBottomBorder: false,
                                                    drawTopBorder: true,
                                                    action: snatchHandler.onClearRetryableItems,
                                                    icon: const Icon(Icons.delete_forever),
                                                    name: 'Clear all retryable items',
                                                  ),
                                          ),
                                        ),
                                        Obx(() {
                                          final selected = searchHandler.currentSelected;
                                          if (selected.isNotEmpty) {
                                            final int favSelectedCount = selected
                                                .where((item) => item.isFavourite.value == true)
                                                .length;
                                            final int unfavSelectedCount = selected
                                                .where((item) => item.isFavourite.value == false)
                                                .length;
                                            final bool hasFavsSelected = favSelectedCount > 0;
                                            final bool isAllSelectedFavs = selected.length == favSelectedCount;

                                            final int downloadsSelectedCount = selected
                                                .where((item) => item.isSnatched.value == true)
                                                .length;
                                            final bool hasDownloadsSelected = downloadsSelectedCount > 0;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SettingsButton(
                                                  name: 'Snatch selected (${selected.length.toFormattedString()})',
                                                  icon: const Icon(Icons.download_sharp),
                                                  action: () => onStartSnatching(context, false),
                                                  onLongPress: () => onStartSnatching(context, true),
                                                  drawTopBorder: true,
                                                ),
                                                if (hasDownloadsSelected)
                                                  SettingsButton(
                                                    name:
                                                        'Remove snatched status from selected (${downloadsSelectedCount.toFormattedString()})',
                                                    icon: const Icon(Icons.file_download_off_outlined),
                                                    action: () async {
                                                      final onlySnatched = searchHandler.currentSelected
                                                          .where((e) => e.isSnatched.value == true)
                                                          .toList();
                                                      if (onlySnatched.length > 20) {
                                                        // TODO confirm dialog
                                                      }
                                                      updating = true;
                                                      setState(() {});
                                                      for (final item in onlySnatched) {
                                                        item.isSnatched.value = false;
                                                        await settingsHandler.dbHandler.updateBooruItem(
                                                          item,
                                                          BooruUpdateMode.local,
                                                        );
                                                      }
                                                      searchHandler.currentTab.selected.clear();
                                                      updating = false;
                                                      setState(() {});
                                                    },
                                                  ),
                                                if (!isAllSelectedFavs)
                                                  SettingsButton(
                                                    name:
                                                        'Favourite selected (${unfavSelectedCount.toFormattedString()})',
                                                    icon: const Icon(Icons.favorite, color: Colors.red),
                                                    action: () async {
                                                      final onlyUnfavs = searchHandler.currentSelected
                                                          .where((e) => e.isFavourite.value == false)
                                                          .toList();
                                                      if (onlyUnfavs.length > 20) {
                                                        // TODO confirm dialog
                                                      }
                                                      updating = true;
                                                      setState(() {});
                                                      await searchHandler.updateFavForMultipleItems(
                                                        searchHandler.currentFetched
                                                            .where(onlyUnfavs.contains)
                                                            .toList(),
                                                        newValue: true,
                                                      );
                                                      searchHandler.currentTab.selected.clear();
                                                      updating = false;
                                                      setState(() {});
                                                    },
                                                  ),
                                                if (hasFavsSelected)
                                                  SettingsButton(
                                                    name:
                                                        'Unfavourite selected (${favSelectedCount.toFormattedString()})',
                                                    icon: const Icon(Icons.favorite_border),
                                                    action: () async {
                                                      final onlyFavs = searchHandler.currentSelected
                                                          .where((e) => e.isFavourite.value == true)
                                                          .toList();
                                                      if (onlyFavs.length > 20) {
                                                        // TODO confirm dialog
                                                      }
                                                      updating = true;
                                                      setState(() {});
                                                      await searchHandler.updateFavForMultipleItems(
                                                        searchHandler.currentFetched.where(onlyFavs.contains).toList(),
                                                        newValue: false,
                                                      );
                                                      searchHandler.currentTab.selected.clear();
                                                      updating = false;
                                                      setState(() {});
                                                    },
                                                  ),
                                                SettingsButton(
                                                  name: 'Clear selected',
                                                  icon: const Icon(Icons.delete_forever),
                                                  action: () => searchHandler.currentTab.selected.clear(),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return SettingsButton(
                                              name: 'Select all',
                                              icon: const Icon(Icons.select_all),
                                              action: () => searchHandler.currentTab.selected.addAll(
                                                searchHandler.currentFetched,
                                              ),
                                              drawTopBorder: true,
                                            );
                                          }
                                        }),
                                        SettingsButton(
                                          name: 'Snatcher',
                                          icon: const Icon(Icons.download_sharp),
                                          page: () => const SnatcherPage(),
                                        ),
                                        SettingsButton(
                                          name: 'Snatching History',
                                          icon: const Icon(Icons.file_download_outlined),
                                          action: () {
                                            final Booru? downloadsBooru = settingsHandler.booruList.firstWhereOrNull(
                                              (booru) => booru.type == BooruType.Downloads,
                                            );
                                            final bool hasDownloads = downloadsBooru != null;

                                            if (!hasDownloads) {
                                              return;
                                            }

                                            searchHandler.addTabByString(
                                              '',
                                              switchToNew: true,
                                              customBooru: downloadsBooru,
                                            );
                                            widget.toggleDrawer();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  //
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: updating
                          ? Container(
                              alignment: Alignment.center,
                              color: Colors.black.withValues(alpha: 0.66),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 10),
                                  Text('Updating data...'),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MergeBooruToggleAndSelector extends StatelessWidget {
  const MergeBooruToggleAndSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      if (settingsHandler.booruList.length < 2 || searchHandler.list.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          SettingsToggle(
            title: 'Multibooru mode',
            value: searchHandler.currentSecondaryBoorus.value?.isNotEmpty ?? false,
            drawBottomBorder: searchHandler.currentSecondaryBoorus.value?.isEmpty ?? true,
            onChanged: (newValue) {
              if (settingsHandler.booruList.length < 2) {
                FlashElements.showSnackbar(
                  context: context,
                  title: const Text(
                    'Error!',
                    style: TextStyle(fontSize: 20),
                  ),
                  content: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('You need at least 2 booru configs to use this feature!'),
                    ],
                  ),
                  leadingIcon: Icons.error,
                  leadingIconColor: Colors.red,
                );
              } else {
                if (newValue) {
                  final dropdown = LoliMultiselectDropdown(
                    value: const <Booru>[],
                    onChanged: (List<Booru> value) {
                      // if no secondary boorus selected, disable merge mode
                      searchHandler.mergeAction(value.isNotEmpty ? value : null);
                    },
                    items: settingsHandler.booruList,
                    itemBuilder: (item) => Container(
                      padding: const EdgeInsets.only(left: 16),
                      height: kMinInteractiveDimension,
                      child: TabBooruSelectorItem(booru: item),
                    ),
                    labelText: 'Select secondary boorus:',
                    selectedItemBuilder: (List<Booru> value) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: [
                            for (final item in value)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: TabBooruSelectorItem(
                                  booru: item,
                                  compact: true,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                  dropdown.showDialog(context);
                } else {
                  searchHandler.mergeAction(null);
                }
              }
            },
          ),
          Obx(() {
            final bool hasTabsAndTabHasSecondaryBoorus =
                searchHandler.list.isNotEmpty && (searchHandler.currentSecondaryBoorus.value?.isNotEmpty ?? false);

            return AnimatedSize(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topCenter,
              child: (settingsHandler.booruList.length > 1 && hasTabsAndTabHasSecondaryBoorus)
                  ? const TabSecondaryBooruSelector()
                  : const SizedBox.shrink(),
            );
          }),
        ],
      );
    });
  }
}
