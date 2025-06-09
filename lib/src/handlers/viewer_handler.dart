import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';

// TODO media actions, video pause/mute... global controller

class ViewerHandler {
  static ViewerHandler get instance => GetIt.instance<ViewerHandler>();

  static ViewerHandler register() {
    if (!GetIt.instance.isRegistered<ViewerHandler>()) {
      GetIt.instance.registerSingleton(ViewerHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<ViewerHandler>();

  // Keys to get states of all currently built viewers
  final RxList<GlobalKey?> activeKeys = RxList([]);
  // Key of the currently viewed media widget
  final Rxn<GlobalKey> currentKey = Rxn(null);

  // Add media widget key
  void addViewed(Key? key) {
    if (key == null || activeKeys.contains(key)) {
      return;
    }

    if (key is GlobalKey) {
      activeKeys.add(key);
    }
  }

  // Remove media widget key
  void removeViewed(Key? key) {
    if (key == null || !activeKeys.contains(key)) {
      return;
    }

    if (key is GlobalKey) {
      activeKeys.remove(key);
    }
  }

  // Set the key of current viewed widget
  void setCurrent(Key? key) {
    if (key == null || currentKey.value == key) {
      return;
    }

    if (key is GlobalKey) {
      currentKey.value = key;
    }
    setNewState(key);
  }

  // Drop the key of viewed widget and reset the handler state
  // (used when user exits the viewerpage)
  void dropCurrent() {
    currentKey.value = null;
    resetState();
  }

  // Viewer state stuff
  final RxBool inViewer = false.obs; // is in viewerpage
  final RxBool displayAppbar = true.obs; // is gallery toolbar visible
  final RxBool isZoomed = false.obs; // is current item zoomed in
  final RxBool isLoaded = false.obs; // is current item loaded
  final Rx<PhotoViewControllerValue?> viewState = Rx(null); // current view controller value
  final RxBool isFullscreen = false.obs; // is in fullscreen (on mobile for videos through VideoViewer)
  final RxBool isDesktopFullscreen = false.obs; // is in fullscreen mode in DesktopHome

  final RxBool showNotes = true.obs;

  void resetState() {
    inViewer.value = false;
    displayAppbar.value = true;
    isZoomed.value = false;
    isLoaded.value = false;
    isFullscreen.value = false;
    isDesktopFullscreen.value = false;
    viewState.value = null;
  }

  // Get zoom state of new current item
  void setNewState(Key? key) {
    if (key == null || currentKey.value != key) {
      return;
    }

    // addPostFrameCallback waits until widget is built to avoid calling setState in it while other setState is active
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = currentKey.value?.currentState;
      switch (state?.widget) {
        case ImageViewer():
          final widgetState = state! as ImageViewerState;
          isZoomed.value = widgetState.isZoomed.value;
          isLoaded.value = widgetState.isLoaded.value;
          isFullscreen.value = false;
          viewState.value = widgetState.viewController.value;
          break;
        case VideoViewer():
          final widgetState = state! as VideoViewerState;
          isZoomed.value = widgetState.isZoomed.value;
          isLoaded.value = widgetState.isVideoInited;
          isFullscreen.value = widgetState.chewieController.value?.isFullScreen ?? false;
          viewState.value = widgetState.viewController.value;
          break;
        default:
          isZoomed.value = false;
          isLoaded.value = true;
          isFullscreen.value = false;
          viewState.value = null;
          break;
      }
    });
  }

  // Set zoom state, called by the current item itself
  void setZoomed(Key? key, bool isZoom) {
    if (key == null || currentKey.value != key) {
      return;
    }

    isZoomed.value = isZoom;
  }

  // toggle item's zoom state
  void toggleZoom() {
    isZoomed.value ? resetZoom() : doubleTapZoom();
  }

  void resetZoom() {
    final dynamic state = currentKey.value?.currentState;
    state?.resetZoom?.call();
  }

  void doubleTapZoom() {
    final dynamic state = currentKey.value?.currentState;
    state?.doubleTapZoom?.call();
  }

  void toggleMuteAllVideos({bool mute = true}) {
    for (final key in activeKeys) {
      final state = key?.currentState;
      switch (state?.widget) {
        case VideoViewer():
          (state as VideoViewerState?)?.videoController.value?.setVolume(mute ? 0 : 1);
          break;
        default:
          break;
      }
    }
  }

  void pauseAllVideos() {
    for (final key in activeKeys) {
      final state = key?.currentState;
      switch (state?.widget) {
        case VideoViewer():
          (state as VideoViewerState?)?.videoController.value?.pause();
          break;
        default:
          break;
      }
    }
  }

  void hideExtraUi() {
    for (final key in activeKeys) {
      final state = key?.currentState;
      switch (state?.widget) {
        case ImageViewer():
          (state as ImageViewerState?)?.showLoading.value = false;
          break;
        case VideoViewer():
          (state as VideoViewerState?)?.showControls.value = false;
          break;
        default:
          break;
      }
    }
  }

  void showExtraUi() {
    for (final key in activeKeys) {
      final state = key?.currentState;
      switch (state?.widget) {
        case ImageViewer():
          (state as ImageViewerState?)?.showLoading.value = true;
          break;
        case VideoViewer():
          (state as VideoViewerState?)?.showControls.value = true;
          break;
        default:
          break;
      }
    }
  }

  void setViewValue(Key? key, PhotoViewControllerValue value) {
    if (key == null || currentKey.value != key) {
      return;
    }

    viewState.value = value;
  }

  void setLoaded(Key? key, bool value) {
    if (key == null || currentKey.value != key || isLoaded.value == value) {
      return;
    }

    isLoaded.value = value;
  }

  void toggleToolbar(
    bool isLongTap, {
    bool? forcedNewValue,
  }) {
    final bool newAppbarVisibility = forcedNewValue ?? !displayAppbar.value;
    displayAppbar.value = newAppbarVisibility;

    if (isLongTap) {
      ServiceHandler.vibrate();
    }

    final searchHandler = SearchHandler.instance;
    final settingsHandler = SettingsHandler.instance;

    // enable volume buttons if current page is a video AND appbar is set to visible
    final bool isVideo = searchHandler.currentFetched[searchHandler.viewedIndex.value].mediaType.value.isVideo;
    final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
  }

  // Related to videos
  bool videoAutoMute = kDebugMode
      ? Constants.blurImagesDefaultDev
      : false; // hold volume button in VideoViewer to mute videos globally

  // ViewerHandler() {
  //   // debug: print keys list changes
  //   activeKeys.listen((keys) {
  //     print('Viewing: $keys');
  //   });

  //   currentKey.listen((key) {
  //     // debug: print current key change and what widget it represents
  //     dynamic widget = key?.currentState?.widget;
  //     print('Current: $key');
  //     print('Current url: ${widget?.booruItem?.fileURL}');
  //     print('Widget type: ${widget.runtimeType}');
  //   });
  // }
}
