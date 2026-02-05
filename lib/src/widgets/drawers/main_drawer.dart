import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FirstWhereOrNullExt;

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/mascot_image.dart';
import 'package:lolisnatcher/src/widgets/common/multibooru_toggle.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_bar.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_buttons.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    Future<Booru?> showSelectWebviewBooruDialog(List<Booru> boorus) async {
      return showDialog<Booru?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(context.loc.mobileHome.selectBooruForWebview),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: SettingsBooruDropdown(
                    value: null,
                    items: boorus,
                    onChanged: (Booru? newBooru) {
                      if (newBooru == null) return;

                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        Navigator.of(context).pop(newBooru);
                      });
                    },
                    title: context.loc.booru,
                    contentPadding: EdgeInsets.zero,
                    drawBottomBorder: false,
                  ),
                ),
                //
                const CancelButton(withIcon: true),
              ],
            ),
          );
        },
      );
    }

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            RepaintBoundary(
              child: Obx(() {
                if (settingsHandler.booruList.isNotEmpty && searchHandler.tabs.isNotEmpty) {
                  return Container(
                    height: MainSearchBar.height,
                    margin: const EdgeInsets.fromLTRB(2, 24, 2, 12),
                    child: const MainSearchBarWithActions('drawer'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ),
            const TabSelector(),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                clipBehavior: Clip.antiAlias,
                children: [
                  const SizedBox(height: 12),
                  const TabButtons(true, WrapAlignment.spaceEvenly),
                  const SizedBox(height: 12),
                  const MergeBooruToggleAndSelector(),
                  ListenableBuilder(
                    listenable: Listenable.merge([
                      LocalAuthHandler.instance.deviceSupportsBiometrics,
                      SettingsHandler.instance.useLockscreen,
                    ]),
                    builder: (_, child) {
                      final deviceSupportsBiometrics = LocalAuthHandler.instance.deviceSupportsBiometrics.value;
                      final useLockscreen = SettingsHandler.instance.useLockscreen.value;

                      if (deviceSupportsBiometrics && useLockscreen) {
                        return child!;
                      }

                      return const SizedBox.shrink();
                    },
                    child: SettingsButton(
                      name: context.loc.mobileHome.lockApp,
                      icon: const Icon(Icons.lock),
                      action: () => LocalAuthHandler.instance.lock(manually: true),
                    ),
                  ),
                  SettingsButton(
                    name: context.loc.settings.title,
                    icon: const Icon(Icons.settings),
                    page: () => const SettingsPage(),
                  ),
                  Obx(() {
                    if (settingsHandler.booruList.isNotEmpty &&
                        searchHandler.tabs.isNotEmpty &&
                        Tools.isOnPlatformWithWebviewSupport) {
                      final List<Booru> boorus = [
                        searchHandler.currentBooru,
                        ...searchHandler.currentSecondaryBoorus.value ?? <Booru>[],
                      ].where((b) => b.baseURL?.isNotEmpty == true && BooruType.saveable.contains(b.type)).toList();

                      if (boorus.isEmpty) return const SizedBox.shrink();

                      return SettingsButton(
                        name: context.loc.settings.webview.openWebview,
                        icon: const Icon(Icons.public),
                        action: () async {
                          final Booru? selectedBooru = boorus.length == 1
                              ? boorus.first
                              : await showSelectWebviewBooruDialog(boorus);
                          if (selectedBooru == null) return;

                          final String? url = selectedBooru.baseURL;
                          final String userAgent = Tools.browserUserAgent;
                          if (url == null || url.isEmpty) {
                            return;
                          }

                          unawaited(
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InAppWebviewView(
                                  initialUrl: url,
                                  userAgent: userAgent,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  }),
                  //
                  Obx(() {
                    if (settingsHandler.updateInfo.value != null &&
                        Constants.updateInfo.buildNumber < (settingsHandler.updateInfo.value!.buildNumber)) {
                      return SettingsButton(
                        name: context.loc.settings.checkForUpdates.updateAvailable,
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
                    }

                    return const SizedBox.shrink();
                  }),
                  if (SettingsHandler.isDesktopPlatform)
                    SettingsButton(
                      name: context.loc.closeTheApp,
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
    );
  }
}
