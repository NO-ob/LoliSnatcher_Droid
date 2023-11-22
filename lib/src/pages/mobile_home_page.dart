import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:logger_flutter_fork/logger_flutter_fork.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/pages/snatcher_page.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/mascot_image.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/media_previews.dart';
import 'package:lolisnatcher/src/widgets/root/main_appbar.dart';
import 'package:lolisnatcher/src/widgets/search/tag_search_box.dart';
import 'package:lolisnatcher/src/widgets/search/tag_search_button.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_buttons.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

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

  Future<void> _onPopInvoked(bool didPop) async {
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
          actionButtons: <Widget>[
            ElevatedButton.icon(
              label: const Text('Yes'),
              icon: const Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false;
  }

  void _onMenuLongTap() {
    ServiceHandler.vibrate();
    // scroll to start on long press of menu buttons
    searchHandler.gridScrollController.jumpTo(0);
  }

  Widget menuButton(InnerDrawerDirection direction) {
    return GestureDetector(
      onLongPress: _onMenuLongTap,
      onSecondaryTap: _onMenuLongTap,
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        onPressed: () {
          _toggleDrawer(direction);

          // if(mainScaffoldKey.currentState?.isEndDrawerOpen == true) {
          // } else {
          //   mainScaffoldKey.currentState?.openEndDrawer();
          // }
        },
      ),
    );
  }

  Widget snatcherButton(InnerDrawerDirection direction) {
    return Obx(() {
      if (searchHandler.list.isNotEmpty) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: Icon(
                Icons.save,
                color: Theme.of(context).appBarTheme.iconTheme?.color,
              ),
              onPressed: () async {
                _toggleDrawer(direction);
              },
            ),
            if (searchHandler.currentTab.selected.isNotEmpty)
              Positioned(
                right: -0,
                top: 8,
                child: IgnorePointer(
                  child: Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          searchHandler.currentTab.selected.length.toFormattedString(),
                          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
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
          backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.background),

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
            if (!isOpen) {
              if (searchHandler.searchBoxFocus.hasFocus) {
                searchHandler.searchBoxFocus.unfocus();
              }
            }
          }, // return  true (open) or false (close)

          leftChild: settingsHandler.handSide.value.isLeft ? const MainDrawer() : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),
          rightChild: settingsHandler.handSide.value.isRight ? const MainDrawer() : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),

          // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
          scaffold: Scaffold(
            key: mainScaffoldKey,
            resizeToAvoidBottomInset: false,
            // appBar: MainAppBar(leading: menuButton(InnerDrawerDirection.start), trailing: menuButton(InnerDrawerDirection.end)),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: SafeArea(
              top: false,
              bottom: false,
              child: PopScope(
                canPop: false,
                onPopInvoked: _onPopInvoked,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const MediaPreviews(),
                    Obx(
                      () => MainAppBar(
                        leading: settingsHandler.handSide.value.isLeft ? menuButton(InnerDrawerDirection.start) : snatcherButton(InnerDrawerDirection.start),
                        trailing: settingsHandler.handSide.value.isRight ? menuButton(InnerDrawerDirection.end) : snatcherButton(InnerDrawerDirection.end),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Old drawer stuff:
            // drawer: MainDrawer(key: mainDrawerKey),
            // endDrawer: MainDrawer(key: mainDrawerKey),
            // drawerEnableOpenDragGesture: true,
            // endDrawerEnableOpenDragGesture: true,
            // drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2, // allows to detect horizontal swipes on the whole screen => open drawer by swiping right-to-left
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
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: <Widget>[
              Obx(() {
                if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(2, 15, 2, 15),
                    width: double.infinity,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        //Tags/Search field
                        TagSearchBox(),
                        TagSearchButton(),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              Expanded(
                child: Listener(
                  onPointerDown: (event) {
                    // print("pointer down");
                    if (searchHandler.searchBoxFocus.hasFocus) {
                      searchHandler.searchBoxFocus.unfocus();
                    }
                  },
                  child: ListView(
                    controller: ScrollController(), // needed to avoid exception when list overflows into a scrollable size
                    children: [
                      const TabSelector(),
                      const TabButtons(true, WrapAlignment.spaceEvenly),
                      const TabBooruSelector(true),
                      const MergeBooruToggle(),
                      Obx(() {
                        final bool hasTabsAndTabHasSecondaryBoorus =
                            searchHandler.list.isNotEmpty && (searchHandler.currentTab.secondaryBoorus?.isNotEmpty ?? false);
                        if (settingsHandler.booruList.length > 1 && hasTabsAndTabHasSecondaryBoorus) {
                          return const TabBooruSelector(false);
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      //
                      Obx(() {
                        if (settingsHandler.isDebug.value) {
                          return SettingsButton(
                            name: 'Open Alice',
                            icon: const Icon(Icons.developer_board),
                            action: () {
                              settingsHandler.alice.showInspector();
                            },
                            drawTopBorder: true,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      //
                      Obx(() {
                        if (settingsHandler.isDebug.value && settingsHandler.enabledLogTypes.isNotEmpty) {
                          return SettingsButton(
                            name: 'Open Logger',
                            icon: const Icon(Icons.print),
                            action: () {
                              LogConsole.open(
                                context,
                                showCloseButton: true,
                                showClearButton: true,
                                dark: Theme.of(context).brightness == Brightness.dark,
                                onExport: (String text) {
                                  Clipboard.setData(ClipboardData(text: text));
                                },
                              );
                            },
                            drawTopBorder: true,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      SettingsButton(
                        name: 'Settings',
                        icon: const Icon(Icons.settings),
                        page: () => const SettingsPage(),
                      ),
                      //
                      Obx(() {
                        if (settingsHandler.updateInfo.value != null) {
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
                      //
                      if (settingsHandler.enableDrawerMascot) const MascotImage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadsDrawer extends StatelessWidget {
  const DownloadsDrawer({
    required this.toggleDrawer,
    super.key,
  });

  final void Function() toggleDrawer;

  Future<void> onStartSnatching(BuildContext context, bool isLongTap) async {
    final SnatchHandler snatchHandler = SnatchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

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
    // call a function to save the currently viewed image when the save button is pressed
    if (searchHandler.currentTab.selected.isNotEmpty) {
      snatchHandler.queue(
        [...searchHandler.currentTab.selected],
        searchHandler.currentBooru,
        settingsHandler.snatchCooldown,
        isLongTap,
      );
      await Future.delayed(const Duration(milliseconds: 100));
      searchHandler.currentTab.selected.value = [];
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

  @override
  Widget build(BuildContext context) {
    final SnatchHandler snatchHandler = SnatchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    // TODO better design?
    // TODO rework snatchhandler? drop the queue and just use a single list?

    // print('build downloads drawer');

    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Obx(() {
                if (snatchHandler.queuedList.isEmpty && snatchHandler.current.value == null) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: (snatchHandler.active.value == false && snatchHandler.current.value != null)
                        ? null
                        : () {
                            if (snatchHandler.active.value) {
                              snatchHandler.active.value = false;
                            } else {
                              snatchHandler.trySnatch();
                            }
                          },
                    child: Text(
                      snatchHandler.active.value
                          ? 'Pause (from next queue)'
                          : snatchHandler.current.value != null
                              ? 'Wait'
                              : 'Continue',
                    ),
                  ),
                );
              }),
              Expanded(
                child: Obx(() {
                  // final queuedLengths = snatchHandler.queuedList.map((e) => e.booruItems.length);
                  // final int queuedItemsLength = queuedLengths.isEmpty ? 0 : queuedLengths.reduce((value, e) => value + e);
                  final int queuesAmount = snatchHandler.queuedList.length;
                  final int activeLength =
                      snatchHandler.current.value != null ? snatchHandler.current.value!.booruItems.length - snatchHandler.queueProgress.value : 0;

                  if (activeLength == 0 && queuesAmount == 0) {
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

                  return ListView.builder(
                    // controller: ScrollController(),
                    itemCount: activeLength + queuesAmount,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < activeLength) {
                        final item = snatchHandler.current.value!.booruItems[snatchHandler.queueProgress.value + index];
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

                                  return LinearProgressIndicator(
                                    value: snatchHandler.received.value / snatchHandler.total.value,
                                    color: Theme.of(context).progressIndicatorTheme.color?.withOpacity(0.5),
                                  );
                                }),
                              ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: ThumbnailBuild(
                                      item: item,
                                      // isStandalone: true,
                                      // ignoreColumnsCount: true,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${snatchHandler.queueProgress.value + index + 1}/${snatchHandler.current.value!.booruItems.length}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                if (index == 0) ...[
                                  const Spacer(),
                                  Obx(
                                    () => Text(
                                      snatchHandler.total.value == 0
                                          ? '...%'
                                          : '${((snatchHandler.received.value / snatchHandler.total.value) * 100.0).toStringAsFixed(2)}%',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        );
                      } else {
                        final int queueIndex = (queuesAmount - 1) + (index - activeLength - (activeLength == 0 ? 0 : 1));
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
                                        // isStandalone: true,
                                        // ignoreColumnsCount: true,
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
                                      // isStandalone: true,
                                      // ignoreColumnsCount: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Queue #$queueIndex (${queue.booruItems.length})',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                      }
                    },
                  );
                }),
              ),
              //
              Obx(() {
                if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Obx(() {
                          final selected = searchHandler.currentTab.selected;
                          if (selected.isNotEmpty) {
                            return Column(
                              children: [
                                SettingsButton(
                                  name: 'Snatch selected items (${searchHandler.currentTab.selected.length.toFormattedString()})',
                                  icon: const Icon(Icons.download_sharp),
                                  action: () => onStartSnatching(context, false),
                                  onLongPress: () => onStartSnatching(context, true),
                                  drawTopBorder: true,
                                  drawBottomBorder: false,
                                ),
                                SettingsButton(
                                  name: 'Clear selected items',
                                  icon: const Icon(Icons.delete_forever),
                                  action: () => searchHandler.currentTab.selected.clear(),
                                  drawTopBorder: true,
                                  drawBottomBorder: false,
                                ),
                              ],
                            );
                          } else {
                            return SettingsButton(
                              name: 'Select all items',
                              icon: const Icon(Icons.select_all),
                              action: () => searchHandler.currentTab.selected.addAll(searchHandler.currentFetched),
                              drawTopBorder: true,
                              drawBottomBorder: false,
                            );
                          }
                        }),
                        SettingsButton(
                          name: 'Snatcher',
                          icon: const Icon(Icons.download_sharp),
                          page: () => const SnatcherPage(),
                          drawTopBorder: true,
                        ),
                        SettingsButton(
                          name: 'Snatching History',
                          icon: const Icon(Icons.file_download_outlined),
                          action: () {
                            final Booru? downloadsBooru = settingsHandler.booruList.firstWhereOrNull((booru) => booru.type == BooruType.Downloads);
                            final bool hasDownloads = downloadsBooru != null;

                            if (!hasDownloads) {
                              return;
                            }

                            searchHandler.addTabByString(
                              '',
                              switchToNew: true,
                              customBooru: downloadsBooru,
                            );
                            toggleDrawer();
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MergeBooruToggle extends StatelessWidget {
  const MergeBooruToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final SettingsHandler settingsHandler = SettingsHandler.instance;
      final SearchHandler searchHandler = SearchHandler.instance;

      if (settingsHandler.booruList.length < 2 || searchHandler.list.isEmpty) {
        return const SizedBox.shrink();
      }

      return SettingsToggle(
        title: 'Multibooru Mode',
        value: searchHandler.currentTab.secondaryBoorus?.isNotEmpty ?? false,
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
            final firstAvailableBooru = settingsHandler.booruList.firstWhereOrNull((booru) => booru != searchHandler.currentBooru);
            if (firstAvailableBooru != null) {
              searchHandler.mergeAction(newValue ? [firstAvailableBooru] : null);
            }
          }
        },
      );
    });
  }
}
